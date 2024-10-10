--Chart 3: Loudness over time
--Are albums getting louder?
--
--Write a query which generates reports/chart-3.json containing entries of the form:
--
--[
--  {
--    "album_name": "Album 1",
--    "average_loudness": -5.0,
--    "release_date": "2010-01-01"
--  },
--  {
--    "album_name": "Album 2",
--    "average_loudness": -4.5,
--    "release_date": "2011-01-01"
--  }
--  // ... more albums
--]


.mode json
SELECT albums.name as album_name, albums.release_date as release_date,
AVG(features.loudness) AS average_loudness
FROM features
inner join tracks on tracks.id= features.track_id
inner join albums on albums.id = tracks.album_id
group by albums.id
ORDER BY release_date;