const { pool } = require('../db');

const getDashboardData = async (req, res) => {
  try {
    const [
      activeCrops,
      harvestedCrops,
      totalFields,
      upcomingHarvests,
      upcomingWateringRaw,
      recentJournals,
      typeDistribution,
      averageYields
    ] = await Promise.all([
      pool.query('SELECT COUNT(*) FROM crops WHERE is_harvested = FALSE'),
      pool.query('SELECT COUNT(*) FROM crops WHERE is_harvested = TRUE'),
      pool.query('SELECT COUNT(DISTINCT field_name) FROM crops'),
      pool.query(`
        SELECT * FROM crops 
        WHERE is_harvested = FALSE 
        AND estimated_harvest_date <= CURRENT_DATE + INTERVAL '14 days'
        ORDER BY estimated_harvest_date ASC
      `),
      pool.query(`
        SELECT * FROM crops 
        WHERE is_harvested = FALSE 
        AND watering_interval_days IS NOT NULL
      `),
      pool.query('SELECT * FROM crop_journal ORDER BY created_at DESC LIMIT 5'),
      pool.query('SELECT type, COUNT(*) as count FROM crops GROUP BY type ORDER BY count DESC'),
      pool.query('SELECT type, AVG(yield_amount) as avg_yield, yield_unit FROM crops WHERE is_harvested = TRUE AND yield_amount IS NOT NULL GROUP BY type, yield_unit')
    ]);

    // Process watering reminders in JS (due in next 7 days)
    const next7Days = new Date();
    next7Days.setDate(next7Days.getDate() + 7);
    
    const wateringReminders = upcomingWateringRaw.rows.filter(crop => {
      if (!crop.last_watered_date) return true; // Never watered, needs watering immediately
      const lastWatered = new Date(crop.last_watered_date);
      const nextWatering = new Date(lastWatered.setDate(lastWatered.getDate() + crop.watering_interval_days));
      return nextWatering <= next7Days;
    });

    const mostPlanted = typeDistribution.rows.length > 0 ? typeDistribution.rows[0].type : null;

    res.json({
      overview: {
        total_active_crops: parseInt(activeCrops.rows[0].count),
        total_harvested_crops: parseInt(harvestedCrops.rows[0].count),
        total_fields: parseInt(totalFields.rows[0].count)
      },
      upcoming_watering: wateringReminders,
      upcoming_harvests: upcomingHarvests.rows,
      recent_journal_entries: recentJournals.rows,
      statistics: {
        crop_type_distribution: typeDistribution.rows.map(row => ({ type: row.type, count: parseInt(row.count) })),
        most_planted_crop_type: mostPlanted,
        average_yield_per_type: averageYields.rows.map(row => ({ type: row.type, avg_yield: parseFloat(row.avg_yield), unit: row.yield_unit }))
      }
    });

  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { getDashboardData };
