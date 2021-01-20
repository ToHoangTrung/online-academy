const express = require('express');
const router = express.Router();

const CategoryService = require('../service/category.service');

router.get('/:id/sub-category', async (req, res) => {
    const id = req.params.id;
    const subs = await CategoryService.getSubCategoriesByCategory(id);
    res.send(subs);
})

module.exports = router;