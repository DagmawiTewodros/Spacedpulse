require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { initializeDB } = require('./db');
const cropsRoutes = require('./routes/cropsRoutes');

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

// Start Server locally
app.listen(PORT, () => {
  console.log(`Server is running locally on http://localhost:${PORT}`);
});
