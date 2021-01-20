const express = require('express')
const router = express.Router();
const {v4: uuid} = require('uuid');
const fs = require('fs')

const CourseService = require('../service/course.service');
const CategoryService = require('../service/category.service')

const multer = require('multer')
const UserRole = require("../constant/UserRole");
const PRODUCT_IMAGE_PATH = "public/assets/images/products/";
const PRODUCT_VIDEO_PATH = "public/assets/videos/courses/";

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, PRODUCT_IMAGE_PATH)
    },
    filename: function (req, file, cb) {
        let ext = file.originalname.substring(file.originalname.lastIndexOf('.'), file.originalname.length);
        cb(null, Date.now() + ext)
    }
})
const courseVideoStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, PRODUCT_VIDEO_PATH)
    },
    filename: function (req, file, cb) {
        let ext = file.originalname.substring(file.originalname.lastIndexOf('.'), file.originalname.length);
        cb(null, Date.now() + ext)
    }
})
const upload = multer({storage: storage});
const videoUpload = multer({storage: courseVideoStorage})

router.use((req, res, next) => {
    const user = res.locals.user;
    if (!user) {
        res.redirect('/auth')
    } else if (res.locals.user && res.locals.user.roleId !== UserRole.Instructor) {
        console.log('pass checking roleId')
        res.redirect('/error/401');
    } else {
        next();
    }
});

/**
 * get instructor page
 */
router.get('/', async (req, res) => {
    res.render('pages/instructor/instructor', {
        css: ['instructor'],
        user: res.locals.user,
        courses: await CourseService.findByInstructorId(res.locals.user.id)
    });
})

/**
 * render add-course view
 */
router.get("/course/add-course", async (req, res) => {
    res.render('pages/instructor/add-course', {
        css: ['add-course'],
        user: res.locals.user,
        categories: await CategoryService.getAllCategories(),
        levels: await CourseService.getAllLevel()
    })
})

/**
 * Add new course
 */
router.post('/course', upload.single('image'), async (req, res, next) => {
    const course = req.body;
    const file = req.file;
    console.log(req.body)
    const categoryLink = await CategoryService.findCategoryLink(course.categoryId, course.subCategoryId);
    course.categoryLinkId = categoryLink.id;
    course.instructorId = res.locals.user.id;
    course.advancementId = 4;
    course.image = 'assets/images/products/' + file.filename;
    await CourseService.save(course);

    res.redirect('/instructor')
})

/**
 * get edit-course view
 */
router.get('/edit-course/:id', async (req, res) => {
    const id = req.params.id
    // should use Promise.all();
    res.render('pages/instructor/edit-course', {
        css: ['edit-course'],
        user: res.locals.user,
        course: await CourseService.findById(id),
        courseChapters: await CourseService.getCourseChapter(id),
        categories: await CategoryService.getAllCategories(),
        levels: await CourseService.getAllLevel()
    })
})

/**
 * edit course
 */
router.post('/edit-course', upload.single('image'), async (req, res) => {
    const course = req.body;
    console.log('course', course);
    const check = CourseService.checkCourseBeLongToInstructor(course.id, res.locals.user.id);
    if (!check) {
        res.redirect('error/401');
    }
    const file = req.file;
    console.log('req.body', req.body)
    const categoryLink = await CategoryService.findCategoryLink(course.categoryId, course.subCategoryId);
    course.categoryLinkId = categoryLink.id;
    course.instructorId = res.locals.user.id;
    course.advancementId = 4;
    if (file) {
        const oldCourse = await CourseService.findById(course.id);
        fs.rmSync(`public/` + oldCourse.image, {
            force: true,
        });
        course.image = 'assets/images/products/' + file.filename;
    }
    await CourseService.update(course);

    res.redirect('/instructor')
})

/**
 * instructor profile
 */
router.get('/profile', (req, res) => {

})

/**
 * add chapter
 */
router.post('/course/:courseId/add-chapter', (req, res) => {
    const chapter = req.body;
    const courseId = req.params.courseId;
    chapter.courseId = courseId;
    CourseService.addChapter(chapter)
        .then(r => console.log(r))
        .catch(er => console.log(err));
    res.redirect(`/instructor/edit-course/${courseId}`);
})

/**
 * add lesion
 */
router.post('/course/:courseId/chapter/:courseChapterId/add-lesion',
    videoUpload.fields([{name: 'video', maxCount: 1}, {name: 'documents', maxCount: 10}]),
    async (req, res) => {
        const files = req.files;
        const lesion = req.body;

        lesion.courseChapterId = req.params.courseChapterId;
        if (files.video) {
            lesion.urlVideo = 'public/assets/videos/courses/' + files.video[0].filename;
        }
        const newLesion = await CourseService.addLesion(lesion);

        res.redirect(`/instructor/edit-course/${req.params.courseId}`);
    }
)

/**
 * update lesion
 */
router.post('/course/:courseId/chapter/:courseChapterId/update-lesion',
    videoUpload.fields([{name: 'video', maxCount: 1}, {name: 'documents', maxCount: 10}]),
    async (req, res) => {
        const file = req.files;
        console.log(req.body);
        const lesion = req.body;
        lesion.courseChapterId = req.params.courseChapterId;
        lesion.urlVideo = 'public/assets/videos/courses/' + file.video[0].filename;

        const oldLesion = CourseService.findLesionById(lesion.id);
        const oldVideoUrl = oldLesion.urlVideo;

        const newLesion = await CourseService.updateLesion(lesion);

        fs.rmSync(`public/` + oldVideoUrl, {
            force: true,
        });

        res.redirect(`/instructor/edit-course/${req.params.courseId}`);
    }
)

/**
 * delete lesion
 */
router.delete('/course/:courseId/chapter/:courseChapterId/lesion/:lesionId',
    async (req, res) => {
        CourseService.deleteLesion(req.params.lesionId)
            .then(r => res.json(true))
            .catch(err => res.json(false));
    })

/**
 * delete chapter
 */
router.delete('/course/:courseId/chapter/:chapterId',
    async (req, res) => {
        console.log(req.params.chapterId);
        CourseService.deleteChapter(req.params.chapterId)
            .then(r => res.json(true))
            .catch(err => res.json(false));
    })

router.post('/course/:courseId/public',
    (req, res) => {
        const courseId = req.params.courseId;
        CourseService.publicCourse(courseId)
            .then(r => console.log(r));
        res.redirect('/instructor')
    })
router.delete('/course/:id',
    (req, res) => {
        CourseService.deleteCourse(req.params.id)
            .then(r => res.json(true))
            .catch(r => {
                console.log(r)
                res.json(false);
            });


    })

module.exports = router;