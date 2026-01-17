CREATE INDEX idx_person_name ON person(UPPER(name)); -- создадим индекс, имена в котором будут в верхнем регистре (в нем, но не в самой таблице персоны!)
SET ENABLE_SEQSCAN TO OFF; -- отключения последовательного сканирования строк
SELECT name FROM person
WHERE UPPER(name) = 'IRINA';
EXPLAIN ANALYZE -- вывод плана запроса
SELECT name FROM person
WHERE UPPER(name) = 'IRINA';
/*создадим сбалансированное дерево - индекс в таблице персоны,
индекс будет содержать имена но в верхнем регистре для оптимизации
поиска по именам игнорируя регистр*/