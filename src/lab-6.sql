# 5. Список неповторяющихся значений кода должности (JOB_ID)
SELECT DISTINCT JOB_ID
FROM HR.EMPLOYEES;

# 14. Список сотрудников для категории клерков (JOB_ID содержит подстроку 'CLERK') с зарплатой в диапазоне [2500, 3000]
SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE '%CLERK%' 
  AND SALARY BETWEEN 2500 AND 3000;

# 16. Список сотрудников с зарплатой не ниже 10000, с сортировкой по коду подразделения и фамилии
SELECT DEPARTMENT_ID, LAST_NAME, FIRST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE SALARY >= 10000
ORDER BY DEPARTMENT_ID, LAST_NAME;

# 24. Данные по сотрудникам департамента 30 с зарплатой <= 5000 и без комиссионной надбавки (COMMISSION_PCT)
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 30 
  AND COMMISSION_PCT IS NULL 
  AND SALARY <= 5000;

# 30. Список сотрудников, у которых имя и фамилия начинаются с буквы 'S'
SELECT FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 1, 1) = 'S' 
  AND SUBSTR(LAST_NAME, 1, 1) = 'S';

# 31. Рассчитать зарплату сотрудников после её повышения на 20%
SELECT FIRST_NAME, LAST_NAME, SALARY, 
       SALARY * 1.20 AS NEW_SALARY
FROM HR.EMPLOYEES;

# 35. Разница между максимальной и минимальной зарплатой для каждой должности, сортировка по возрастанию разницы
SELECT JOB_ID, MAX(SALARY) - MIN(SALARY) AS SALARY_DIFFERENCE
FROM HR.EMPLOYEES
GROUP BY JOB_ID
ORDER BY SALARY_DIFFERENCE ASC;

# 38. Список должностей, у которых максимальная зарплата находится в диапазоне от 10000 до 20000
SELECT JOB_ID, MAX_SALARY
FROM HR.JOBS
WHERE MAX_SALARY BETWEEN 10000 AND 20000;

# 39. Список должностей с зарплатой, отсортированный по названию должности
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM HR.JOBS
ORDER BY JOB_TITLE ASC;

# 40. Список должностей с минимальной зарплатой выше 8000
SELECT JOB_ID, JOB_TITLE, MIN_SALARY
FROM HR.JOBS
WHERE MIN_SALARY > 8000;