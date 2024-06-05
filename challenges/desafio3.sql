SELECT 
  u.user_name as pessoa_usuaria,
  COUNT(rh.song_id) as musicas_ouvidas,
  ROUND(SUM(s.song_time)/60, 2) as total_minutos
FROM SpotifyClone.User u
INNER JOIN SpotifyClone.Reprodution_history rh
  ON u.user_id = rh.user_id
INNER JOIN SpotifyClone.Songs s
  ON rh.song_id = s.song_id
GROUP BY rh.user_id
ORDER BY u.user_name;
 