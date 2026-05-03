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

// Start Server locally
app.listen(PORT, () => {
  console.log(`Server is running locally on http://localhost:${PORT}`);
});
