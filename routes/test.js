const express = require('express')
const User = require("../models/user");
const Course = require("../models/course");
const CourseService = require("../service/course.service");
const Instructor = require("../models/instructor");
const router = express.Router();

router.get('/users', async (req, res) => {
    const users = await User.findAll();
    res.send(users);
})

router.get('/courses', async (req, res) => {
    const users = await CourseService.findAll();
    res.send(users);
})

/**
 * find all courses of instructor
 */
router.get('/instructor/:id/courses', async (req, res) => {
    const id = req.params.id;
    const courses = await Instructor.findAll({
        where: {
            id
        },
        include: Course
    })
    res.send(courses);
})

router.post('/test-post',(req, res) =>  {
    res.send(req.body);
})

module.exports = router;