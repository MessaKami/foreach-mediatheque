const express = require('express')
const router = express.Router()
// will render the list of all users
router.get('/', (req, res) => res.send('users list'))
// will render the new user form
router.get('/new', (req, res) => res.send('new user form'))
// will return info about specific user
router.get('/:id', ({ params }, res) => res.send(`id user : ${params.id}`))
// export the modules
module.exports = router




const users = [{ name: 'John'}, { name: 'foobar'}]

router.param('id', (req, res, next, id) => {
    console.log('id: ', id, ' from param')
    req.user = users[id] ?? users[0]
    next()
})

router.get('/:id', (req, res) => res.json(req.user))
router.get('/sub/:id', (req, res) => res.json(req.user)) 
router.get('/new', (req, res) => res.render('users/new'))

const mysqlCO = require('../utils/utils.js')

router.post('/create', mysqlCO, ({body}, res) => {
	try {
	console.log('body of create route', body)
	if(body.email && body.password && body.pseudo) {
		const sqlQuery = `INSERT INTO tbl_users
			VALUES (NULL, '${body.email}', '1', SHA1('${body.password}'), CURRENT_TIMESTAMP, '0', '${body.pseudo}')`

	con.query(sqlQuery, (err, result) => {
		if (err) {
			console.log(err);
			res.json({ err });
		}
		console.log('result ', result);
					 res.json({ result })
					 con.destroy()
		})
    } else {
	res.json({ error: 'Missing required params for create user route'})
		}
	} catch (e) {
		res.send(JSON.stringify(e))
	}
})