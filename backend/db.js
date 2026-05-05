const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

const initializeDB = async () => {
  try {
    await pool.query(`
      CREATE TABLE IF NOT EXISTS crops (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        type VARCHAR(255) NOT NULL,
        variety VARCHAR(255),
        planting_date DATE NOT NULL,
        days_to_maturity INTEGER NOT NULL,
        estimated_harvest_date DATE NOT NULL,
        field_name VARCHAR(255) NOT NULL,
        quantity REAL NOT NULL,
        photo_url TEXT,
        watering_interval_days INTEGER,
        last_watered_date DATE,
        actual_harvest_date DATE,
        yield_amount REAL,
        yield_unit VARCHAR(50),
        quality_rating INTEGER,
        harvest_notes TEXT,
        is_harvested BOOLEAN DEFAULT FALSE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    console.log('PostgreSQL: Crops table initialized.');

    await pool.query(`
      CREATE TABLE IF NOT EXISTS crop_journal (
        id SERIAL PRIMARY KEY,
        crop_id INTEGER REFERENCES crops(id) ON DELETE CASCADE,
        category VARCHAR(50) NOT NULL,
        note_text TEXT,
        photo_url TEXT,
        weather_condition VARCHAR(50),
        pest_name VARCHAR(255),
        treatment_applied VARCHAR(255),
        fertilizer_name VARCHAR(255),
        fertilizer_quantity VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    console.log('PostgreSQL: Crop Journal table initialized.');
  } catch (err) {
    console.error('Error initializing database:', err);
  }
};

module.exports = { pool, initializeDB };
