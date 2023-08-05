/* Requerimiento 1*/
--CREATE DATABASE top_spotify_2018

CREATE TABLE artista(
	nombre_artista VARCHAR(25) NOT NULL,
	fecha_de_nacimiento DATE NOT NULL,
	nacionalidad VARCHAR(25)NOT NULL
);

CREATE TABLE cancion(
	titulo_cancion VARCHAR(25) NOT NULL,
	artista VARCHAR(25) NOT NULL,
	album VARCHAR(20)NOT NULL,
	numero_del_track INT NOT NULL
);

CREATE TABLE album(
	titulo_album VARCHAR(25) NOT NULL,
	artista VARCHAR(25) NOT NULL,
	anio INT
);

/*Requerimiento 2*/
COPY artista(nombre_artista, fecha_de_nacimiento, nacionalidad)
FROM 'D:/OneDrive/Curso Data Science/g56/04_SQL/S1/Artista.csv' DELIMITER ',' CSV HEADER ENCODING 'LATIN1';

COPY cancion(titulo_cancion, artista, album, numero_del_track)
FROM 'D:/OneDrive/Curso Data Science/g56/04_SQL/S1/Cancion.csv' DELIMITER ',' CSV HEADER;

COPY album(titulo_album, artista, anio)
FROM 'D:/OneDrive/Curso Data Science/g56/04_SQL/S1/Album.csv' DELIMITER ',' CSV HEADER;

/*Canciones que salieron el año 2018*/
SELECT cancion.titulo_cancion, album.anio
FROM cancion
INNER JOIN album ON cancion.album = album.titulo_album
WHERE album.anio = 2018;

/*Albums y la nacionalidad de su artista.*/
SELECT album.titulo_album ,album.artista, artista.nacionalidad
FROM album
JOIN artista ON album.artista = artista.nombre_artista ORDER BY artista;

/*Número de track, canción, album, año de lanzamiento y artista donde las canciones deberán 
estar ordenadas por año de lanzamiento del álbum, álbum y artista correspondiente.*/
SELECT cancion.numero_del_track, cancion.titulo_cancion, album.titulo_album, album.anio, artista.nombre_artista
FROM cancion
JOIN album ON cancion.album = album.titulo_album AND cancion.artista = album.artista
JOIN artista ON cancion.artista = artista.nombre_artista
ORDER BY album.anio, album.titulo_album, artista.nombre_artista;


