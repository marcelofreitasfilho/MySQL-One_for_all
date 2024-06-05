SELECT
  a.artist_name as artista,
  alb.album_name as album,
  COUNT(f.user_id) as pessoas_seguidoras
FROM SpotifyClone.Artists a
INNER JOIN SpotifyClone.Albuns alb
  ON a.artist_id = alb.artist_id
INNER JOIN SpotifyClone.Following f
  ON alb.artist_id = f.artist_id
GROUP BY alb.album_id
ORDER BY pessoas_seguidoras DESC, 
  a.artist_name ASC,
  alb.album_name ASC;