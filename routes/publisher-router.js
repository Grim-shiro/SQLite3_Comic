const express = require('express') //routing framework
const exphbs = require ('express-handlebars')
const path = require('path') //helps assemble file paths
const sqlite3 =  require('sqlite3')
const {open} = require('sqlite')
const { Console } = require('console')
//const bcrypt = require('bcrypt')
var db = new sqlite3.Database('data/db_comics')
let router = express.Router();

router.get("/",loadHouseDB);
//router.get("/",respondHouses);

router.get("/:company", [getHouse]);

function getHouse(req, res, next){
	//Get the id parameter
	let work = req.params;
    console.log(req.params)
    
    //console.log(id)
	const publisher = db.all(`SELECT * FROM Company natural join mangas where company like "${work.company}" Order by company ASC;`, (err,rows)=>
	{
		if(rows){
            house = {}
			 house.company = rows[0].company;
             house.since = rows[0].since;
             house.mangas = []
             for(let i =0; i < rows.length; ++i){
                 house.mangas.push({
                     title : rows[i].title,
                     genre : rows[i].genre
                 })
             }

			return res.render('main', {layout: 'singlePublisher', house})
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


function loadHouseDB(req,res,next){
    let page = req.query;
    let query = ""
    let count = 0;
	if(page){
		for(const key in page){
			if(page.searchPublisher){
				query += `Where company like '${page.searchPublisher}%'`
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
    
    const publishers = db.all(`SELECT rowid,* FROM Company ${query} Order by company;`, (err,rows)=>
	{
		let publishers = []
		for(let i =0; i< rows.length; ++i){
			publishers.push(rows[i]);
		}
		res.publishers = publishers
        return res.render('main', {layout: 'publisher', publishers})
		next()
	}) 
}





//Export the router object, so it can be mounted in the store-server.js file
module.exports = router;