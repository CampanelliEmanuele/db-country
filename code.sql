-- BASE QUERIES

-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq

SELECT *
FROM countries c 
WHERE c.name LIKE 'P%' AND c.area > 1000;

-- 2. Contare quante nazioni sono presenti nel database

SELECT count(*) AS number_of_nations
FROM countries c;

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico

SELECT r.name AS european_regions
FROM regions r 
JOIN continents c ON c.continent_id = r.continent_id 
WHERE c.name = 'Europe'
ORDER BY r.name;

-- 4. Contare quante regioni sono presenti nel continente Africa

SELECT count(*) AS african_regions
FROM regions r 
JOIN continents c ON c.continent_id = r.continent_id 
WHERE c.name = 'Africa';

-- 5. Selezionare quali nazioni non hanno un national day

SELECT *
FROM countries c 
WHERE national_day IS NULL;

-- 6. Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente

SELECT c.name, r.name, c2.name 
FROM countries c
JOIN regions r ON r.region_id = c.region_id 
JOIN continents c2 ON c2.continent_id = r.continent_id 
ORDER BY c.name, r.name, c2.name;

-- 7. Selezionare le lingue ufficiali dell’Albania

SELECT l.`language` AS official_albanian_languages
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE c.name = 'Albania' AND cl.official = 1;

-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010

SELECT avg(cs.gdp) AS average_uk_gdp
FROM country_stats cs 
JOIN countries c ON c.country_id = cs.country_id 
WHERE c.name = 'United Kingdom' AND cs.`year` >= 2000 AND cs.`year` <= 2010;

-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa

SELECT *
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE l.`language` = 'Hindi'
ORDER BY c.area DESC

-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946

UPDATE countries c
SET c.national_day = '1946-06-02'
WHERE c.name = "Italy";

SELECT *
FROM countries c 
WHERE c.name = 'Italy'

-- BONUS QUERIES

-- 11. Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente

SELECT *
FROM countries c 
WHERE YEAR(c.national_day) < 1900
ORDER BY c.national_day DESC;

-- 12. Contare quante lingue sono parlate in Italia

SELECT count(*) AS languages_spoken_in_italy
FROM countries c 
JOIN country_languages cl ON cl.country_id = c.country_id 
JOIN languages l ON l.language_id = cl.language_id 
WHERE c.name = 'Italy'

-- 13. Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni

SELECT sum(c.area) AS total_area, avg(c.area) AS average_nations_area
FROM regions r 
JOIN countries c ON c.region_id = r.region_id 
WHERE r.name = 'Antarctica'
