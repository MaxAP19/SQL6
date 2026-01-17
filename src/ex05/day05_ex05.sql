CREATE UNIQUE INDEX idx_person_order_order_date -- создаем частично уникальный индекс
ON person_order(person_id, menu_id)
WHERE order_date = '2022-01-01';
SET ENABLE_SEQSCAN TO OFF;
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01';
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01'; 
/*создадим частично уникальный индекс на таблице заказы_персон
он будет уникален только для строк где значение дата заказа = указанной дате
уникальными будут комбинации значений ид персоны и ид меню для 01.01.2022,
но для других дат может быть больше одной строки с одинаковыми
персон ид и ид меню*/