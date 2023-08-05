/*Desafío guiado S2.*/

/*● La canción que es el track número 4, del primer artista que aparece en la querie que
indica los artistas de nacionalidad estadounidense que nacieron después de 1992*/

SELECT titulo_cancion
FROM cancion
WHERE numero_del_track = 4 
AND artista =( SELECT nombre_artista
  			   FROM artista
  			   WHERE DATE_PART('year', fecha_de_nacimiento) > 1992 AND nacionalidad = 'Estadounidense'
  			   LIMIT 1);