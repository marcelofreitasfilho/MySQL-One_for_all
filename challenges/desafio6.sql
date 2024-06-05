SELECT
  MIN(p.plan_price) as faturamento_minimo,
  MAX(p.plan_price) as faturamento_maximo,
  ROUND (AVG(p.plan_price), 2) as faturamento_medio,
  SUM(p.plan_price) as faturamento_total
FROM SpotifyClone.User u
INNER JOIN SpotifyClone.Plan p 
    ON u.plan_id = p.plan_id;