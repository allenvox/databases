-- 1. Простой запрос на выборку
SELECT `ФИО`, `Факультет`, `Курс`
FROM `Студенты-К`;

-- 2. Подсчет количества студентов на факультетах
SELECT `Факультет`, COUNT(*) AS `Количество студентов`
FROM `Студенты-К`
GROUP BY `Факультет`;

-- 3. Повторяющиеся записи по размеру стипендии
SELECT `Размер стипендии`, COUNT(*) AS `Количество`
FROM `Студенты-К`
GROUP BY `Размер стипендии`
HAVING COUNT(*) > 1;

-- 4. Подсчет среднего балла на факультетах
SELECT `Факультет`, `Курс`, AVG(`Средний балл`) AS `Средний балл`
FROM `Студенты-К`
GROUP BY `Факультет`, `Курс`;

-- 5. Военнообязанные мужчины, получающие стипендию
SELECT `ФИО`, `Факультет`, `Размер стипендии`
FROM `Студенты-К`
WHERE `Пол` = 'М' AND `Военнообязан` = TRUE AND `Размер стипендии` > 0;

-- 6. Увеличение стипендии для военнообязанных на 10%
SET SQL_SAFE_UPDATES = 0;
UPDATE `Студенты-К`
SET `Размер стипендии` = `Размер стипендии` * 1.10
WHERE `Номер` IS NOT NULL AND `Военнообязан` = TRUE;
SET SQL_SAFE_UPDATES = 1;

-- 7. Студенты 2003-2004 гг.р.
CREATE TABLE `Студенты_2003_2004` AS
SELECT *
FROM `Студенты-К`
WHERE YEAR(`Дата рождения`) BETWEEN 2003 AND 2004;

-- 8. Удаление студентов младше 4 курса
SET SQL_SAFE_UPDATES = 0;
DELETE FROM `Студенты-К`
WHERE `Курс` < 4;
SET SQL_SAFE_UPDATES = 1;

-- 9. Параметр для выбора студентов с определенного факультета
SELECT `ФИО`, `Факультет`, `Курс`
FROM `Студенты-К`
WHERE `Факультет` = 'ИТ';

-- 10. Вычисление стипендиального фонда каждой группы
SELECT `Группа`, SUM(`Размер стипендии`) AS `Стипендиальный фонд`
FROM `Студенты-К`
GROUP BY `Группа`;

-- 11. Добавление вычисляемого поля с учетом районного коэф.
SELECT `ФИО`, `Факультет`, `Размер стипендии`, 
       (`Размер стипендии` * 1.2) AS `К выдаче`
FROM `Студенты-К`;