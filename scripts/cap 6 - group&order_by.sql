-- Contando total de registros da Tabela
SELECT COUNT(*) AS record_count FROM STATION_DATA;

-- Registro de contagem de uma coluna específica
SELECT COUNT(*) AS tornado_record FROM STATION_DATA
WHERE tornado = true;

-- Regristro 2 duas tabelas associas e agrupadas
SELECT "year", COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY "year";

-- Registros filtrando quantidade de tornados por mês a cada ano
SELECT "year","month",  COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY "year", "month" ;

-- Ordenando registros passando a ordem das tabelas de forma ordinal
SELECT "year","month",  COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY 1, 2;

-- Outra forma de fazer a mesma query de cima
SELECT "year","month",  COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY "year","month"
ORDER BY "year","month";

-- Ordenando de forma ascentende
SELECT "year","month",  COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY "year","month"
ORDER BY "year" ASC ,"month";

-- Ordenando de forma descendente
SELECT "year","month",  COUNT(*) AS tornado_by_year FROM STATION_DATA
WHERE tornado = 1
GROUP BY "year","month"
ORDER BY "year" DESC ,"month";

-- Filtrando informações de Inteiros usando AVG(avarage), mensal
SELECT "month", round(AVG(temperature), 1) as temp_media
FROM STATION_DATA
WHERE "year" >= 2000
GROUP BY "month";

-- Temperatura média anual
SELECT "year" , round(AVG(temperature), 1) as temp_media
FROM STATION_DATA
WHERE "year" >= 2000
GROUP BY "year" ;

-- Quantidade de neve por ano
SELECT "year" , SUM(snow_depth) as neve_total
FROM STATION_DATA
WHERE "year" >= 2000
GROUP BY "year" ;

-- Quantidade de chuva e neve por ano
SELECT "year",
SUM(snow_depth) as neve_total,
SUM(precipitation) as chuva_total,
MAX(precipitation) as maior_chuva
FROM STATION_DATA
WHERE "year" >= 2000
GROUP BY "year" ;

-- Selecionando a soma da tabela precipitation quando outra tabela for verdadeira
SELECT "year",
SUM(precipitation) As chuva_tornado
FROM STATION_DATA
WHERE tornado
GROUP BY "year";

-- TABELAS AGREDAS GERADOS COM SUM, MIN, MAX E AVG,não podem ser filtradas com WHERE, então podemos usar HAVING 
SELECT "year",
SUM(precipitation) As chuva_total
FROM STATION_DATA
GROUP BY "year"
HAVING chuva_total > 1;

-- Filtrando com Distintic
SELECT DISTINCT station_number FROM STATION_DATA


