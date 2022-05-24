const express = require('express');
const session = require('express-session');
const path = require('path');
const sqlite3 =  require('sqlite3').verbose()
const {open} = require('sqlite')




//const bcrypt = require('bcrypt')
var db = new sqlite3.Database('data/db_comics')
let router = express.Router();


//router.get("/", authenticate);

router.get('/', function(request, response) {
	response.render('main', {layout: 'login'})
});

router.post('/auth', authenticate);

router.get('/signup', function(request, response) {
	response.render('main', {layout: 'signup'})
});

router.delete('/logout', (req, res) => {
    console.log(req.session)
    if (req.session) {
      req.session.destroy(err => {
        if (err) {
          res.status(400).send('Unable to log out')
        } else {
          res.redirect('/home')
        }
      });
    } else {
      res.end()
    }
  })

router.post('/add',async (req,res)=>{
    console.log("Post Add to Database")
    console.log(req.body);
    let title = req.body.title;
	let author = req.body.author;
    let genre = req.body.genre;
    let ryear = req.body.release;
    let company = req.body.publisher;
    let summary = req.body.summary;
    await db.serialize(function(){
        let sqlString = `INSERT OR REPLACE INTO Mangas values ("${title}","${genre}",null,"${summary}","${ryear}","${company}");`
        db.run(sqlString);
        sqlString = `INSERT OR REPLACE INTO authors values ("${author}","${title}",null,null);`
        db.run(sqlString);
        sqlString = `INSERT OR REPLACE INTO Company values ("${company}",null);`
        db.run(sqlString);
    })
    res.render('main', {layout:'add-upt'})
})

router.get("/:uid", getUser);

function authenticate(request, response) {
	// Capture the input fields
	let username = request.body.username;
	let password = request.body.password;
	// Ensure the input fields exists and are not empty
	if (username && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		const users = db.all(`SELECT  distinct userid,pass FROM users where userid like '${username}' ;`, (err,rows)=>
        {
            if (rows.length) {
				// Authenticate the user
                if(username == rows[0].userid & password == rows[0].pass){
                    request.session.loggedin = true;
                    request.session.username = username;
                    request.session.save()
                    return response.redirect(`/user/${username}`);
                }else {
                    //alert({ error: 'Wrong username or password'});
                    message = {
                        alert : 'Wrong Password entered!'
                    }
                    response.render('main', {layout: 'login', message})
                }
                
				// Redirect to home page
				
			}else{
                message = {
                    alert : `User with username ${username} Does Not Exist.\n\t Redirecting to Signup `
                }
                response.render('main', {layout: 'login', message})
            }
        })}else{
            //alert('Please enter Username and Password!')
            message = {
                alert : 'Please enter Username and Password!'
            }
            response.render('main', {layout: 'login', message})
        }
}

function getUser(req, res, next){
	//Get the id parameter
	let id = req.params;
    //console.log(req.session.username)
    if(!req.session.username){
        return res.redirect('/user')
    }else if(req.session.username != id.uid){
        return res.redirect('/user')
    }
    

    
	const users = db.all(`SELECT * FROM (SELECT * FROM authors natural join mangas) natural join users where userid like '${id.uid}' ;`, (err,rows)=>
	{
        let user = {}
		if(rows[0]){
            user.name = rows[0].username
            user.username = rows[0].userid
            user.authors = []
            user.mangas = []
            for (let i =0; i< rows.length; ++i){
                    user.authors.push({
                        name : rows[i].aname,
                        gender : rows[i].gender
                    })
                    if((i>0)&& ( i < user.authors.length) && (user.authors[i-1].name == rows[i].aname)){
                        user.authors.pop();
                    }
                
                user.mangas.push({
                    title : rows[i].title,
                    genre : rows[i].genre
                })
            }
            return res.render('main', {layout: 'profile', user})

		next();
		}else{
			res.status(404).send("Could not find user.");
		}
	})
}

//Export the router object, so it can be mounted in the store-server.js file
module.exports = router;