const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { pool } = require('../db');

// Simple in-memory token blacklist for logged-out tokens.
const tokenBlacklist = new Set();

// Helper
const signToken = (user) =>
  jwt.sign(
    { id: user.id, name: user.name, email: user.email, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: '7d' }
  );

//  Signup
const signup = async (req, res) => {
  try {
    const { name, email, password, role } = req.body;

    if (!name || !email || !password) {
      return res.status(400).json({ error: 'name, email and password are required.' });
    }

    // Only allow valid roles; default to 'farmer'
    const allowedRoles = ['farmer', 'manager', 'admin'];
    const assignedRole = allowedRoles.includes(role) ? role : 'farmer';

    // Check duplicate email
    const existing = await pool.query('SELECT id FROM users WHERE email = $1', [email]);
    if (existing.rows.length > 0) {
      return res.status(409).json({ error: 'Email already registered.' });
    }

    const password_hash = await bcrypt.hash(password, 12);

    const result = await pool.query(
      `INSERT INTO users (name, email, password_hash, role)
       VALUES ($1, $2, $3, $4) RETURNING id, name, email, role, created_at`,
      [name, email, password_hash, assignedRole]
    );

    const user = result.rows[0];
    const token = signToken(user);

    res.status(201).json({
      message: 'Account created successfully.',
      token,
      user: { id: user.id, name: user.name, email: user.email, role: user.role },
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Login 
const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ error: 'email and password are required.' });
    }

    const result = await pool.query(
      'SELECT id, name, email, password_hash, role FROM users WHERE email = $1',
      [email]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Invalid email or password.' });
    }

    const user = result.rows[0];
    const passwordMatch = await bcrypt.compare(password, user.password_hash);

    if (!passwordMatch) {
      return res.status(401).json({ error: 'Invalid email or password.' });
    }

    const token = signToken(user);

    res.json({
      message: 'Logged in successfully.',
      token,
      user: { id: user.id, name: user.name, email: user.email, role: user.role },
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Logout
const logout = (req, res) => {
  // Blacklist the current token so it cannot be reused
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (token) tokenBlacklist.add(token);

  res.json({ message: 'Logged out successfully.' });
};

// Get current user profile
const getProfile = async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, name, email, role, created_at FROM users WHERE id = $1',
      [req.user.id]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'User not found.' });
    res.json({ user: result.rows[0] });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Delete own account
const deleteAccount = async (req, res) => {
  try {
    const { password } = req.body;

    if (!password) {
      return res.status(400).json({ error: 'password is required to delete your account.' });
    }

    const result = await pool.query(
      'SELECT id, password_hash FROM users WHERE id = $1',
      [req.user.id]
    );

    if (result.rows.length === 0) return res.status(404).json({ error: 'User not found.' });

    const passwordMatch = await bcrypt.compare(password, result.rows[0].password_hash);
    if (!passwordMatch) {
      return res.status(401).json({ error: 'Incorrect password.' });
    }

    await pool.query('DELETE FROM users WHERE id = $1', [req.user.id]);

    // Blacklist current token
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (token) tokenBlacklist.add(token);

    res.json({ message: 'Account deleted successfully.' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Admin: get all users
const getAllUsers = async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT id, name, email, role, created_at FROM users ORDER BY created_at DESC'
    );
    res.json({ data: result.rows });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Admin: delete any user
const deleteUserByAdmin = async (req, res) => {
  try {
    const result = await pool.query('DELETE FROM users WHERE id = $1', [req.params.id]);
    if (result.rowCount === 0) return res.status(404).json({ error: 'User not found.' });
    res.json({ message: 'User deleted by admin.' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = {
  signup,
  login,
  logout,
  getProfile,
  deleteAccount,
  getAllUsers,
  deleteUserByAdmin,
  tokenBlacklist,
};
