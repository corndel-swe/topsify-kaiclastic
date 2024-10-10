-- Retrieve a list of the "id" and "name" of all explicit tracks in the
-- database
SELECT id, name
from tracks
WHERE explicit = 1