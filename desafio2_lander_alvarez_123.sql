CREATE TABLE IF NOT EXISTS inscritos(
  id SERIAL PRIMARY KEY, 
  quantity INT, date DATE, 
  source VARCHAR);

INSERT INTO inscritos(quantity, date, source)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO inscritos(quantity, date, source)
VALUES ( 99, '01/08/2021', 'Página' );



SELECT COUNT(*) AS total_registros FROM inscribed;

SELECT SUM(quantity) AS total_enrolled FROM inscribed;

SELECT * FROM inscribed WHERE date =(
SELECT MIN (date)
FROM inscribed
);

SELECT date, SUM(quantity) AS registered_per_day FROM inscribed
GROUP BY date
ORDER BY date ASC;

SELECT source, SUM(quantity) AS registered_per_source FROM inscribed
GROUP BY source
ORDER BY registered_per_source DESC;

SELECT date, SUM(quantity) AS registered_per_day FROM inscribed
GROUP BY date
ORDER BY registered_per_day DESC
LIMIT 1;

SELECT date, source,quantity FROM inscribed
WHERE quantity=(
SELECT MAX(quantity) FROM inscribed
WHERE source='Blog'
)
LIMIT 1;

SELECT AVG(result.registered_per_day) FROM (
SELECT date, SUM(quantity) AS registered_per_day FROM inscribed GROUP BY date ORDER BY date
) AS result;

SELECT date, SUM(quantity) AS inscritos_diarios FROM inscribed GROUP BY date HAVING (SUM(quantity)>50);

SELECT AVG(result.registered_per_day) FROM (
SELECT date, SUM(quantity) AS registered_per_day FROM inscribed
WHERE date>='2021-03-01' GROUP BY date
) AS result;










