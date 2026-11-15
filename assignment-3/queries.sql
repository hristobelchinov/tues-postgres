SELECT
    ps.position,
    s.title,
    a.name AS artist,
    s.duration
FROM playlist_songs AS ps
JOIN songs AS s
    ON ps.song_id = s.id
JOIN artists AS a
    ON s.artist_id = a.id
WHERE ps.playlist_id = 1
ORDER BY ps.position;



SELECT
    p.name AS playlist,
    COUNT(ps.song_id) AS song_count,
    COALESCE(SUM(s.duration), 0) AS total_duration
FROM playlists AS p
LEFT JOIN playlist_songs AS ps
    ON p.id = ps.playlist_id
LEFT JOIN songs AS s
    ON ps.song_id = s.id
GROUP BY p.id, p.name
ORDER BY p.id;