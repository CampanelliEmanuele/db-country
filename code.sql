-- QUERY BASE

-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq

SELECT *
FROM countries c 
WHERE c.name LIKE 'P%' AND c.area > 1000;

-- 2. Contare quante nazioni sono presenti nel database

SELECT count(*)
FROM countries c;

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico

SELECT r.name 
FROM regions r 
JOIN continents c ON c.continent_id = r.continent_id 
WHERE c.name = 'Europe'
ORDER BY name;

-- 4. Contare quante regioni sono presenti nel continente Africa

SELECT count(*)
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



-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010



-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa



-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946



-- BONUS BONUS

-- 11. Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente



-- 12. Contare quante lingue sono parlate in Italia



-- 13. Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni


