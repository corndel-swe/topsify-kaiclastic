-- List the names of the 10 newest albums in the database
SELECT name
from albums
ORDER BY release_date DESC
limit 10;