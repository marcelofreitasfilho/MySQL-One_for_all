SELECT
  u.user_name as pessoa_usuaria,
  IF(MAX(YEAR(rh.reprodution_date)) >= 2021, "Ativa", "Inativa") as status_pessoa_usuaria
FROM SpotifyClone.User u
INNER JOIN SpotifyClone.Reprodution_history rh ON u.user_id = rh.user_id
GROUP BY u.user_id
ORDER BY u.user_name;
