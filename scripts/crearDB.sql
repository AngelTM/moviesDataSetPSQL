create database peliculas;
\c peliculas;
create table movies(
	id_movie int PRIMARY KEY,
	titulo char(40)
);

create table genres(
	id_genre int PRIMARY KEY,
	nombre char(40)
);

create table asociacion_genre_movie(
	id_movie int,
	id_genre int,
	CONSTRAINT fk_movie
        FOREIGN KEY(id_movie) 
			REFERENCES movies(id_movie),
	CONSTRAINT fk_genre
        FOREIGN KEY(id_genre) 
			REFERENCES genres(id_genre)
);

create table ratings(
	id_movie int,
	rating real,
	CONSTRAINT fk_movie
		FOREIGN KEY(id_movie) 
			REFERENCES movies(id_movie)
);

create table crew(
	id_crew int PRIMARY KEY,
	nombre char(40)
);

create table crew_credits(
	id_crew int,
	id_movie int,
	job char(40),
	CONSTRAINT fk_crew
		FOREIGN KEY(id_crew) 
			REFERENCES crew(id_crew),
	CONSTRAINT fk_movie
		FOREIGN KEY(id_movie) 
			REFERENCES movies(id_movie)
);



