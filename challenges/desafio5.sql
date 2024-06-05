SELECT
  s.song_title as cancao,
  COUNT(rh.song_id) as reproducoes
FROM SpotifyClone.Songs s
INNER JOIN SpotifyClone.Reprodution_history rh
  ON s.song_id = rh.song_id
GROUP BY s.song_id
ORDER BY COUNT(rh.song_id) DESC, 
  s.song_title ASC
LIMIT 2;