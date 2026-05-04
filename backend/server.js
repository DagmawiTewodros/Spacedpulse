const express = require('express');
const cors = require('cors');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Initialize SQLite Database locally
const dbPath = path.resolve(__dirname, 'database.sqlite');
const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error('Error connecting to the database:', err.message);
  } else {
    console.log('Connected to the local SQLite database.');
  }
});

// Initialize Tables
db.serialize(() => {
  // Crop Registration Table
  db.run(`
    CREATE TABLE IF NOT EXISTS crops (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      type TEXT NOT NULL,
      variety TEXT,
      planting_date TEXT NOT NULL,
      days_to_maturity INTEGER NOT NULL,
      estimated_harvest_date TEXT NOT NULL,
      field_name TEXT NOT NULL,
      quantity REAL NOT NULL,
      photo_url TEXT,
      is_harvested BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);
  console.log('Crops table initialized.');
});

// Basic testing route
app.get('/', (req, res) => {
  res.json({ 
    message: 'FarmKeeper Local API is running.',
    status: 'success' 
  });
});

// --- CROP ROUTES ---

// Create a new crop
app.post('/api/crops', (req, res) => {
  const { name, type, variety, planting_date, days_to_maturity, field_name, quantity, photo_url } = req.body;
  
  // Auto-calculate estimated harvest date based on PRD
  const plantingDateObj = new Date(planting_date);
  const harvestDateObj = new Date(plantingDateObj.setDate(plantingDateObj.getDate() + parseInt(days_to_maturity)));
  const estimated_harvest_date = harvestDateObj.toISOString().split('T')[0];

  const sql = `INSERT INTO crops (name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url) 
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const params = [name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url];
  
  db.run(sql, params, function(err) {
    if (err) return res.status(400).json({ error: err.message });
    res.status(201).json({ id: this.lastID, estimated_harvest_date, message: 'Crop registered successfully' });
  });
});

// Get all crops (with search, filter, and sort)
app.get('/api/crops', (req, res) => {
  let { search, type, is_harvested, sort_by } = req.query;
  
  let sql = 'SELECT * FROM crops WHERE 1=1';
  const params = [];

  // Search by name or field
  if (search) {
    sql += ' AND (name LIKE ? OR field_name LIKE ?)';
    params.push(`%${search}%`, `%${search}%`);
  }
  // Filter by type
  if (type) {
    sql += ' AND type = ?';
    params.push(type);
  }
  // Filter by status (active vs harvested)
  if (is_harvested !== undefined) {
    sql += ' AND is_harvested = ?';
    params.push(is_harvested);
  }

  // Sort by planting date or harvest date
  if (sort_by === 'planting_date') sql += ' ORDER BY planting_date ASC';
  else if (sort_by === 'harvest_date') sql += ' ORDER BY estimated_harvest_date ASC';
  else sql += ' ORDER BY created_at DESC';

  db.all(sql, params, (err, rows) => {
    if (err) return res.status(400).json({ error: err.message });
    res.json({ data: rows });
  });
});

// Update a crop
app.put('/api/crops/:id', (req, res) => {
  const { name, type, variety, planting_date, days_to_maturity, field_name, quantity, photo_url, is_harvested } = req.body;
  
  const plantingDateObj = new Date(planting_date);
  const harvestDateObj = new Date(plantingDateObj.setDate(plantingDateObj.getDate() + parseInt(days_to_maturity)));
  const estimated_harvest_date = harvestDateObj.toISOString().split('T')[0];

  const sql = `UPDATE crops SET 
               name = ?, type = ?, variety = ?, planting_date = ?, days_to_maturity = ?, 
               estimated_harvest_date = ?, field_name = ?, quantity = ?, photo_url = ?, is_harvested = ? 
               WHERE id = ?`;
  const params = [name, type, variety, planting_date, days_to_maturity, estimated_harvest_date, field_name, quantity, photo_url, is_harvested, req.params.id];
  
  db.run(sql, params, function(err) {
    if (err) return res.status(400).json({ error: err.message });
    res.json({ message: 'Crop updated successfully', changes: this.changes });
  });
});

// Delete a crop
app.delete('/api/crops/:id', (req, res) => {
  db.run('DELETE FROM crops WHERE id = ?', req.params.id, function(err) {
    if (err) return res.status(400).json({ error: err.message });
    res.json({ message: 'Crop deleted successfully', changes: this.changes });
  });
});

// Start Server locally
app.listen(PORT, () => {
  console.log(`Server is running locally on http://localhost:${PORT}`);
});
