require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { initializeDB } = require('./db');
const cropsRoutes = require('./routes/cropsRoutes');
const journalRoutes = require('./routes/journalRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');
const exportRoutes = require('./routes/exportRoutes');
const calendarRoutes = require('./routes/calendarRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Initialize Database
initializeDB();

// Basic testing route
app.get('/', (req, res) => {
  res.json({ 
    message: 'FarmKeeper PostgreSQL API is running.',
    status: 'success' 
  });
});

// Routes
app.use('/api/crops', cropsRoutes);
app.use('/api/journal', journalRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/export', exportRoutes);
app.use('/api/calendar', calendarRoutes);

// Start Server locally
app.listen(PORT, () => {
  console.log(`Server is running locally on http://localhost:${PORT}`);
});
