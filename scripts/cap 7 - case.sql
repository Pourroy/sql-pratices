-- Utilizando CASE para criar uma nova coluna de intensidade de vento baseada nos valores de wind_speed
SELECT  report_code , year, month, day, wind_speed,
CASE 
	WHEN wind_speed >= 40 THEN 'HIGH'
	WHEN wind_speed >= 30 AND wind_speed < 40 THEN 'MODERATE'
	ELSE 'LOW'
END as wind_severity
FROM STATION_DATA

-- Utilizando CASE para criar uma nova coluna de intensidade de vento baseada nos valores de wind_speed
-- Omitindo o AND já que o compilador lê de 'baixo para cima', ele consegue entender o intervalo antes MODERATE e HIGH
-- Esta consulta é mais eficiente.
SELECT  report_code , year, month, day, wind_speed,
CASE 
	WHEN wind_speed >= 40 THEN 'HIGH'
	WHEN wind_speed >= 30 THEN 'MODERATE'
	ELSE 'LOW'
END as wind_severity
FROM STATION_DATA

-- Neste exemplo selecionando menos dados, contamos a quantidade de registros média ordenada por ano 
SELECT year,
CASE 
	WHEN wind_speed >= 40 THEN 'HIGH'
	WHEN wind_speed >= 30 THEN 'MODERATE'
	ELSE 'LOW'
END as wind_severity,

COUNT(*) record_count

FROM STATION_DATA
GROUP BY 1, 2

-- Usando 'Zero/null'
-- Este resultado retorna valores nulos e zeros para tornados sem precipitação
SELECT year, month,
SUM(precipitation) as tornado_precipitation
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month

-- Este resultado retorna valores nulos e zeros para precipitação sem tornados
SELECT year, month,
SUM(precipitation) as non_tornado_precipitation
FROM STATION_DATA
WHERE tornado = 0
GROUP BY year, month

-- Juntando as duas querys a cima em uma única passando a instrução when case dentro de sum 
-- eliminando valores null com ELSE 0
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) as tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) as non_tornado_precipitation
FROM STATION_DATA
GROUP BY year, month

-- Juntando as duas querys a cima em uma única passando a instrução when case dentro de max para conseguir os maiores valores
SELECT year, month,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) as max_tornado_precipitation,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) as max_non_tornado_precipitation
FROM STATION_DATA
GROUP BY year

-- Juntando as duas querys a cima em uma única passando a instrução when case dentro de avg para conseguir as médias 
SELECT month,
AVG(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END) as avg_tornado_precipitation,
AVG(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END) as avg_non_tornado_precipitation
FROM STATION_DATA
GROUP BY month



