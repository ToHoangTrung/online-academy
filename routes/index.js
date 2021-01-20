const express = require('express')
const router = express.Router();
const Category = require('../models/category')
const {getTopCoursesInWeek, getNewestCourses, getMostEnrollCourses, getCategoryCourses, getPopularCategoryCourses, getCourseChapter, getSectionVideo} = require('../service/course.service');
const AuthService = require('../service/auth.service')
const CourseService = require("../service/course.service");
const {getAllInstructor, getById, getAllUserCourses} = require('../service/user.service');
const {getUnPaymentInvoice} = require('../service/invoice.service');
const UserService = require("../service/user.service");
const UserRole = require("../constant/UserRole");
const {getSubCategoriesByCategory} = require("../service/category.service");
const {getPopularSubCategoriesByCategory} = require("../service/category.service");
const {getMostEnrollCategories} = require("../service/category.service");
const {getAllCategories} = require("../service/category.service");

router.get('/auth', (req, res) => {
    if (req.cookies.token) {
        res.redirect('/');
    }
    res.render('pages/auth', {
        layout: 'blank',
        css: ['auth']
    })
})

router.get('/user/is-username-available', async (req, res) => {
    const username = req.query.username;
    const user = await UserService.findByUsername(username);

    if (user) {
        res.json(false);
    } else {
        res.json(true);
    }
})

router.get('/user/is-email-available', async (req, res) => {
    const email = req.query.email;
    console.log(email);
    const user = await UserService.findByEmail(email);
    console.log(user);
    if (user) {
        res.json(false);
    } else {
        res.json(true);
    }
})

router.post('/signin', async (req, res) => {

    console.log('request.body', req.body);
    const {username, password} = req.body;

    const token = await AuthService.login(username, password);
    console.log('token: ', token);
    if (token != null) {
        res.cookie('token', token, {httpOnly: true, sameSite: 'lax'})

        res.redirect('/');
    } else {
        res.render('pages/auth', {
            layout: 'blank',
            css: ['auth'],
            status: 'error',
            message: 'Username or password is not correct!'
        })
    }
})

router.post('/signup', async (req, res) => {
    const user = req.body;
    console.log(user);
    user.roleId = UserRole.Student;
    AuthService.signup(user);
    res.render('pages/auth', {
        layout: 'blank',
        css: ['auth'],
        status: 'success',
        message: 'Sign up successfully!'
    })
})

router.get('/logout', async (req, res) => {
    res.clearCookie('token');
    delete res.locals.user;
    res.redirect('/');
})

router.get('/', async (req, res) => {
    const user = res.locals.user;
    if(res.locals.user) {
        var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);
        var userCourses = await getAllUserCourses(res.locals.user.id, type = 2);
        if(userCourses.length == 0) userCourses = null;
    }
    res.render('pages/home', {
        css: ['home', 'star-rating-svg', 'slick', 'slick-theme'],
        user,
        categories: await getAllCategories(),
        topEnrollCategories: await getMostEnrollCategories(),
        topCoursesInWeek: await getTopCoursesInWeek(),
        newestCourses: await getNewestCourses(),
        mostEnrollCourses: await getMostEnrollCourses(),
        instructors: await getAllInstructor(),
        userUnPaymentInvoice,
        userCourses
    });
})

function setFilter(requestPage, requestRating, requestDuration, requestPrice, requestLevel, requestOrder, requestTopic) {

    const page = requestPage !== undefined ? requestPage : 1;
    const rating = requestRating !== undefined ? requestRating : 3.0;
    const order = requestOrder !== undefined ? requestOrder : 'top-enrolled';
    const topic = requestTopic !== undefined ? requestTopic.replace(/\-/g, ' ').replace(/(^\w{1})|(\s{1}\w{1})/g, match => match.toUpperCase()) : '';

    const duration = [];
    if (requestDuration === undefined) {
        duration[0] = 0;
        duration[1] = 999;
    } else {
        const durationArray = []
        if (requestDuration.includes('short')) {
            durationArray.push(0);
            durationArray.push(10);
        }
        if (requestDuration.includes('medium')) {
            durationArray.push(10);
            durationArray.push(20);
        }
        if (requestDuration.includes('long')) {
            durationArray.push(20);
            durationArray.push(30);
        }
        if (requestDuration.includes('extra')) {
            durationArray.push(30);
            durationArray.push(999);
        }
        durationArray.sort((a, b) => a - b);
        duration[0] = durationArray[0];
        duration[1] = durationArray[durationArray.length - 1];
    }

    const price = [];
    if (requestPrice === undefined) {
        price[0] = 0;
        price[1] = 999;
    } else {
        if (requestPrice.includes("free")) {
            price[0] = 0;
            price[1] = 0;
        }
        if(requestPrice.includes("paid")){
            price[0] = 1;
            price[1] = 999;
        }
    }
    var level = [];
    if (requestLevel === undefined) {
        level = [...[1, 2, 3, 4]];
    } else {
        if (requestLevel.includes("beginner"))
            level.push(1);
        if (requestLevel.includes("intermediate"))
            level.push(2);
        if (requestLevel.includes("expert"))
            level.push(3);
        if (requestLevel.includes("all-levels"))
            level.push(4);
    }
    return {page, rating, duration, price, level, order, topic}
}

