# 3. Список департаментов, для которых руководитель имеет стаж работы более 16 лет
SELECT D.DEPARTMENT_NAME, E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM HR.DEPARTMENTS D
JOIN HR.EMPLOYEES E ON D.MANAGER_ID = E.EMPLOYEE_ID
WHERE E.HIRE_DATE <= DATE_SUB(CURDATE(), INTERVAL 16 YEAR);

# 10. Отобразить записи из HR.JOB_HISTORY для сотрудников, которые получают зарплату выше 15000
SELECT JH.*
FROM HR.JOB_HISTORY JH
JOIN HR.EMPLOYEES E ON JH.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE E.SALARY > 15000;

# 12. Полные данные о расположении рабочего места сотрудника с ID 105
SELECT L.*, D.*, E.*
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.EMPLOYEE_ID = 105;

# 18. Список сотрудников, чьи рабочие места находятся в Торонто (CITY = 'Toronto')
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Toronto';

# 20. Количество сотрудников, работающих в разных странах
SELECT L.COUNTRY_ID, COUNT(E.EMPLOYEE_ID) AS NUM_OF_EMPLOYEES
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.COUNTRY_ID;

# 23. Количество сотрудников, работающих в разных городах
SELECT L.CITY, COUNT(E.EMPLOYEE_ID) AS NUM_OF_EMPLOYEES
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY;

# 35. Список сотрудников с должностью, которую они занимали не более одного года
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE
FROM HR.EMPLOYEES E
JOIN HR.JOB_HISTORY JH ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
JOIN HR.JOBS J ON JH.JOB_ID = J.JOB_ID
WHERE (JH.END_DATE - JH.START_DATE) <= 365;