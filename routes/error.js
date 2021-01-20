const express = require('express')
const router = express.Router();

router.get('/401', (req, res) =>  {
    res.render('pages/error/401', {
        layout: false
    })
})

module.exports = router;