SET ENABLE_SEQSCAN TO ON; -- включаем более долгое и ресурсозатратное последовательное сканирование
EXPLAIN ANALYZE -- объясняем анализ
SELECT -- а это уже данный нам запрос, который посредством оконной функции получает максимальный рейтинг для каждой пиццы
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k -- это оконная функция для выяснения максимального рейтинга
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

DROP INDEX IF EXISTS inx_1; -- удаляем старый индекс, если он существует
CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria(rating); -- создаем новый индекс

SET ENABLE_SEQSCAN TO OFF; -- отключаем последовательной сканирование
EXPLAIN ANALYZE -- анализируем запрос дубль 2
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k -- определяем рамку окна, все строки от начала до конца партии, т.е. для каждоый строки рейтинг будет рассматриваться как максимум в этой партии
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;
/*улучшаем скорость и производительность запроса*/
