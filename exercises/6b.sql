-- Create a list of all album names
-- Include the total duration of the album
-- Sort the results by album duration, with the longest first

SELECT albums.name, SUM(tracks.duration_ms) AS total_duration
FROM albums
INNER JOIN tracks ON tracks.album_id = albums.id
GROUP BY tracks.album_id
ORDER BY total_duration DESC



