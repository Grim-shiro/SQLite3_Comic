const express = require('express') //routing framework
const exphbs = require ('express-handlebars')
const session = require ('express-session')
const path = require('path') //helps assemble file paths
const sqlite3 =  require('sqlite3')
const {open} = require('sqlite')
//const bcrypt = require('bcryptjs')
//const bcrypt = require('bcrypt')



const app = express();

//var hbs = exphbs.create({defaultLayout: 'main'});
//app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars')
app.engine('handlebars', exphbs.engine({
  layoutsDir: __dirname + '/views/layouts',
  }));


app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));



const dbPromise = open({
  filename: 'data/db_comics',
  driver: sqlite3.Database
})
app.use(express.urlencoded())
app.use(express.json());

let mangaRouter = require('./routes/manga-router')
let authorRouter = require('./routes/author-router')
let userRouter = require('./routes/user-router')
let publisherRouter = require('./routes/publisher-router')

app.use("/mangas", mangaRouter);
app.use("/searchManga", mangaRouter);
app.use("/authors", authorRouter);
app.use("/searchAuthor", authorRouter);
app.use("/user", userRouter);
app.use("/publishers", publisherRouter);
app.use("/searchPublisher", publisherRouter);


app.get('/', (req, res) => {
  //Serves the body of the page aka "main.handlebars" to the container //aka "index.handlebars"
  res.redirect('/home');
  });


app.get('/home', async (req, res) => {
    const db = await dbPromise;
    const mostPopAuthors = await db.all('select aname as name from ((select max(cnt) as cnt from (select aname,count(userid)as cnt from authors natural left join users group by aname)) natural join (select aname,count(userid) as cnt from authors natural left join users group by aname));')
    const mangas = await db.all('select title from ((select max(cnt) as cnt from (select title,count(userid)as cnt from mangas natural left join users group by title)) natural join (select title,count(userid) as cnt from mangas natural left join users group by title));')

    res.render('main', {layout: 'home', mangas, mostPopAuthors})
  })

  app.get('/manga/add', async (req, res) => {
    const db = await dbPromise;

    res.render('main', {layout: 'add-upt'})
  })



const PORT = process.env.PORT || 3000;

const setup = async () => {
    const db = await dbPromise
    await db.migrate()
    app.listen(PORT, () => {
      console.log('listening on localhost:3000')
      console.log('To authenticate For User in login page use: ')
      console.log({username: 'student', password : 'student'})
    })
  }
setup()


