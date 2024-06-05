SELECT
  COUNT(rh.song_id) as musicas_no_historico
FROM SpotifyClone.Reprodution_history rh
INNER JOIN SpotifyClone.User u
    ON rh.user_id = u.user_id
    WHERE u.user_name = "Barbara Liskov";
    