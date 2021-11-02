console.log('server is running')

const express = require('express')
const app = express()
const cors = require('cors')
app.use(cors())
app.listen(process.env.PORT || 3000)

app.get('/', (req, res) => res.send('You reached the root url'))
//app.get('/dl', (req, res) => res.download('relative/path/to/file'))


app.get('/json', (req, res) => {
    try {
        res.json({ message: 'hi'})
    } catch (error) {
        console.log(error);
        res.status(500).json(error)
    }
})

const userRouter = require('./routes/users')
app.use('/users', userRouter)

const multer = require('multer');
const upload = multer()
// for parsing multipart/form-data
app.use(upload.any())

app.post('/testFormData', ({ body }, res) => {
    try {
        console.log('body', body)
        res.send('ok')
    }catch(error) {
        console.log('error ', error)
        res.send(JSON.stringify(error))
    }
})
