const express = require('express') //routing framework
const exphbs = require ('express-handlebars')
const path = require('path') //helps assemble file paths
const sqlite3 =  require('sqlite3')
const {open} = require('sqlite')
const { Console } = require('console')
//const bcrypt = require('bcrypt')
var db = new sqlite3.Database('data/db_comics')
let router = express.Router();

router.get("/",loadMangaDB);
router.get("/",respondMangas);

router.get("/:title", [getManga]);

function getManga(req, res, next){
	//Get the id parameter
	let work = req.params;
	console.log(work.title)
    //console.log(id)
	const mangas = db.all(`SELECT * FROM Mangas where title like "${work.title}" Order by title ASC;`, (err,rows)=>
	{
		if(rows){
			let manga = rows[0];
			return res.render('main', {layout: 'manga', manga})
		next();
		}else{
			res.status(404).send("Could not find user.");
		}
	})
	//res.status(404).send("Could not find user.");

	//If the user profile exists, load it, parse object
	// and add the user property to the request before
	// calling next middleware
	/*if(fs.existsSync(fileName)){
		let data = fs.readFileSync(fileName);
		req.user = JSON.parse(data);
		next();
	}else{
		res.status(404).send("Could not find user.");
	}*/
}


function loadMangaDB(req,res,next){
    let page = req.query;
    let query = ""
    let count = 0;
	if(page){
		for(const key in page){
			if(page.searchManga){
				query += `Where title like '${page.searchManga}%'`
				break;
			}
			if(!count){
				query += `Where ${key} like '%${page[key]}%'`
				count++;
			}else{
				query += `AND ${key} like '%${page[key]}%'`
			}
		}
	}
    
    const mangas = db.all(`SELECT rowid,* FROM Mangas ${query} Order by title;`, (err,rows)=>
	{
		let mangas = []
		for(let i =0; i< rows.length; ++i){
			mangas.push(rows[i]);
		}
		res.mangas = mangas
		next()
	}) 
}

function respondMangas(req, res, next){
	res.format({
		"text/html": () => {res.status(200).send(createHTML(res.mangas, req))},
		"application/json": () => {res.status(200).json(res.mangas)}
	});
	next();
}

function createHTML(mangas, req){
	let result = "";

	result += `<html lang="en">

	<head>
		<title>Manga Directory</title>
		<div class="topnav">
		<a class="active" href="http://localhost:3000/">Home</a>
		<a href="http://localhost:3000/authors">Author Directory</a>
		<a href="http://localhost:3000/mangas">Manga Directory</a>
		<a href="http://localhost:3000/publishers">Publishing Companies</a>
		<a href="http://localhost:3000/user">Login</a>
		<form action="/searchManga" method="get">
		<input type="text" id="searchManga" name="searchManga" placeholder="Search.."/>
		<button class="pull-left" style="margin-right:5px" type="submit">send</button>
		</form>
		</div>
		<style>
			.topnav {
				overflow: hidden;
				background-color: #e9e9e9;
			}
			
			/* Style the links inside the navigation bar */
			.topnav a {
				float: left;
				display: block;
				color: black;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 17px;
			}
			
			/* Change the color of links on hover */
			.topnav a:hover {
				background-color: #ddd;
				color: black;
			}
			
			/* Style the "active" element to highlight the current page */
			.topnav a.active {
				background-color: #2196F3;
				color: white;
			}
			
			/* Style the search box inside the navigation bar */
			.topnav input[type=text] {
				float: right;
				padding: 6px;
				border: none;
				margin-top: 8px;
				margin-right: 16px;
				font-size: 17px;
			}
	
			.topnav button[type="submit"]{
				float: right;
				padding: 6px;
				border: none;
				margin-top: 8px;
				margin-right: 5px;
				font-size: 17px;
			}
			
			/* When the screen is less than 600px wide, stack the links and the search field vertically instead of horizontally */
			@media screen and (max-width: 600px) {
				.topnav a, .topnav input[type=text] {
				float: none;
				display: block;
				text-align: left;
				width: 100%;
				margin: 0;
				padding: 14px;
				}
				.topnav input[type=text] {
				border: 1px solid #ccc;
				}
			}
			body {
				font-family: verdana;
				background-color: #effaf6;
			}
			
			h1 {
				color: black;
			}
			
			p, li {
				font-size: 20px;
			}
			table {
				border-collapse: collapse;
				width: 50%;
			}
			
			th, td {
				padding: 8px;
				text-align: left;
				border-bottom: 1px solid #ddd;
			}
			tr:hover {background-color:#f5f5f5;}
		</style>
	</head>
	<body>`;
	result += `<table>
    <tr>
        <th>Index Directory</th>
    </tr>`;

	//Make a link for each user
	mangas.forEach(manga => {
		result += `<tr><td><a href="http://localhost:3000/mangas/${manga.title}">${manga.title}</a></td></tr>`;
	});

	result += `</table>
	</body></html>`;
	return result;
}



//Export the router object, so it can be mounted in the store-server.js file
module.exports = router;