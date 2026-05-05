const express = require('express');
const router = express.Router();
const { exportCrops, exportHarvests, exportJournal } = require('../controllers/exportController');

router.get('/crops', exportCrops);
router.get('/harvests', exportHarvests);
router.get('/journal', exportJournal);

module.exports = router;
