-- How many tracks are longer than 5 minutes?

SELECT COUNT(*)
FROM tracks
WHERE duration_ms / 60000 > 5;
