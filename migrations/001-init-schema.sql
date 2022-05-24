--Up
DROP TABLE IF EXISTS Mangas;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Reads;
DROP TABLE IF EXISTS Writes;


CREATE TABLE Mangas (
    title text primary key not null, 
    genre text not null,
    art text,  --contains .png file names
    summary text ,
    ryear text not null,
    company text --publishing company
);

CREATE TABLE Authors(
    aname text not null, 
    title text not null,
    gender text,
    picture text, -- .png if one is found
    FOREIGN KEY(title) REFERENCES Mangas(title),
    primary key (aname,title)
);


CREATE TABLE Users (
    userid text not null,
    title text not null,
    username text not null,
    pass not null,
    FOREIGN KEY(title) REFERENCES Mangas(title),
    primary key (userid,title)
);

INSERT OR REPLACE INTO Mangas VALUES ("Preference for the Possessor", "Isekai", "Preference-for-the-Possessor","Prepare for the afterlife! A strange spam text message I received right before my death. When I realized I was dead, I opened my eyes and it was a possession examination station. Is there really an afterlife? Will you be possessed by a book? “Do you have a particular genre you like?” I, who mastered all genres with virtue in my previous life. In the next life, I hoped for a child-rearing product that would become a cute, dainty girl and occupy infinite love. The book I will be possessed of is – Survival Difficulty S-class, an infinite regression full of scary plot . The character to be possessed there is–","2022","Kakaopage");
INSERT OR REPLACE INTO Mangas VALUES ("The Princess Imprints a Traitor", "Drama", null,"The seventh imperial princess, Evenrose, once died. Her last memory was of the royal family was destroyed by the Homunculus, the rebelling slaves, and of her sister who had sided with the rebels and urged her to escape her painful execution by swallowing poison.","2021","Tapas");
INSERT OR REPLACE INTO Mangas VALUES ("Please Don’t Come To The Villainess’ Stationery Store!", "Shoujo", null,"She became the incompetent villainess who commits wrongdoings in order to earn the love of her fiance, the male lead. Her reputation was already at rock bottom and the main characters, who can’t live without each other, are having an affair. 
So after she was kicked out, she set up a stationery store in front of a school. She reminisces of snacks, beer candy, and even bubbles! Just you wait, kids! But… somehow her young customers are a little weird? The great magic swordsman, the next crown prince, the villainous tower master, and finally, the hidden villain. 
The stationery store, which she thought would be peaceful, left her with no rest. 
Help me! I just wanted to live a normal life!","2020","Tapas");
INSERT OR REPLACE INTO Mangas VALUES ("Skip Beat!", "Drama", null,"Kyouko Mogami lived solely for her childhood friend Shoutaro 'Shou' Fuwa. She follows Shou to Tokyo so that he may realize his dream of becoming a famous singer. When his dream is realized, Kyouko overhears the truth behind his decision to bringing her with him: he was using her as a maid.","2002","Hakusensha");
INSERT OR REPLACE INTO Mangas VALUES ("Butler(Nabit)", "Yaoi", null,"Seo Yian is a Beta butler servicing the handsome Alpha CEO, Yoo Jekwon, who he is in love with. However, Mr. Yoo has an Omega lover, forcing Yian to restrain his feelings of yearning and desire. But once Mr. Yoo and Yian found out the Omega lover's infidelity, Yian started to make his move.","2020","Mr.Blue");
INSERT OR REPLACE INTO Mangas VALUES ("Death's Game", "Psychological", null,"He’s perennially unemployed, his ex-girlfriend has moved on, and he’s just lost all his life savings to a bitcoin scam. Burdened by societal pressures, Yijae Choi decides to take his own life. Insulted by his flippant attitude towards dying, Death comes to punish him with her game: he must experience death over and over again through 13 other lives. But if he can find a way to survive the imminent death coming for these lives, he gets to live out their lifetime. His life was a bust, but what about the lives of others?","2019","Naver");
INSERT OR REPLACE INTO Mangas VALUES ("Love So Life", "Shoujo", null,"Shiharu is a high-school student who loves kids, lives in an orphanage, and works at a daycare... Until the handsome uncle of two-year-old twins offers her a raise if she'll be their babysitter. Often relying on memories of her mother's actions for guidance, Shiharu quickly finds herself falling in love with her new makeshift family.","2008","Hakusensha");
INSERT OR REPLACE INTO Mangas VALUES ("W Juliet", "Gender-Bender,Romance", null,"Sixteen-year-old tomboy Ito Miura has become fast friends with her schoolmate and fellow drama enthusiast Makoto Amano. The problem? Makoto's a boy who must pass as a female drama student in order for his family to approve of his acting ambitions.","1997","Hakusensha");
INSERT OR REPLACE INTO Mangas VALUES ("Voice Over! - Seiyu Academy", "Gender-Bender,Shoujo,Slice-of-Life,Comedy", null,"Hime Kino's dream is to one day perform voice acting like her hero, Sakura Aoyama, from the Lovely Blazer anime. So getting accepted to the prestigious Hiragi Academy's voice actor department is the first step in the right direction! But on her first day of class she meets Sakura's grouchy son, Senri, who tells Hime that her voice is awful and Lovely Blazers is stupid. Hime will not let that stand unchallenged. She'll show everyone that she IS a voice-acting princess, whether they like it or not!!","2009","Hakusensha");
INSERT OR REPLACE INTO Mangas VALUES ("Overlord", "Action,Adventure,Comedy,Fantasy,Sci-Fi", null,"The final hour of the popular virtual reality game Yggdrasil has come. However, Momonga, a powerful wizard and master of the dark guild Ainz Ooal Gown, decides to spend his last few moments in the game as the servers begin to shut down. To his surprise, despite the clock having struck midnight, Momonga is still fully conscious as his character and, moreover, the non-player characters appear to have developed personalities of their own!
Confronted with this abnormal situation, Momonga commands his loyal servants to help him investigate and take control of this new world, with the hopes of figuring out what has caused this development and if there may be others in the same predicament.","2014","Kadokawa Shoten");
INSERT OR REPLACE INTO Mangas VALUES ("Banana Fish", "Actio,Drama,Mature,Mystery,Psychological,Shoujo,Tragedy",null,"Nature made Ash Lynx beautiful; nurture made him a cold ruthless killer. A runaway brought up as the adopted heir and sex toy of 'Papa' Dino Golzine, Ash, now at the rebellious age of seventeen, forsakes the kingdom held out by the devil who raised him. But the hideous secret that drove Ash's older brother mad in Vietnam has suddenly fallen into Papa's insatiably ambitious hands--and it's exactly the wrong time for Eiji Okamura, a pure-hearted young photographer from Japan, to make Ash Lynx's acquaintance...
Epic in scope, and one of the best-selling shojo titles of all time in Japan, Akimi Yoshida put an electric shock into the genre and gained a huge crossover audience through Banana Fish's stripped-down, non-stop style.","1985","Shogakukan");
INSERT OR REPLACE INTO Mangas VALUES ("Yume no Sono", "Drama, Josei, Slice of Life",null,"Collection of one shots.","2005",null);
INSERT OR REPLACE INTO Mangas VALUES ("Area no Kishi", "Comedy, Drama, School Life, Shounen, Sports",null,"Aizawa Kakeru is an energetic and dedicated eighth grader who serves as the manager for his school’s football team. Though he was well known for being a talented player the previous year, an accident during one of his games caused Kakeru to vow never to play competitively again. Still passionate about the sport, Kakeru dreams of one day becoming a professional football trainer so that he can work alongside his older brother Suguru, the ace of the school team who has represented Japan in international competition.","2006","Kodansha");
INSERT OR REPLACE INTO Mangas VALUES ("Mob Psycho 100", "Action, Comedy, Drama, Psychological, School Life, Sci-fi",null,"Kageyama Shigeo (a.k.a. Mob ) is an 8th grader with psychic abilities. He could bend spoons and lift objects with his mind from a young age, but he slowly began to withhold from using his abilities in public due to the negative attention he kept receiving. Now, the only thing he wants is to become friends with a girl in his class, Tsubomi. With his psychic 'mentor' (who has no psychic powers), he continues his daily life, attempting to realize his purpose in life.","2012","Shogakukan");
INSERT OR REPLACE INTO Mangas VALUES ("One Punch-Man", "Action, Adventure, Comedy, Drama, Sci-fi, Seinen, Supernatural",null,"In this new action-comedy, everything about a young man named Saitama screams 'AVERAGE', from his lifeless expression to his bald head, to his unimpressive physique. However, this average-looking fellow doesn't have your average problem... He's actually a superhero that's looking for tough opponents! The problem is, every time he finds a promising candidate he beats the snot out of them in one punch. Can Saitama finally find an evil villain strong enough to challenge him? Follow Saitama through his hilarious romps as he searches for new bad guys to challenge!","2012","Shueisha");
INSERT OR REPLACE INTO Mangas VALUES ("Reigen", "Action, Comedy, School Life, Shounen, Slice of Life, Supernatural",null,"Meet the self-proclaimed exorcist, spiritualist, and psychic himself. What he lacks in strength, he makes up for in charisma. What he lacks in bravery, he makes up for in ingenuity. What he lacks in heroism, he makes up for with massages and life advice. This is the story of Arataka Reigen and the Spirits and Such Consultation Office.","2018","Shogakukan");
INSERT OR REPLACE INTO Mangas VALUES ("Fairy Tail", "Action, Adventure, Comedy, Drama, Ecchi, Fantasy, Shounen",null,"Celestial wizard Lucy wants to join the Fairy Tail, a guild for the most powerful wizards. But instead, her ambitions land her in the clutches of a gang of unsavory pirates led by a devious magician. Her only hope is Natsu, a strange boy she happens to meet on her travels. Natsu's not your typical hero - but he just might be Lucy's best hope.","2006","Kodansha");
INSERT OR REPLACE INTO Mangas VALUES ("Rave", "Action, Adventure, Comedy, Drama, Fantasy, Shounen",null,"The Continent of Song is in chaos. The sinister secret society known as Demon Card is using the power of Dark Bring to destroy everything in their path. The only things capable of stopping Dark Bring are the Rave stones. Unfortunately, the Rave Stones were scattered around the globe in an explosion 50 years ago, so now they must be collected by the Rave Master in order to stop Dark Bring once and for all. This new task has been given to Haru Glory, a sixteen year old boy from Garage Island.","1999","Kodansha");

INSERT OR REPLACE INTO Mangas VALUES ("Banana Fish", "Gender-Bender,Shoujo,Slice-of-Life,Comedy",null,"Nature made Ash Lynx beautiful; nurture made him a cold ruthless killer. A runaway brought up as the adopted heir and sex toy of 'Papa' Dino Golzine, Ash, now at the rebellious age of seventeen, forsakes the kingdom held out by the devil who raised him. But the hideous secret that drove Ash's older brother mad in Vietnam has suddenly fallen into Papa's insatiably ambitious hands--and it's exactly the wrong time for Eiji Okamura, a pure-hearted young photographer from Japan, to make Ash Lynx's acquaintance...
Epic in scope, and one of the best-selling shojo titles of all time in Japan, Akimi Yoshida put an electric shock into the genre and gained a huge crossover audience through Banana Fish's stripped-down, non-stop style.","1985","Shogakukan");

INSERT OR REPLACE INTO Mangas VALUES ("Banana Fish", "Gender-Bender,Shoujo,Slice-of-Life,Comedy",null,"Nature made Ash Lynx beautiful; nurture made him a cold ruthless killer. A runaway brought up as the adopted heir and sex toy of 'Papa' Dino Golzine, Ash, now at the rebellious age of seventeen, forsakes the kingdom held out by the devil who raised him. But the hideous secret that drove Ash's older brother mad in Vietnam has suddenly fallen into Papa's insatiably ambitious hands--and it's exactly the wrong time for Eiji Okamura, a pure-hearted young photographer from Japan, to make Ash Lynx's acquaintance...
Epic in scope, and one of the best-selling shojo titles of all time in Japan, Akimi Yoshida put an electric shock into the genre and gained a huge crossover audience through Banana Fish's stripped-down, non-stop style.","1985","Shogakukan");

--more join
--search bar (specific Mangas name, or author)
--genre (join where author has written romance) [advanced search]
    --select male or female


INSERT OR REPLACE INTO Authors VALUES ("Lee Rin-B","Preference for the Possessor","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Lee Rin-B","The Princess Imprints a Traitor","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Yeo Ro-eun","Please Don’t Come To The Villainess’ Stationery Store!", null, null);
INSERT OR REPLACE INTO Authors VALUES ("NAKAMURA Yoshiki","Skip Beat!","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Nabit","Butler(Nabit)","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Lee WonSik","Death's Game","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("Kouchi Kaede","Love So Life","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Emura","W Juliet","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Minami Maki","Voice Over! - Seiyu Academy","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("Maruyama Kugane","Overlord","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("YOSHIDA Akimi","Banana Fish","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("YOSHIDA Akimi","Yume no Sono","Female", null);
INSERT OR REPLACE INTO Authors VALUES ("IGANO Hiroaki","Area no Kishi","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("One","Mob Psycho 100","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("One","One Punch-Man","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("One","Reigen","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("MASHIMA Hiro","Fairy Tail","Male", null);
INSERT OR REPLACE INTO Authors VALUES ("MASHIMA Hiro","Rave","Male", null);

INSERT OR REPLACE INTO Users VALUES ("achandra","Love So Life", "Apira Chandrakumar", "9373fksx");
INSERT OR REPLACE INTO Users VALUES ("achandra","Preference for the Possessor", "Apira Chandrakumar", "9373fksx");
INSERT OR REPLACE INTO Users VALUES ("achandra","Death's Game", "Apira Chandrakumar", "9373fksx");
INSERT OR REPLACE INTO Users VALUES ("nmavai","Banana Fish", "Nistha Mavai", "Secret1");
INSERT OR REPLACE INTO Users VALUES ("nmavai","Death's Game", "Nishtha Mavai", "Secret1");
INSERT OR REPLACE INTO Users VALUES ("kgoswami","Banana Fish", "Kruti Goswami", "Secret");



--Down
DROP TABLE IF EXISTS Mangas;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Reads;
DROP TABLE IF EXISTS Writes;