router.get('/collection/*/', async (req, res) => {
    if(res.locals.user) {
        var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);
        var userCourses = await getAllUserCourses(res.locals.user.id, type = 2);
        if(userCourses.length == 0) userCourses = null;
    }
    const {page, rating, duration, price, level, order, topic} = setFilter(req.query.page, req.query.rating, req.query.duration, req.query.price, req.query.level, req.query.order, req.query.topic);

    const {pageCount: {totalItems, totalPages, currentPage}, categorycourses: categoryCourses} = await getCategoryCourses(req.query.id, page, size = 5, duration, rating, level, price, order, topic);
    res.render('pages/category-detail', {
        css: ['category-detail', 'star-rating-svg'],
        user: res.locals.user,
        totalItems, totalPages, currentPage, categoryCourses,
        categories: await getAllCategories(),
        popularCategoryCourses: await getPopularCategoryCourses(req.query.id),
        popularSubCategories: await getPopularSubCategoriesByCategory(req.query.id),
        subcategoriesByCategory: await getSubCategoriesByCategory(req.query.id),
        //userUnPaymentInvoice,
        //userCourses
    });
});

router.get('/courses/*/:courseid/lecture/:sectionid', async (req, res) => {
    if(res.locals.user) var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);
    console.log(res.locals.user);
    res.render('pages/course-learning', {
        css: ['course-learning', 'star-rating-svg'],
        user: null,
        courseChapters: await getCourseChapter(req.params.courseid),
        sectionVideo: await getSectionVideo(req.params.sectionid),
        userUnPaymentInvoice
    });
})

router.get('/instructor/:id', async (req, res) => {
    const instructor = await getById(req.params.id);
    res.send(instructor);
})
/**
 * render course view with specific id
 */
router.get('/courses', (req, res) => {
    const {category} = req.query;
    res.render('/courses', {
        user
    })
})

router.get('/courses/*/:id', async (req, res) => {
    const courseId = req.params.id;
    console.log('reqId', courseId);
    if (res.locals.user) {
        var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);
        var userCourses = await getAllUserCourses(res.locals.user.id, type = 2);
        if(userCourses.length == 0) userCourses = null;
    }
    try {
        const totalReviews = await CourseService.countRating(courseId);
        const ratingCount = await Promise.all([
            CourseService.countRating(courseId, 1),
            CourseService.countRating(courseId, 2),
            CourseService.countRating(courseId, 3),
            CourseService.countRating(courseId, 4),
            CourseService.countRating(courseId, 5)
        ])

        const [course, relatedCourses] = await Promise.all([
            CourseService.findById(courseId),
            CourseService.getRelatedCourses(courseId)
        ]);
        course.reviewPercentage = ratingCount.map(c => Math.round(c*100/totalReviews));
        console.log(course);
        res.render('pages/course-detail', {
            categories: await getAllCategories(),
            css: ['course-detail', 'star-rating-svg'],
            course,
            relatedCourses,
            userUnPaymentInvoice,
            userCourses,
            user: res.locals.user
        })
    } catch (error) {
        console.log(error)
    }
});

/**
 * Search courses by criteria. Criteria could be name, author, category,...
 * return {}
 */
router.get('/search', (req, res) => {
    const {criteria} = req.params;
    res.send(['list of course']);
});


module.exports = router;