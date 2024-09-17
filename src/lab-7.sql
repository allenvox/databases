# 3. Список сотрудников, чья карьера включает не менее 2 позиций
SELECT EMPLOYEE_ID
FROM HR.JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(JOB_ID) >= 2;

# 4. Список должностей, которые в прошлом занимали не менее 2 сотрудников на срок более 300 дней
SELECT JOB_ID
FROM HR.JOB_HISTORY
WHERE (END_DATE - START_DATE) > 300
GROUP BY JOB_ID
HAVING COUNT(DISTINCT EMPLOYEE_ID) >= 2;

# 6. Перечень менеджеров с указанием их идентификатора (manager_id) и количества сотрудников в подчинении
SELECT MANAGER_ID, COUNT(*) AS NUM_OF_EMPLOYEES
FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

# 9. Список менеджеров, у которых в подчинении более 6 сотрудников, получающих зарплату от 2000 до 12000
SELECT MANAGER_ID, COUNT(*) AS NUM_OF_EMPLOYEES
FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 12000
GROUP BY MANAGER_ID
HAVING COUNT(*) > 6;

# 15. Список должностей, для которых количество сотрудников с зарплатой от 7000 до 15000 не меньше 3
SELECT JOB_ID, COUNT(*) AS NUM_OF_EMPLOYEES
FROM HR.EMPLOYEES
WHERE SALARY BETWEEN 7000 AND 15000
GROUP BY JOB_ID
HAVING COUNT(*) >= 3;

# 17. Минимальная и максимальная зарплата для каждого департамента
SELECT DEPARTMENT_ID, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

# 34. Группировка департаментов по коду местоположения (LOCATION_ID) и подсчёт их количества
SELECT LOCATION_ID, COUNT(*) AS NUM_OF_DEPARTMENTS
FROM HR.DEPARTMENTS
GROUP BY LOCATION_ID;

# 37. Годы, в которых число принятых на работу сотрудников в департаменте превышало 7
SELECT DEPARTMENT_ID, EXTRACT(YEAR FROM HIRE_DATE) AS HIRE_YEAR, COUNT(*) AS NUM_OF_HIRES
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID, EXTRACT(YEAR FROM HIRE_DATE)
HAVING COUNT(*) > 7;
