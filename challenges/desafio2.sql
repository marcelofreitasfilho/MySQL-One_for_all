SELECT 
  (SELECT COUNT(song_id) FROM SpotifyClone.Songs) as cancoes,
  (SELECT COUNT(artist_id) FROM SpotifyClone.Artists) as artistas,
  (SELECT COUNT(album_id) FROM SpotifyClone.Albuns) as albuns;