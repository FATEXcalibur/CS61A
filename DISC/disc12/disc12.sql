CREATE TABLE pizzas AS
  SELECT "Artichoke" AS name, 12 AS open, 15 AS close UNION
  SELECT "La Val's"         , 11        , 22          UNION
  SELECT "Sliver"           , 11        , 20          UNION
  SELECT "Cheeseboard"      , 16        , 23          UNION
  SELECT "Emilia's"         , 13        , 18;

CREATE TABLE meals AS
  SELECT "breakfast" AS meal, 11 AS time UNION
  SELECT "lunch"            , 13         UNION
  SELECT "dinner"           , 19         UNION
  SELECT "snack"            , 22;

CREATE TABLE opening AS
  SELECT name from pizzas where open < 13 order by name DESC;

CREATE TABLE study AS
  SELECT name, MAX(14 - open, 0) as duration from pizzas order by -MAX(14 - open, 0);

CREATE TABLE late AS
  SELECT name || " closes at " || close AS status
    FROM pizzas, meals WHERE meal = "snack" and close >= time;

CREATE TABLE double AS
  SELECT a.meal AS first, b.meal AS second, name
    FROM meals as a, meals as b, pizzas
    WHERE b.time - a.time > 6 and a.time >= open and b.time <= close;
