require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { initializeDB } = require('./db');
const { authenticate } = require('./middleware/auth');
const { tokenBlacklist } = require('./controllers/authController');

const authRoutes = require('./routes/authRoutes');
const cropsRoutes = require('./routes/cropsRoutes');
const journalRoutes = require('./routes/journalRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');
const exportRoutes = require('./routes/exportRoutes');
const calendarRoutes = require('./routes/calendarRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

// ── Core middleware ───────────────────────────────────────────────────────────
app.use(cors());
app.use(express.json());

// ── Token blacklist check (runs before every authenticated route) ─────────────
app.use((req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (token && tokenBlacklist.has(token)) {
    return res.status(401).json({ error: 'Token has been invalidated. Please log in again.' });
  }
  next();
});

// ── Initialize Database ───────────────────────────────────────────────────────
initializeDB();

// ── Health check ──────────────────────────────────────────────────────────────
app.get('/', (req, res) => {
  res.json({ message: 'FarmKeeper API is running.', status: 'success' });
});

// ── Public: Auth routes (signup / login) ─────────────────────────────────────
app.use('/api/auth', authRoutes);

// ── Protected: all other routes require a valid JWT ───────────────────────────
app.use('/api/crops', authenticate, cropsRoutes);
app.use('/api/journal', authenticate, journalRoutes);
app.use('/api/dashboard', authenticate, dashboardRoutes);
app.use('/api/export', authenticate, exportRoutes);
app.use('/api/calendar', authenticate, calendarRoutes);

// ── Start server ─────────────────────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`FarmKeeper server running on http://localhost:${PORT}`);
});
