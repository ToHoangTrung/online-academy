const express = require('express');
const Category = require('../models/category');
const router = express.Router();
const AuthService = require('../service/auth.service')

const {getAllCategories, getCategoryById, updateCategory, createNewCategory, createNewSubCategory, changeStatusCategory} = require('../service/category.service');
const { getAllUser, getUserById, changeRoleUser } = require('../service/user.service');
const { findAll, findById, changeStatusCourse, checkExsistCategoryCourses } = require('../service/course.service');
const { changeStatusUser } = require('../service/user.service');

router.get('/category', (req, res, next) => {
    res.render('home', {
        user: res.locals.user,
        category: Category.findAll()
    })
});

router.get('/', async (req, res,) => {
    if(res.locals.user && res.locals.user.roleId == 4){
        res.render('pages/admin', {
            css: ['admin'],
            user: res.locals.user,
            categories: await getAllCategories(),
            users: await getAllUser(),
            courses: await findAll(),
        }); 
    }else{
        res.render('pages/admin', {
            css: ['admin'],
            user: null,
        }); 
    }
});

router.post('/check/admin', async (req, res) => {
    var userName = req.body.userName;
    var passWord = req.body.passWord;
    res.clearCookie('token');
    const token = await AuthService.login(userName, passWord);
    console.log('token: ', token);
    if (token != null) {
        res.cookie('token', token, {httpOnly: true});
        res.send({code: '00'})
    } else {
        res.send({code: '01'});
    }
});


router.post('/look-up/category', async (req, res) => {
    var categoryId = req.body.categoryId;
    var category = await getCategoryById(categoryId);
    res.send(category);
});

router.post('/look-up/user', async (req, res) => {
    var userId = req.body.userId;
    var user = await getUserById(userId);
    res.send(user);
});

router.post('/look-up/course', async (req, res) => {
    var courseId = req.body.courseId;
    var course = await findById(courseId);
    res.send(course);
});

router.post('/change-role/user', async (req, res) => {
    var userId = req.body.userId;
    var roleId = req.body.roleId;
    
    var user = await changeRoleUser(userId, roleId);
    res.send(user);
});

router.post('/add/category', async (req, res) => {
    var categoryName = req.body.categoryName;
    var categoryLogo = req.body.categoryLogo;
    var categoryImg = req.body.categoryImg;
    var category = await createNewCategory(categoryName, categoryLogo, categoryImg);
    res.send(category);
});

router.post('/add/sub-category', async (req, res) => {
    var subCategoryName = req.body.subCategoryName;
    var categoryId = req.body.categoryId;
    var subCategory = await createNewSubCategory(subCategoryName, categoryId);
    res.send(subCategory);
});

router.post('/update/category', async (req, res) => {
    var categoryId = req.body.categoryId;
    var categoryName = req.body.name;
    var categoryLogo = req.body.logo;
    var result = await updateCategory(categoryId, categoryName, categoryLogo);
    if(result !== null) var category = await getCategoryById(categoryId);
    res.send(category);
});

router.post('/change-status/course', async (req, res) => {
    var courseId = req.body.courseId;
    var status = req.body.status;
    console.log("status req", courseId, status, typeof status);
    var course = await changeStatusCourse(courseId, status);
    res.send(course);
});

router.post('/change-status/category', async (req, res) => {
   
    var categoryId = req.body.categoryId;
    var status = req.body.status;
    console.log("status", status);
    if(status == 1){
        var category = await changeStatusCategory(categoryId, status);
        res.send({category, code: '00'});
    }
    else{
        var countCourses = await checkExsistCategoryCourses(categoryId);
        if(countCourses > 0) res.send({code: '01'});
        else {
            console.log("query",categoryId, status);
            var category = await changeStatusCategory(categoryId, status);
            res.send({category, code: '00'});
        }
    }
});

router.post('/change-status/user', async (req, res) => {
    var userId = req.body.userId;
    var status = req.body.status;
    var user = await changeStatusUser(userId, status);
    res.send(user);
});


module.exports = router;