DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums (
  album_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE artists (
  artist_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers (
  producer_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs (
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums(album_id) ON DELETE SET NULL
);

CREATE TABLE song_artists (
  song_id INTEGER REFERENCES songs(song_id) ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists(artist_id) ON DELETE CASCADE,
  PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE song_producers (
  song_id INTEGER REFERENCES songs(song_id) ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers(producer_id) ON DELETE CASCADE,
  PRIMARY KEY (song_id, producer_id)
);

INSERT INTO albums 
  (title) 
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO artists 
  (name) 
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers 
  (name) 
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '1997-04-15', (SELECT album_id FROM albums WHERE title = 'Middle of Nowhere')),
  ('Bohemian Rhapsody', 355, '1975-10-31', (SELECT album_id FROM albums WHERE title = 'A Night at the Opera')),
  ('One Sweet Day', 282, '1995-11-14', (SELECT album_id FROM albums WHERE title = 'Daydream')),
  ('Shallow', 216, '2018-09-27', (SELECT album_id FROM albums WHERE title = 'A Star Is Born')),
  ('How You Remind Me', 223, '2001-08-21', (SELECT album_id FROM albums WHERE title = 'Silver Side Up')),
  ('New York State of Mind', 276, '2009-10-20', (SELECT album_id FROM albums WHERE title = 'The Blueprint 3')),
  ('Dark Horse', 215, '2013-12-17', (SELECT album_id FROM albums WHERE title = 'Prism')),
  ('Moves Like Jagger', 201, '2011-06-21', (SELECT album_id FROM albums WHERE title = 'Hands All Over')),
  ('Complicated', 244, '2002-05-14', (SELECT album_id FROM albums WHERE title = 'Let Go')),
  ('Say My Name', 240, '1999-11-07', (SELECT album_id FROM albums WHERE title = 'The Writing''s on the Wall'));

INSERT INTO song_artists 
  (song_id, artist_id)
VALUES 
  ((SELECT song_id FROM songs WHERE title = 'MMMBop'), (SELECT artist_id FROM artists WHERE name = 'Hanson')),
  ((SELECT song_id FROM songs WHERE title = 'Bohemian Rhapsody'), (SELECT artist_id FROM artists WHERE name = 'Queen')),
  ((SELECT song_id FROM songs WHERE title = 'One Sweet Day'), (SELECT artist_id FROM artists WHERE name = 'Mariah Carey')),
  ((SELECT song_id FROM songs WHERE title = 'One Sweet Day'), (SELECT artist_id FROM artists WHERE name = 'Boyz II Men')),
  ((SELECT song_id FROM songs WHERE title = 'Shallow'), (SELECT artist_id FROM artists WHERE name = 'Lady Gaga')),
  ((SELECT song_id FROM songs WHERE title = 'Shallow'), (SELECT artist_id FROM artists WHERE name = 'Bradley Cooper')),
  ((SELECT song_id FROM songs WHERE title = 'How You Remind Me'), (SELECT artist_id FROM artists WHERE name = 'Nickelback')),
  ((SELECT song_id FROM songs WHERE title = 'New York State of Mind'), (SELECT artist_id FROM artists WHERE name = 'Jay Z')),
  ((SELECT song_id FROM songs WHERE title = 'New York State of Mind'), (SELECT artist_id FROM artists WHERE name = 'Alicia Keys')),
  ((SELECT song_id FROM songs WHERE title = 'Dark Horse'), (SELECT artist_id FROM artists WHERE name = 'Katy Perry')),
  ((SELECT song_id FROM songs WHERE title = 'Dark Horse'), (SELECT artist_id FROM artists WHERE name = 'Juicy J')),
  ((SELECT song_id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT artist_id FROM artists WHERE name = 'Maroon 5')),
  ((SELECT song_id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT artist_id FROM artists WHERE name = 'Christina Aguilera')),
  ((SELECT song_id FROM songs WHERE title = 'Complicated'), (SELECT artist_id FROM artists WHERE name = 'Avril Lavigne')),
  ((SELECT song_id FROM songs WHERE title = 'Say My Name'), (SELECT artist_id FROM artists WHERE name = 'Destiny''s Child'));

INSERT INTO song_producers 
  (song_id, producer_id) 
VALUES
  ((SELECT song_id FROM songs WHERE title = 'MMMBop'), (SELECT producer_id FROM producers WHERE name = 'Dust Brothers')),
  ((SELECT song_id FROM songs WHERE title = 'MMMBop'), (SELECT producer_id FROM producers WHERE name = 'Stephen Lironi')),
  ((SELECT song_id FROM songs WHERE title = 'Bohemian Rhapsody'), (SELECT producer_id FROM producers WHERE name = 'Roy Thomas Baker')),
  ((SELECT song_id FROM songs WHERE title = 'One Sweet Day'), (SELECT producer_id FROM producers WHERE name = 'Walter Afanasieff')),
  ((SELECT song_id FROM songs WHERE title = 'Shallow'), (SELECT producer_id FROM producers WHERE name = 'Benjamin Rice')),
  ((SELECT song_id FROM songs WHERE title = 'How You Remind Me'), (SELECT producer_id FROM producers WHERE name = 'Rick Parashar')),
  ((SELECT song_id FROM songs WHERE title = 'New York State of Mind'), (SELECT producer_id FROM producers WHERE name = 'Al Shux')),
  ((SELECT song_id FROM songs WHERE title = 'Dark Horse'), (SELECT producer_id FROM producers WHERE name = 'Max Martin')),
  ((SELECT song_id FROM songs WHERE title = 'Dark Horse'), (SELECT producer_id FROM producers WHERE name = 'Cirkut')),
  ((SELECT song_id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT producer_id FROM producers WHERE name = 'Shellback')),
  ((SELECT song_id FROM songs WHERE title = 'Moves Like Jagger'), (SELECT producer_id FROM producers WHERE name = 'Benny Blanco')),
  ((SELECT song_id FROM songs WHERE title = 'Complicated'), (SELECT producer_id FROM producers WHERE name = 'The Matrix')),
  ((SELECT song_id FROM songs WHERE title = 'Say My Name'), (SELECT producer_id FROM producers WHERE name = 'Darkchild'));
