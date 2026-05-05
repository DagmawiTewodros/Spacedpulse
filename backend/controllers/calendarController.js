const { pool } = require('../db');

const getCalendarEvents = async (req, res) => {
  try {
    const { year, month } = req.query; // Expecting year (YYYY) and month (1-12)
    
    if (!year || !month) {
      return res.status(400).json({ error: 'Year and month are required query parameters (e.g., ?year=2026&month=5)' });
    }

    const startDate = new Date(year, month - 1, 1);
    const endDate = new Date(year, month, 0); // Last day of the month

    const events = [];

    // Fetch active crops
    const cropsResult = await pool.query('SELECT * FROM crops WHERE is_harvested = FALSE');
    const crops = cropsResult.rows;

    crops.forEach(crop => {
      const plantDate = new Date(crop.planting_date);
      const harvestDate = new Date(crop.estimated_harvest_date);

      // 1. Planting Events
      if (plantDate >= startDate && plantDate <= endDate) {
        events.push({
          date: plantDate.toISOString().split('T')[0],
          type: 'planting',
          crop_id: crop.id,
          crop_name: crop.name,
          field_name: crop.field_name,
          icon: '🌱',
          color: 'green'
        });
      }

      // 2. Harvest Events
      if (harvestDate >= startDate && harvestDate <= endDate) {
        events.push({
          date: harvestDate.toISOString().split('T')[0],
          type: 'harvest',
          crop_id: crop.id,
          crop_name: crop.name,
          field_name: crop.field_name,
          icon: '🌾',
          color: 'orange'
        });
      }

      // 3. Watering Events (Iteratively calculating dates)
      if (crop.watering_interval_days) {
        let currentWateringDate = crop.last_watered_date ? new Date(crop.last_watered_date) : new Date(crop.planting_date);
        
        // Loop to find all watering dates within the requested month
        while (currentWateringDate <= endDate) {
          currentWateringDate.setDate(currentWateringDate.getDate() + crop.watering_interval_days);
          
          if (currentWateringDate >= startDate && currentWateringDate <= endDate) {
             events.push({
                date: currentWateringDate.toISOString().split('T')[0],
                type: 'watering',
                crop_id: crop.id,
                crop_name: crop.name,
                field_name: crop.field_name,
                icon: '💧',
                color: 'blue'
             });
          }
        }
      }
    });

    // Sort events sequentially by date
    events.sort((a, b) => new Date(a.date) - new Date(b.date));

    res.json({ data: events });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { getCalendarEvents };
