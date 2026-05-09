const express = require('express');
const router = express.Router();
const {
  signup,
  login,
  logout,
  getProfile,
  deleteAccount,
  getAllUsers,
  deleteUserByAdmin,
} = require('../controllers/authController');
const { authenticate, authorize } = require('../middleware/auth');

// ── Public routes ─────────────────────────────────────────────────────────────
router.post('/signup', signup);
router.post('/login', login);

// ── Authenticated user routes ─────────────────────────────────────────────────
router.post('/logout', authenticate, logout);
router.get('/me', authenticate, getProfile);
router.delete('/me', authenticate, deleteAccount);

// ── Admin-only routes ─────────────────────────────────────────────────────────
router.get('/users', authenticate, authorize('admin'), getAllUsers);
router.delete('/users/:id', authenticate, authorize('admin'), deleteUserByAdmin);

module.exports = router;
