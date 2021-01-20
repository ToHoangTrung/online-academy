var express = require('express');
const { getUnPaymentInvoice, updateInvoice, getInvoiceCourses, addCourseUser } = require('../service/invoice.service');
const { getAllUserCourses } = require('../service/user.service');
var router = express.Router();

router.get('/', async (req, res) => {

    var userUnPaymentInvoice = await getUnPaymentInvoice(res.locals.user.id);

    var userCourses = await getAllUserCourses(res.locals.user.id, type = 2);

    if(userCourses.length == 0) userCourses = null;
    
    if(userUnPaymentInvoice !== null && userUnPaymentInvoice.courses.length > 0) {
        res.render('pages/payment', {
            css: ['payment'],
            code: '',
            message: 'found user cart',
            userUnPaymentInvoice,
            userCourses
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

router.post('/payment_success', async (req, res) => {
    var paymentType = req.body.type;
    var orderDate = req.body.orderDate;
    var invoiceId = req.body.invoiceId;
    var invoiceStatus = 3;

    var resultUpdate = await updateInvoice(invoiceid = invoiceId, orderdate = orderDate, refunddate = null, invoicestatus = invoiceStatus, user = null, paymenttype = paymentType, coupon = null);

    if(resultUpdate > 0) {
        var invoiceCourses = await getInvoiceCourses(invoiceId);
        console.log(invoiceCourses);
        for(var i = 0; i < invoiceCourses.length; i++){
            var userCourse = await addCourseUser(res.locals.user.id, invoiceCourses[i].courseId);
            if(userCourse == null) res.send({code: '01', message: 'create payment fail'});
        }
        res.send({code: '00', message: 'create payment success'});
    }else{
        res.send({code: '01', message: 'create payment fail'});
    }
});

router.post('/create_payment_url', function (req, res) {
    var ipAddr = req.headers['x-forwarded-for'] ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress;

    var dateFormat = require('dateformat');

    var tmnCode = process.env.vnp_TmnCode;
    var secretKey = process.env.vnp_HashSecret;
    var vnpUrl = process.env.vnp_Url;
    var returnUrl = process.env.vnp_ReturnUrl;

    var date = new Date();

    var createDate = dateFormat(date, 'yyyymmddHHmmss');
    var orderId = dateFormat(date, 'HHmmss');

    var amount = req.body.amount;
    var bankCode = req.body.bankCode;
    var orderInfo = req.body.orderInfo + ": " + dateFormat(Date(), 'yyyymmddHHmmss');
    var orderType = req.body.orderType;
    var locale = req.body.locale;

    if(locale === null || locale === ''){
        locale = 'vn';
    }
    var currCode = 'VND';
    var vnp_Params = {};
    vnp_Params['vnp_Version'] = '2';
    vnp_Params['vnp_Command'] = 'pay';
    vnp_Params['vnp_TmnCode'] = tmnCode;
    // vnp_Params['vnp_Merchant'] = ''
    vnp_Params['vnp_Locale'] = locale;
    vnp_Params['vnp_CurrCode'] = currCode;
    vnp_Params['vnp_TxnRef'] = orderId;
    vnp_Params['vnp_OrderInfo'] = orderInfo;
    vnp_Params['vnp_OrderType'] = orderType;
    vnp_Params['vnp_Amount'] = amount * 100;
    vnp_Params['vnp_ReturnUrl'] = returnUrl;
    vnp_Params['vnp_IpAddr'] = ipAddr;
    vnp_Params['vnp_CreateDate'] = createDate;
    if(bankCode !== null && bankCode !== ''){
        vnp_Params['vnp_BankCode'] = bankCode;
    }

    vnp_Params = sortObject(vnp_Params);

    var querystring = require('qs');
    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });

    var sha256 = require('sha256');

    var secureHash = sha256(signData);

    vnp_Params['vnp_SecureHashType'] =  'SHA256';
    vnp_Params['vnp_SecureHash'] = secureHash;

    vnpUrl += '?' + querystring.stringify(vnp_Params, { encode: true });
    res.status(200).json({code: '00', vnpLink: vnpUrl})
});

router.get('/vnpay_return', function (req, res, next) {
    var vnp_Params = req.query;

    var secureHash = vnp_Params['vnp_SecureHash'];

    delete vnp_Params['vnp_SecureHash'];
    delete vnp_Params['vnp_SecureHashType'];

    vnp_Params = sortObject(vnp_Params);

    var tmnCode = process.env.tmnCode;
    var secretKey = process.env.vnp_HashSecret;

    var querystring = require('qs');
    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });

    var sha256 = require('sha256');

    var checkSum = sha256(signData);

    if(secureHash === checkSum){
        res.render('pages/payment', {
            css: ['payment'],
            user: null,
            code: vnp_Params['vnp_ResponseCode']
        });

    } else{
        res.render('pages/payment', {
            css: ['payment'],
            user: null,
            code: '97'
        });
    }
});

router.get('/vnpay_ipn', function (req, res) {
    var vnp_Params = req.query;
    var secureHash = vnp_Params['vnp_SecureHash'];

    delete vnp_Params['vnp_SecureHash'];
    delete vnp_Params['vnp_SecureHashType'];

    vnp_Params = sortObject(vnp_Params);

    var secretKey = process.env.vnp_HashSecret;
    var querystring = require('qs');

    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });
    
    var sha256 = require('sha256');

    var checkSum = sha256(signData);

    if(secureHash === checkSum){
        var orderId = vnp_Params['vnp_TxnRef'];
        var rspCode = vnp_Params['vnp_ResponseCode'];
        res.status(200).json({RspCode: '00', Message: 'success'})
    }
    else {
        res.status(200).json({RspCode: '01', Message: 'Fail checksum'})
    }
});

function sortObject(o) {
    var sorted = {},
        key, a = [];

    for (key in o) {
        if (o.hasOwnProperty(key)) {
            a.push(key);
        }
    }

    a.sort();

    for (key = 0; key < a.length; key++) {
        sorted[a[key]] = o[a[key]];
    }
    return sorted;
}





module.exports = router;