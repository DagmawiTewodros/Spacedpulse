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
    // ── Users table ─────────────────────────────────────────────────────────
    await pool.query(`
      CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        password_hash TEXT NOT NULL,
        role VARCHAR(50) NOT NULL DEFAULT 'farmer',
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);
    console.log('PostgreSQL: Users table initialized.');

    // ── Crops table ──────────────────────────────────────────────────────────
    await pool.query(`
      CREATE TABLE IF NOT EXISTS crops (
        id SERIAL PRIMARY KEY,
        user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
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
    // Safely add user_id column to pre-existing crops tables
    await pool.query(`
      DO $$ BEGIN
        ALTER TABLE crops ADD COLUMN user_id INTEGER REFERENCES users(id) ON DELETE CASCADE;
      EXCEPTION WHEN duplicate_column THEN NULL;
      END $$;
    `);
    console.log('PostgreSQL: Crops table initialized.');

    // ── Crop Journal table ───────────────────────────────────────────────────
    await pool.query(`
      CREATE TABLE IF NOT EXISTS crop_journal (
        id SERIAL PRIMARY KEY,
        crop_id INTEGER REFERENCES crops(id) ON DELETE CASCADE,
        user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
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
    await pool.query(`
      DO $$ BEGIN
        ALTER TABLE crop_journal ADD COLUMN user_id INTEGER REFERENCES users(id) ON DELETE CASCADE;
      EXCEPTION WHEN duplicate_column THEN NULL;
      END $$;
    `);
    console.log('PostgreSQL: Crop Journal table initialized.');
  } catch (err) {
    console.error('Error initializing database:', err);
  }
};

module.exports = { pool, initializeDB };
