CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET ENABLE_SEQSCAN TO OFF;
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'pepperoni pizza';
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'pepperoni pizza';
/*создадим уникальный индекс в таблице меню, чтобы
обеспечить уникальность комбинаций значений в указанных столбцах,
т.е. каждая комбинация ид пиццерии и названия пиццы будет
уникальной, и не будет двух строк с одинаковыми значениями
ид пиццерии и названием пиццы*/
-- Index Cond условия, которые применяются при использовании индекса
-- для выполнения запроса
