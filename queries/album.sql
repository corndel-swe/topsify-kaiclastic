.mode json
SELECT * ,artists.name as artistName
from albums
Inner join artists on artists.id = albums.artist_id
ORDER BY artistName;

