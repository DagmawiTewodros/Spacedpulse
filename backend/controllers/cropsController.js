const { pool } = require('../db');

// Create a new crop
const createCrop = async (req, res) => {
  try {
    const { name, type, variety, planting_date, days_to_maturity, field_name, quantity, photo_url, watering_interval_days } = req.body;
    
    const plantingDateObj = new Date(planting_date);
    const harvestDateObj = new Date(plantingDateObj.setDate(plantingDateObj.getDate() + parseInt(days_to_maturity)));
    const estimated_harvest_date = harvestDateObj.toISOString().split('T')[0];

    const result = await pool.query(
      `INSERT INTO crops 
      (name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url, watering_interval_days) 
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING id`,
      [name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url, watering_interval_days || null]
    );

    res.status(201).json({ id: result.rows[0].id, estimated_harvest_date, message: 'Crop registered successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Get all crops
const getCrops = async (req, res) => {
  try {
    let { search, type, is_harvested, sort_by } = req.query;
    
    let sql = 'SELECT * FROM crops WHERE 1=1';
    const params = [];
    let paramIndex = 1;

    if (search) {
      sql += ` AND (name ILIKE $${paramIndex} OR field_name ILIKE $${paramIndex})`;
      params.push(`%${search}%`);
      paramIndex++;
    }
    if (type) {
      sql += ` AND type = $${paramIndex}`;
      params.push(type);
      paramIndex++;
    }
    if (is_harvested !== undefined) {
      sql += ` AND is_harvested = $${paramIndex}`;
      params.push(is_harvested === 'true');
      paramIndex++;
    }

    if (sort_by === 'planting_date') sql += ' ORDER BY planting_date ASC';
    else if (sort_by === 'harvest_date') sql += ' ORDER BY estimated_harvest_date ASC';
    else sql += ' ORDER BY created_at DESC';

    const result = await pool.query(sql, params);
    res.json({ data: result.rows });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Update a crop
const updateCrop = async (req, res) => {
  try {
    const { name, type, variety, planting_date, days_to_maturity, field_name, quantity, photo_url, is_harvested } = req.body;
    
    const plantingDateObj = new Date(planting_date);
    const harvestDateObj = new Date(plantingDateObj.setDate(plantingDateObj.getDate() + parseInt(days_to_maturity)));
    const estimated_harvest_date = harvestDateObj.toISOString().split('T')[0];

    const result = await pool.query(
      `UPDATE crops SET 
       name = $1, type = $2, variety = $3, planting_date = $4, days_to_maturity = $5, 
       estimated_harvest_date = $6, field_name = $7, quantity = $8, photo_url = $9, is_harvested = $10
       WHERE id = $11`,
      [name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url, is_harvested, req.params.id]
    );

    if (result.rowCount === 0) return res.status(404).json({ error: 'Crop not found' });
    res.json({ message: 'Crop updated successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Delete a crop
const deleteCrop = async (req, res) => {
  try {
    const result = await pool.query('DELETE FROM crops WHERE id = $1', [req.params.id]);
    if (result.rowCount === 0) return res.status(404).json({ error: 'Crop not found' });
    res.json({ message: 'Crop deleted successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Water crop
const waterCrop = async (req, res) => {
  try {
    const today = new Date().toISOString().split('T')[0];
    const result = await pool.query('UPDATE crops SET last_watered_date = $1 WHERE id = $2', [today, req.params.id]);
    if (result.rowCount === 0) return res.status(404).json({ error: 'Crop not found' });
    res.json({ message: 'Crop watered successfully', last_watered_date: today });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Harvest crop
const harvestCrop = async (req, res) => {
  try {
    const { actual_harvest_date, yield_amount, yield_unit, quality_rating, harvest_notes } = req.body;
    
    const result = await pool.query(
      `UPDATE crops SET 
       is_harvested = TRUE, actual_harvest_date = $1, yield_amount = $2, yield_unit = $3, quality_rating = $4, harvest_notes = $5
       WHERE id = $6`,
      [actual_harvest_date, yield_amount, yield_unit, quality_rating, harvest_notes, req.params.id]
    );

    if (result.rowCount === 0) return res.status(404).json({ error: 'Crop not found' });
    res.json({ message: 'Harvest recorded successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

module.exports = { createCrop, getCrops, updateCrop, deleteCrop, waterCrop, harvestCrop };
