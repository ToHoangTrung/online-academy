const express = require('express')
const router = express.Router();
const Category = require('../models/category');
const { getAllUserCourses, deleteUserCourse, createUserCourseReview } = require('../service/user.service');
const user = {};

router.get('/learning', async (req, res) => {
    if(!res.locals.user) res.redirect('/auth');

    res.render('pages/user-learning', {
        css: ['user-learning', 'star-rating-svg'],
        user: null,
        userCourses: await getAllUserCourses(res.locals.user.id, type = 2),
        type: '02'
    });
});

router.get('/following', async (req, res) => {
    if(!res.locals.user) res.redirect('auth');

    res.render('pages/user-learning', {
        css: ['user-learning', 'star-rating-svg'],
        user: null,
        userCourses: await getAllUserCourses(res.locals.user.id, type = 1),
        type: '01'
    });
});

router.post('/delete/following-course', async (req, res) => {

    var courseId = req.body.courseId;

    var deleteResult = await deleteUserCourse(res.locals.user.id, courseId, type = 1);

    if(deleteResult != null) res.send({code: '00', message: "Delete following course of user successfully"});
    else res.send({code: '01', message: "Opps, st wrong has happend"});
});

router.post('/review/course', async (req, res) => {

    var {courseId, review, rating} = req.body;

    var createResult = await createUserCourseReview(res.locals.user.id, courseId, review, rating);
    console.log(createResult);
    if(createResult != null) res.send({code: '00', message: "Insert new review for this user and course successfully"});
    else res.send({code: '01', message: "Opps, st wrong has happend"});
});

module.exports = router;