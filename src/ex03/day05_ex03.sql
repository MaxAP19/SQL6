CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date); -- создаем многоколонный индекс
SET ENABLE_SEQSCAN TO OFF; -- отключаем последовательное сканирование строк
SELECT person_id, menu_id, order_date -- делам запрос по указанным данным
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
EXPLAIN ANALYZE -- проверяем, что работает
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
/*оптимизируем наш запрос с помощью многоколонного индекса*/
-- предложение использовать ид пиццы 19 - некорректно!
-- т.к. эта пицца уже была нами ранее создана и удалена
-- в ходе выполнения задания Day03 (а для персоны 8 есть пиццы с ид 8 и 14)
-- Heap fetches - сколько раз запрос извлекает строки из таблицы используя индексы
-- DROP INDEX idx_person_order_multi


