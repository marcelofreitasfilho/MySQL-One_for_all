SELECT
  a.artist_name as artista,
  alb.album_name as album
FROM SpotifyClone.Artists a
INNER JOIN SpotifyClone.Albuns alb
  ON a.artist_id = alb.artist_id
WHERE a.artist_name = 'Elis Regina';