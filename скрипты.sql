SELECT list_genre.title, COUNT(list_genre_performer.id_performer) FROM list_performer
JOIN list_genre_performer ON list_performer.id = list_genre_performer.id_performer
JOIN list_genre ON list_genre_performer.id_genre = list_genre.id
GROUP BY list_genre.id;

SELECT albums.year_release, COUNT(*) FROM list_tracks
JOIN albums ON list_tracks.id_album = albums.id
WHERE albums.year_release >= 2019 AND albums.year_release <= 2020
GROUP BY albums.year_release;


SELECT albums.name_album, AVG(duration) FROM list_tracks
JOIN albums ON list_tracks.id_album = albums.id
GROUP BY albums.name_album
ORDER BY albums.name_album;


SELECT DISTINCT list_performer.name FROM list_performer
JOIN list_performer_albums ON list_performer.id = list_performer_albums.id_performer
JOIN albums ON list_performer_albums.id_album = albums.id
WHERE albums.year_release <> 2020 AND list_performer.name NOT IN (
SELECT DISTINCT list_performer.name FROM list_performer
JOIN list_performer_albums ON list_performer.id = list_performer_albums.id_performer
JOIN albums ON list_performer_albums.id_album = albums.id
WHERE albums.year_release = 2020);


SELECT DISTINCT list_collections.name FROM list_collections
JOIN list_collections_tracks ON list_collections.id = list_collections_tracks.id_collection
JOIN list_tracks ON list_collections_tracks.id_track = list_tracks.id
JOIN albums ON list_tracks.id_album = albums.id
JOIN list_performer_albums ON albums.id = list_performer_albums.id_album
JOIN list_performer ON list_performer_albums.id_performer = list_performer.id
WHERE list_performer.name iLIKE 'шнУроВ'
ORDER BY list_collections.name;


SELECT albums.name_album FROM albums
JOIN list_performer_albums ON albums.id = list_performer_albums.id_album
JOIN list_performer ON list_performer_albums.id_performer = list_performer.id
JOIN list_genre_performer ON list_performer.id = list_genre_performer.id_performer
JOIN list_genre ON list_genre_performer.id_genre = list_genre.id
GROUP BY albums.name_album
HAVING COUNT(list_genre.id) > (
	SELECT COUNT(*) FROM list_performer
	JOIN list_genre_performer ON list_performer.id = list_genre_performer.id_performer
	JOIN list_genre ON list_genre_performer.id_genre = list_genre.id
	GROUP BY list_performer.name
	HAVING COUNT(*) <> 0 AND COUNT(*) <> 1);


SELECT list_tracks.name FROM list_collections as l
JOIN list_collections_tracks ON l.id = list_collections_tracks.id_collection
RIGHT JOIN list_tracks ON list_collections_tracks.id_track = list_tracks.id
WHERE l.id IS NULL;


SELECT list_performer.name FROM list_performer
JOIN list_performer_albums ON list_performer.id = list_performer_albums.id_performer
JOIN albums ON list_performer_albums.id_album = albums.id
JOIN list_tracks ON albums.id = list_tracks.id_album
GROUP BY list_performer.name
HAVING MIN(list_tracks.duration) = (
	SELECT MIN(list_tracks.duration) FROM list_tracks);



SELECT albums.name_album FROM albums
JOIN list_tracks ON albums.id = list_tracks.id_album
GROUP BY albums.name_album
HAVING COUNT(*) = (
	SELECT COUNT(*) FROM list_tracks
	JOIN albums ON list_tracks.id_album = albums.id
	GROUP BY albums.name_album
	ORDER BY COUNT(*)
	LIMIT 1);













