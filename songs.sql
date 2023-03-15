SELECT name FROM songs;
SELECT name FROM songs ORDER BY tempo;
SELECT name FROM songs ORDER BY duration_ms DESC LIMIT 5;
SELECT name FROM songs WHERE songs.danceability > '0.75' AND songs.energy > '0.75' AND songs.valence > '0.75';
SELECT AVG(energy) FROM songs;
SELECT songs.name FROM songs JOIN artists ON songs.artist_id = artists.id WHERE artists.name = 'Post Malone';
SELECT AVG(energy) FROM songs JOIN artists ON songs.artist_id = artists.id WHERE artists.name = 'Drake';
SELECT songs.name FROM songs WHERE songs.name LIKE '%feat%';
