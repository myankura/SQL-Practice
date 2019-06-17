--1 Using the Object Explorer in Azure Data Studio, examine the tables, columns, and foreign keys of the database.
SELECT * FROM Album;
SELECT * FROM Artist;
SELECT * FROM Genre;
SELECT * FROM Song;

--2 Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Queens of the Stone Age', 1996);

--3 Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Lullabies to Paralyze', '03/21/2005', 3566, 'Interscope', 28, 2);

--4 Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Skin on Skin', 222, '03/21/2005', 2, 28, 23);

--5 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the
--  LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title AS 'Song Title', 
a.Title AS 'Album Title', 
ar.ArtistName AS 'Artist'
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
JOIN Artist ar On s.ArtistId = ar.Id; 

--6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title,
COUNT(s.Title) AS '# of songs on album'
FROM Album a
JOIN Song s ON s.AlbumId = a.Id
GROUP BY a.Title;

--7 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, 
COUNT(s.Title) AS '# of songs by artist'
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
GROUP BY a.ArtistName;

--8 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, 
COUNT(s.Title)
FROM Genre g
JOIN Song s ON s.GenreId = g.Id
GROUP BY g.Label;

--9 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, 
AlbumLength AS 'Album length'
FROM Album 
WHERE (SELECT MAX(AlbumLength) 
FROM Album) = AlbumLength;

SELECT TOP 1 AlbumLength,
Title
FROM Album
ORDER BY AlbumLength DESC;

--10 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title,
SongLength
FROM Song
WHERE (SELECT MAX(SongLength) 
FROM Song) = SongLength;

--11 Modify the previous query to also display the title of the album.
SELECT s.Title,
s.SongLength,
a.Title AS 'Album Title'
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
WHERE (SELECT MAX(SongLength) 
FROM Song) = SongLength;


UPDATE Song
SET ReleaseDate = '03/21/2005'
WHERE Id = 22;

SELECT *
FROM Song;

DELETE 
FROM Song
WHERE Id = 23;