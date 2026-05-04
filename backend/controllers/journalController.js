const { pool } = require('../db');

// Add a new journal entry
const createEntry = async (req, res) => {
  try {
    const { crop_id, category, note_text, photo_url, weather_condition, pest_name, treatment_applied, fertilizer_name, fertilizer_quantity } = req.body;

    const result = await pool.query(
      `INSERT INTO crop_journal 
      (crop_id, category, note_text, photo_url, weather_condition, pest_name, treatment_applied, fertilizer_name, fertilizer_quantity) 
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id`,
      [crop_id || null, category, note_text, photo_url, weather_condition, pest_name, treatment_applied, fertilizer_name, fertilizer_quantity]
    );

    res.status(201).json({ id: result.rows[0].id, message: 'Journal entry added successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Get all journal entries (with filters and search)
const getEntries = async (req, res) => {
  try {
    let { search, category, crop_id } = req.query;
    
    let sql = 'SELECT * FROM crop_journal WHERE 1=1';
    const params = [];
    let paramIndex = 1;

    if (search) {
      sql += ` AND (note_text ILIKE $${paramIndex} OR pest_name ILIKE $${paramIndex} OR fertilizer_name ILIKE $${paramIndex})`;
      params.push(`%${search}%`);
      paramIndex++;
    }
    if (category) {
      sql += ` AND category = $${paramIndex}`;
      params.push(category);
      paramIndex++;
    }
    if (crop_id) {
      sql += ` AND crop_id = $${paramIndex}`;
      params.push(crop_id);
      paramIndex++;
    }

    sql += ' ORDER BY created_at DESC';

    const result = await pool.query(sql, params);
    res.json({ data: result.rows });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Update an entry
const updateEntry = async (req, res) => {
  try {
    const { category, note_text, photo_url, weather_condition, pest_name, treatment_applied, fertilizer_name, fertilizer_quantity } = req.body;

    const result = await pool.query(
      `UPDATE crop_journal SET 
       category = $1, note_text = $2, photo_url = $3, weather_condition = $4, 
       pest_name = $5, treatment_applied = $6, fertilizer_name = $7, fertilizer_quantity = $8
       WHERE id = $9`,
      [category, note_text, photo_url, weather_condition, pest_name, treatment_applied, fertilizer_name, fertilizer_quantity, req.params.id]
    );

    if (result.rowCount === 0) return res.status(404).json({ error: 'Entry not found' });
    res.json({ message: 'Journal entry updated successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Delete an entry
const deleteEntry = async (req, res) => {
  try {
    const result = await pool.query('DELETE FROM crop_journal WHERE id = $1', [req.params.id]);
    if (result.rowCount === 0) return res.status(404).json({ error: 'Entry not found' });
    res.json({ message: 'Journal entry deleted successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

module.exports = { createEntry, getEntries, updateEntry, deleteEntry };
