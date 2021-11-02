const mysql = require('mysql')
module.exports = ({ hostname }, res, next) => {
    console.log('hostname ',hostname)
    if(['localhost', '127.0.0.1', '[::1]'].includes(hostname)){
        console.log('localhost req')
        con = mysql.createConnection({ host: "127.0.0.1", user: "root", port: '3307', password: "password", database: 'mediatheque' })
    }else{
        con = mysql.createConnection({ host: "alwaysdata.net", user: "", password: "", database: '' })
    }
    con.connect((err) => {
        if (err) throw err;
        console.log("Connected!");
      })
    next()
    }
