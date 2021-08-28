

SELECT genres.nombre ,COUNT (asociacion_genre_movie.*)FROM asociacion_genre_movie JOIN genres  on asociacion_genre_movie.id_genre = genres.id_genre group by genres.nombre;

SELECT nombre,k FROM (SELECT cr.nombre ,COUNT(c.*) AS k FROM crew_credits c JOIN crew cr ON c.id_crew =cr.id_crew  
GROUP BY c.id_crew ,cr.nombre)AS t 
WHERE k=(SELECT MAX(k) FROM (SELECT COUNT(*) AS k FROM crew_credits WHERE job = 'Actor'  GROUP BY id_crew) l);

SELECT titulo,k FROM (SELECT m.titulo ,COUNT(c.*) AS k FROM crew_credits c JOIN movies m ON c.id_movie = m.id_movie 
WHERE job = 'Actor' GROUP BY c.id_movie ,m.titulo)AS t WHERE k =(SELECT MAX(k) FROM 
(SELECT COUNT(*) AS k FROM crew_credits WHERE job = 'Actor' GROUP BY id_movie ) l);

SELECT nombre,k FROM (SELECT cr.nombre ,COUNT(c.*) AS k FROM crew_credits c JOIN crew cr ON c.id_crew =cr.id_crew  WHERE job = 'Director' 
GROUP BY c.id_crew ,cr.nombre)AS t WHERE k=(SELECT MAX(k) FROM (SELECT COUNT(*) AS k FROM crew_credits WHERE job = 'Director' GROUP BY id_crew ) l);

select m.titulo, cr.id_crew from crew cr join crew_credits cc ON cr.id_crew  = cc.id_crew join movies m on cc.id_movie = m.id_movie where cc.job = 'Director'
INTERSECT
select m.titulo, cr.id_crew from crew cr join crew_credits cc ON cr.id_crew  = cc.id_crew join movies m on cc.id_movie = m.id_movie where cc.job = 'Actor' limit 10;

SELECT titulo FROM movies WHERE votes = (SELECT MAX(calificacion) from movies)limit 1;


SELECT titulo FROM movies WHERE votes = (SELECT MAX(votes) from movies)limit 10;