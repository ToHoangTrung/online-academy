var express = require('express');
const { ready } = require('jquery');
const { getCouponByCode } = require('../service/coupon.service');
const { getUserCourses } = require('../service/course.service');
var router = express.Router();

const { getUnPaymentInvoice, updateInvoice, addCourseInvoice, createNewInvoice } = require("../service/invoice.service");
const { getAllUserCourses } = require('../service/user.service');

router.get('/', async (req, res) => {

    if(!res.locals.user) res.redirect('/auth');

    var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);

    var userCourses = await getAllUserCourses(res.locals.user.id, type = 2);

    if(userCourses.length == 0) userCourses = null;

    if(userUnPaymentInvoice !== null && userUnPaymentInvoice.courses.length > 0) {
        res.render('pages/cart', {
            css: ['cart'],
            code: '00',
            message: 'found user cart',
            userUnPaymentInvoice,
            userCourses,
        });
    }
    else {
        res.render('pages/cart', {
            css: ['cart'],
            code: '',
            message: 'cant not find cart of user'
        });
    }
});

router.post('/check_coupon', async (req, res) => {

    var code = req.body.code;

    var coupon = await getCouponByCode(code);

    if(coupon !== null) res.send({coupon: coupon, code: '00', message: 'coupon exist'});
    else res.send({coupon: coupon, code: '01', message: 'coupon does not exist'});
});

router.post('/to_payment', async (req, res) => {

    var couponId = req.body.coupon;

    var invoiceId = req.body.invoiceId;

    var updateResult = await updateInvoice(invoiceId, orderDate = null, refunddate = null, invoiceStatus = null, user = null, paymenttype = null, couponid = couponId);

    if(updateResult !== null) {     
        res.send({code: '00', paymentLink: 'http://localhost:5000/cart/payment'})
    }else{
        res.send({code: '01', message: 'oops, st goes wrong'})
    }
 
});

router.post('/create-new/invoice', async (req, res) => {

    if(res.locals.user){
        const courseId = req.body.courseId;

        const invoice = await getUnPaymentInvoice(res.locals.user.id);

        var courseInvoice;
        if(invoice == null) {
            const newInvoice = await createNewInvoice(res.locals.user.id);

            courseInvoice = await addCourseInvoice(newInvoice.id, courseId);
        }else{
            courseInvoice = await addCourseInvoice(invoice.id, courseId);
        }
        if(courseInvoice !== null) res.send({code: '00'});
        else res.send({code: '01'});
    }else res.send({code: '02'});
});

module.exports = router;

