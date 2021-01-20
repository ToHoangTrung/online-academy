const fs = require('fs');
const express = require('express')
const UserService = require("../service/user.service");
const router = express.Router();

const multer = require('multer')
const USER_IMAGE_PATH = "public/assets/images/users/";

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, USER_IMAGE_PATH)
    },
    filename: function (req, file, cb) {
        let ext = file.originalname.substring(file.originalname.lastIndexOf('.'), file.originalname.length);
        cb(null, Date.now() + ext)
    }
})
const upload = multer({storage: storage});

router.get('/me', async (req, res) => {
    const user = res.locals.user;
    if (!user) {
        res.redirect('/auth');
    } else {
        res.render('pages/profile', {
            css: ['profile'],
            user: res.locals.user
        })
    }
})

router.post('/update-basic-info', async (req, res) => {
    const user = req.body
    user.id = res.locals.user.id;
    // validate if necessary
    const updatedUser = await UserService.updateBasicInfo(user).then(r => console.log('update user basic info successfully', r));
    res.locals.user = updatedUser;

   res.redirect('/user/me');
})

router.post('/update-avatar', upload.single('avatar'), async (req, res) => {
    const file = req.file;
    if (!file) {
        res.redirect('/user/me')
    }
    console.log(file)
    const oldPath = res.locals.user.image;
    const user = await UserService.updateBasicInfo({
        id: res.locals.user.id,
        image: 'assets/images/users/' + file.filename
    })
        .then(r => console.log('update avatar', r));
    res.locals.user = user;
    fs.rmSync(`public/` + oldPath, {
        force: true,
    });
    res.redirect('/user/me')
    // res.render('pages/profile', {
    //     css: ['profile'],
    //     user: res.locals.user
    // })
})

router.post('/update-password', async (req, res) => {
    const {oldPassword, newPassword} = req.body
    // validate if need
    const token = await UserService.updatePassword(res.locals.user.id, oldPassword, newPassword);
    console.log('update password new token: ', token);
    if (token != null) {
        res.cookie('token', token, {httpOnly: true, sameSite: 'lax'})
        res.render('pages/profile', {
            css: ['profile'],
            user: res.locals.user,
            status: 'success',
            message: 'Change password successfully!'
        })
    } else {
        res.render('pages/profile', {
            css: ['profile'],
            user: res.locals.user,
            status: 'error',
            message: 'Password is not correct!'
        })
    }
})



module.exports = router;