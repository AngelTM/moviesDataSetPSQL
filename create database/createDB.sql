create database moviedatabase;
\c moviedatabase;
create table movies(
	id_movie int PRIMARY KEY,
	titulo char(200),
	calificacion real,
	votes real
	

);

create table genres(
	id_genre int PRIMARY KEY,
	nombre char(60)
);

create table asociacion_genre_movie(
	id_genre int,
	id_movie int,
	CONSTRAINT fk_movie
        FOREIGN KEY(id_movie) 
			REFERENCES movies(id_movie),
	CONSTRAINT fk_genre
        FOREIGN KEY(id_genre) 
			REFERENCES genres(id_genre)
);


create table crew(
	id_crew int PRIMARY KEY,
	nombre char(60)
);

create table crew_credits(
	id_crew int,
	id_movie int,
	job char(60),
	CONSTRAINT fk_crew
		FOREIGN KEY(id_crew) 
			REFERENCES crew(id_crew),
	CONSTRAINT fk_movie
		FOREIGN KEY(id_movie) 
			REFERENCES movies(id_movie)
);






