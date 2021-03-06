-- In this assignment, you'll be building the domain model, database
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the
-- top-billed cast for each movie in the database.
-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!
-- Rubric
--
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)
-- Submission
--
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the
--   Homework 1 assignment in Canvas
-- Successful sample output is as shown:
-- Movies
-- ======
-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan
-- Top Cast
-- ========
-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle
-- Turns column mode on but headers off
.mode column
.headers off
-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO! DROP TABLE
 
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Top_Cast;
DROP TABLE IF EXISTS Directors;
 
-- Create new tables, according to your domain model
-- TODO!
 
CREATE TABLE Movies (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
year_released INTEGER,
mpaa_rating TEXT
);
 
CREATE TABLE Top_Cast (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  character TEXT,
  movies_id INTEGER
);
 
CREATE TABLE Directors (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
movies_id INTEGER
);
 
-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
 
INSERT INTO Movies (
 title,
 year_released,
 mpaa_rating
) VALUES (
 "Batman Begins",
 2005,
 "PG-13"
);
 
INSERT INTO Movies (
 title,
 year_released,
 mpaa_rating
) VALUES (
 "The Dark Knight",
 2008,
 "PG-13"
);
 
INSERT INTO Movies (
 title,
 year_released,
 mpaa_rating
) VALUES (
 "The Dark Knight Rises",
 2012,
 "PG-13"
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Christian Bale",
 "Bruce Wayne",
 1
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Michael Caine",
 "Alfred",
 1
);
 
INSERT INTO Top_Cast (
 name, 
 character,
 movies_id
) VALUES (
 "Liam Neeson",
 "Ra's Al Ghul",
 1
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Katie Holmes",
 "Rachel Dawes",
 1
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Gary Oldman",
 "Commissioner Gordon",
 1
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Christian Bale",
 "Bruce Wayne",
 2
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Heath Ledger",
 "Joker",
 2
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Aaron Eckhart",
 "Harvey Dent",
 2
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Michael Caine",
 "Alfred",
 2
);
 
INSERT INTO Top_Cast (
 name, 
 character,
 movies_id
) VALUES (
 "Maggie Gyllenhaal",
 "Rachel Dawes",
 2
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Christian Bale",
 "Bruce Wayne",
 3
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Gary Oldman",
 "Commissioner Gordon",
 3
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Tom Hardy",
 "Bane",
 3
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Joseph Gordon-Levitt",
 "John Blake",
 3
);
 
INSERT INTO Top_Cast (
 name,
 character,
 movies_id
) VALUES (
 "Anne Hathaway",
 "Selina Kyle",
 3
);
 
INSERT INTO Directors (
  name,
  movies_id
) VALUES (
 "Christopher Nolan",
 1
);
 
INSERT INTO Directors (
  name,
  movies_id
) VALUES (
 "Christopher Nolan",
 2
);
 
INSERT INTO Directors (
  name,
  movies_id
) VALUES (
 "Christopher Nolan",
 3
);
 
-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""
 
-- The SQL statement for the movies output
-- TODO!

.width 21 4 5 20
 
SELECT Movies.title, Movies.year_released, Movies.mpaa_rating, Directors.name
FROM Movies INNER JOIN Directors ON Movies.id = Directors.movies_id;
 
-- Prints a header for the Top_Cast output
.print ""
.print "Top Cast"
.print "========"
.print ""
 
-- The SQL statement for the Top_Cast output
-- TODO!
 
.width 21 20 20

SELECT Movies.title, Top_Cast.name, Top_Cast.character
FROM Movies INNER JOIN Top_Cast ON Movies.id = Top_Cast.movies_id;
