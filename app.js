const express = require('express');
const path = require('path');
const hbs = require('express-handlebars');
const sassMiddleware = require('node-sass-middleware');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const User = require("./models/user");
require('dotenv').config();
require('./models/relation-mapping');
const {verifyJwt} = require("./service/auth.service");

const app = express();

app.engine('hbs', hbs({
    defaultLayout: 'main.hbs',
    extname: '.hbs',

}))
app.set('view engine', 'hbs');
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
        // secure: true
    }
}));
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(
    sassMiddleware({
        src: __dirname + '/public/assets/scss',
        dest: path.join(__dirname, '/public/assets/css'),
        prefix: '/assets/css',
        debug: true,
    })
)
app.use(verifyJwt);
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./routes/index'));
app.use('/user', require('./routes/user'));
app.use('/instructor', require('./routes/instructor'));
app.use('/admin', require('./routes/admin'));
app.use('/api/category', require('./api/category.api'));
app.use('/error', require('./routes/error'));
app.use('/test', require('./routes/test'));
app.use('/cart', require('./routes/cart'));
app.use('/cart/payment', require('./routes/payment'));
app.use('/my-courses', require('./routes/my-course'));

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`app listening on port ${PORT}`);
})
