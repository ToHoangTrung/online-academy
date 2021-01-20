const express = require('express');
const CourseService = require("../service/course.service");

const router = express.Router();

router.get('/category', async (req, res) =>  {
    const {page, limit, category} = req.body;
    const courses = await CourseService.findByCategory(category, {page, limit});
    res.send(courses);
})

    module.exports = router;