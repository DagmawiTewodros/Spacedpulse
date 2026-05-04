const express = require('express');
const router = express.Router();
const { createCrop, getCrops, updateCrop, deleteCrop, waterCrop, harvestCrop } = require('../controllers/cropsController');

router.post('/', createCrop);
router.get('/', getCrops);
router.put('/:id', updateCrop);
router.delete('/:id', deleteCrop);
router.post('/:id/water', waterCrop);
router.post('/:id/harvest', harvestCrop);

module.exports = router;
