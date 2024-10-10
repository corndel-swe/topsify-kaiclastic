--Visiting /charts/2.html should show a radar chart for each album summarising its average characteristics. The axes of the radar chart are
--
--danceability
--energy
--speechiness
--acousticness
--liveness
--Generate a JSON report that looks like this:
--
--[
--  {
--    "artist_name": "Deftones",
--    "album_name": "White Pony",
--    "average_danceability": 0.5,
--    "average_energy": 0.5,
--    "average_speechiness": 0.5,
--    "average_acousticness": 0.5,
--    "average_liveness": 0.5
--  }
--  // ... more albums
--]

.mode json
SELECT artists.name AS artist_name, albums.name as album_name,
AVG(features.danceability) AS average_danceability,
AVG(features.energy) AS average_energy,
AVG(features.speechiness) AS average_speechiness,
AVG(features.acousticness) AS average_acousticness,
AVG(features.liveness) AS average_liveness
FROM features
inner join tracks on tracks.id= features.track_id
inner join albums on albums.id = tracks.album_id
inner join artists on artists.id = albums.artist_id
group by albums.id;
