
const express = require('express')
const app = express()
app.use('/', express.static('public'))
app.listen(8080)

const Sequelize = require('sequelize')
const sequelize = new Sequelize('Library', 'root', '', {
    dialect: "mysql",
    host: "localhost"
})
sequelize.authenticate().then(() => {
    console.log("Connected to database")
}).catch(() => {
    console.log("Unable to connect to database")
})

const Books = sequelize.define('Books', {
    id: Sequelize.smallint(5),
    title:Sequelize.varchar(30),
    author:Sequelize.varchar(100),
    createdAt:Sequelize.timestamp,
    updatedAt:Sequelize.timestamp,
    category: Sequelize.varchar(50)
})
const FavoriteBooks = sequelize.define('FavoriteBooks', {
    id: Sequelize.smallint(5),
    rating:Sequelize.double(2,2),
    id_book:Sequelize.smallint(5),
    createdAt:Sequelize.timestamp,
    updatedAt:Sequelize.timestamp,
    
})
const Details = sequelize.define('Details', {
    id: Sequelize.smallint(5),
    language:Sequelize.varchar(30),
    publish_date:Sequelize.date,
    price:Sequelize.double(2,2),
    link:Sequelize.varchar(80),
    isAvailable:Sequelize.tinyint(1),
    createdAt:Sequelize.timestamp,
    updatedAt:Sequelize.timestamp,
    id_book: Sequelize.smallint(5)
})



app.get('/createdb', (request, response) => {
    sequelize.sync({force:true}).then(() => {
        response.status(200).send('tables created')
    }).catch((err) => {
        console.log(err)
        response.status(200).send('could not create tables')
    })
})