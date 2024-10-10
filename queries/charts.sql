-- Visiting /charts/1.html should show a bar chart showing the count of explicit tracks by each artist,
-- ordered by explicit track count. It should only show artists who have at least one explicit track.
--This chart expects the data to be available in reports/chart-1.json. The JSON should look like this:
-- [
--  {
--    "artist_name": "Taylor Swift",
--    "explicit_track_count": 999
--  }
--  // ... more artists
--]

.mode json
SELECT artists.name AS artist_name, COUNT(tracks.explicit) AS explicit_track_count
FROM artists
inner join albums on albums.artist_id = artists.id
inner join tracks on tracks.album_id = albums.id
WHERE tracks.explicit == 1
group by artists.id
ORDER BY explicit_track_count DESC;
