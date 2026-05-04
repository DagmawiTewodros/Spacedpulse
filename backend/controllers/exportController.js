const { pool } = require('../db');
const { Parser } = require('json2csv');

const exportToCsv = (res, filename, data, fields) => {
  try {
    if (data.length === 0) {
      return res.status(404).json({ error: 'No data available to export.' });
    }
    const json2csvParser = new Parser({ fields });
    const csv = json2csvParser.parse(data);
    res.header('Content-Type', 'text/csv');
    res.attachment(filename);
    return res.send(csv);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const exportCrops = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM crops WHERE is_harvested = FALSE ORDER BY created_at DESC');
    const fields = ['id', 'name', 'type', 'variety', 'planting_date', 'days_to_maturity', 'estimated_harvest_date', 'field_name', 'quantity', 'watering_interval_days', 'last_watered_date'];
    exportToCsv(res, 'active_crops.csv', result.rows, fields);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const exportHarvests = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM crops WHERE is_harvested = TRUE ORDER BY actual_harvest_date DESC');
    const fields = ['id', 'name', 'type', 'field_name', 'planting_date', 'actual_harvest_date', 'yield_amount', 'yield_unit', 'quality_rating', 'harvest_notes'];
    exportToCsv(res, 'harvest_history.csv', result.rows, fields);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const exportJournal = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM crop_journal ORDER BY created_at DESC');
    const fields = ['id', 'crop_id', 'category', 'note_text', 'weather_condition', 'pest_name', 'treatment_applied', 'fertilizer_name', 'fertilizer_quantity', 'created_at'];
    exportToCsv(res, 'journal_notes.csv', result.rows, fields);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { exportCrops, exportHarvests, exportJournal };
