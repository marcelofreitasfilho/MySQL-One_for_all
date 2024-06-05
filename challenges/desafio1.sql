DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.Plan (
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
	plan_name VARCHAR(50) NOT NULL,
	plan_price DECIMAL(5,2) NOT NULL
);

CREATE TABLE SpotifyClone.Artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
	artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE SpotifyClone.User (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50) NOT NULL,
	user_age INT NOT NULL,
	plan_id INT NOT NULL,
	signed_date DATE NOT NULL,

	FOREIGN KEY (plan_id) REFERENCES Plan(plan_id)
);

CREATE TABLE SpotifyClone.Following (
	user_id INT NOT NULL,
	artist_id INT NOT NULL,

	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),

	CONSTRAINT PRIMARY KEY (user_id, artist_id)
);

CREATE TABLE SpotifyClone.Albuns (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
	album_name VARCHAR(50) NOT NULL,
	release_year YEAR NOT NULL,
	artist_id INT NOT NULL,

	FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE SpotifyClone.Songs (
	song_id INT PRIMARY KEY AUTO_INCREMENT,
	song_title VARCHAR(75) NOT NULL,
	song_time INT NOT NULL,
	album_id INT NOT NULL,

	FOREIGN KEY (album_id) REFERENCES Albuns(album_id)
);

CREATE TABLE SpotifyClone.Reprodution_history (
	user_id INT NOT NULL,
	song_id INT NOT NULL,
	reprodution_date DATETIME NOT NULL,

	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (song_id) REFERENCES Songs(song_id),

	CONSTRAINT PRIMARY KEY (user_id, song_id)
);

INSERT INTO SpotifyClone.Plan (plan_id, plan_name, plan_price) VALUES    
	('1', 'gratuito', '0.00'),
	('2', 'universitário', '5.99'),
	('3', 'familiar', '7.99'),
	('4', 'pessoal', '6.99');

INSERT INTO SpotifyClone.Artists (artist_id, artist_name) VALUES
	('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');

INSERT INTO SpotifyClone.User (user_id, user_name, user_age, signed_date, plan_id) VALUES
   ('1', 'Barbara Liskov', '82', '2019-01-01', '1'),
   ('2', 'Robert Cecil Martin', '58', '2019-01-01', '1'),
   ('3', 'Ada Lovelace', '37', '2019-01-01', '3'),
   ('4', 'Martin Fowler', '46', '2019-01-01', '3'),
   ('5', 'Sandi Metz', '58', '2018-04-29', '3'),
   ('6', 'Paulo Freire', '19', '2018-04-14', '2'),
   ('7', 'Bell Hooks', '26', '2018-01-14', '2'),
   ('8', 'Christopher Alexander', '85', '2019-06-05', '4'),
   ('9', 'Judith Butler', '45', '2020-05-13', '4'),
   ('10', 'Jorge Amado', '58', '2017-02-17', '4');

INSERT INTO SpotifyClone.Following (user_id, artist_id) VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '1'),
    ('2', '3'),
    ('3', '2'),
    ('4', '4'),
    ('5', '5'),
    ('5', '6'),
    ('6', '1'),
    ('6', '6'),
    ('7', '6'),
    ('9', '3'),
    ('10', '2');

INSERT INTO SpotifyClone.Albuns (album_id, album_name, release_year, artist_id) VALUES
    ('1', 'Renaissance', '2022', '1'),
    ('2', 'Jazz', '1978', '2'),
    ('3', 'Hot Space', '1982', '2'),
    ('4', 'Falso Brilhante', '1998', '3'),
    ('5', 'Vento de Maio', '2001', '3'),
    ('6', 'QVVJFA?', '2003', '4'),
    ('7', 'Somewhere Far Beyond', '2007', '5'),
    ('8', 'I Put A Spell On You', '2012', '6');

INSERT INTO SpotifyClone.Songs (song_id, song_title, song_time, album_id) VALUES
    ('1', 'BREAK MY SOUL', 279, '1'),
    ('2', 'Don`t Stop Me Now', 203, '2'),
    ('3', 'Under Pressure', 152, '3'),
    ('4', 'Como Nossos Pais', 105, '4'),
    ('5', 'O Medo de Amar é o Medo de Ser Livre', 207, '5'),
    ('6', 'Samba em Paris', 267 , '6'),
    ('7', 'The Bards Song', 244 , '7'),
    ('8', 'Feeling Good', 100 , '8'),
    ('9', 'VIRGOS GROOVE', 369, '1'),
    ('10', 'ALIEN SUPERSTAR', 116 , '1');

INSERT INTO SpotifyClone.Reprodution_history (user_id, song_id, reprodution_date) VALUES
    ('1', '6', '2022-02-28 10:45:55'),
    ('1', '9', '2020-05-02 05:30:35'),
    ('1', '8', '2020-03-06 11:22:33'),
    ('2', '8', '2022-08-05 08:05:17'),
    ('2', '5', '2020-01-02 07:40:33'),
    ('3', '8', '2020-11-13 16:55:13'),
    ('3', '9', '2020-12-05 18:38:30'),
    ('4', '6', '2021-08-15 17:10:10'),
    ('5', '6', '2022-01-09 01:44:33'),
    ('5', '3', '2020-08-06 15:23:43'),
    ('6', '5', '2017-01-24 00:31:17'),
    ('6', '1', '2017-10-12 12:35:20'),
    ('7', '2', '2011-12-15 22:30:49'),
    ('8', '2', '2012-03-17 14:56:41'),
    ('9', '7', '2022-02-24 21:14:22'),
    ('10', '10', '2015-12-13 08:30:22');