.mode column
.headers off

DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS agents;

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT,
  agent_id INTEGER
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_name TEXT,
  release_year INTEGER,
  MPAA_rating TEXT,
  studio_id INTEGER
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  role_name TEXT,
  billing_order INTEGER,
  actor_id INTEGER,
  movie_id INTEGER
);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT
);

CREATE TABLE agents (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  agent_name TEXT
);

INSERT INTO studios (
    studio_name
) VALUES (
    "Warner Bros."
);

INSERT INTO agents (
    agent_name
) VALUES (
    "Daniel Cutright"
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Christian Bale",
    1
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Michael Caine",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Liam Neeson",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Katie Holmes",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Gary Oldman",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Heath Ledger",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Aaron Eckhart",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Maggie Gyllenhaal",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Tom Hardy",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Joseph Gordon-Levitt",
    NULL
);

INSERT INTO actors (
    actor_name,
    agent_id
) VALUES (
    "Anne Hathaway",
    NULL
);

INSERT INTO movies (
    movie_name,
    release_year,
    MPAA_rating,
    studio_id
) VALUES (
    "Batman Begins",
    2005,
    "PG-13",
    1
);

INSERT INTO movies (
    movie_name,
    release_year,
    MPAA_rating,
    studio_id
) VALUES (
    "The Dark Knight",
    2008,
    "PG-13",
    1
);

INSERT INTO movies (
    movie_name,
    release_year,
    MPAA_rating,
    studio_id
) VALUES (
    "The Dark Knight Rises",
    2012,
    "PG-13",
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Bruce Wayne",
    1,
    1,
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Alfred",
    2,
    2,
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Ra's Al Ghul",
    3,
    3,
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Rachel Dawes",
    4,
    4,
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Commissioner Gordon",
    5,
    5,
    1
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Bruce Wayne",
    1,
    1,
    2
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Joker",
    2,
    6,
    2
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Harvey Dent",
    3,
    7,
    2
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Alfred",
    4,
    2,
    2
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Rachel Dawes",
    5,
    8,
    2
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Bruce Wayne",
    1,
    1,
    3
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Commissioner Gordon",
    2,
    5,
    3
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Bane",
    3,
    9,
    3
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "John Blake",
    4,
    10,
    3
);

INSERT INTO roles (
    role_name,
    billing_order,
    actor_id,
    movie_id
) VALUES (
    "Selina Kyle",
    5,
    11,
    3
);

.print "Movies"
.print "======"
.print ""

SELECT movie_name, release_year, MPAA_rating, studios.studio_name
FROM movies
    INNER JOIN studios ON studios.id = movies.studio_id
ORDER BY release_year;

.print ""
.print "Top Cast"
.print "========"
.print ""

SELECT movies.movie_name, actors.actor_name, roles.role_name
FROM roles
    INNER JOIN movies ON movies.id = roles.movie_id
    INNER JOIN actors ON actors.id = roles.actor_id
ORDER BY movies.release_year, roles.billing_order;

.print ""
.print "Represented by agent"
.print "===================="
.print ""

SELECT actors.actor_name
FROM actors
    INNER JOIN agents ON agents.id = actors.agent_id
WHERE agents.agent_name = "Daniel Cutright"
ORDER BY actors.actor_name;