--=========================================================================================================
--06 - Sentencia SELECT 
--=========================================================================================================
SELECT * FROM jobs;

/*PARA SABER LA ESTRUCTURA DE LAS TABLAS*/
DESC jobs;
DESCRIBE jobs;

SELECT job_id FROM jobs;
SELECT job_id, min_salary FROM jobs;

/*ALIAS ====> AS */
SELECT job_id AS job, min_salary as minimiun_salary FROM jobs;
SELECT job_id AS "Job", min_salary as "Minimiun_Salary" FROM jobs;

DESC employees;

SELECT department_id FROM employees;
/*DISTINCT ===> PARA QUE NO SE REPITAN LOS REGISTROS*/
SELECT DISTINCT department_id FROM employees;
SELECT DISTINCT department_id, job_id FROM employees;
SELECT * FROM countries;

DESC countries;

SELECT * FROM REGIONS;

--=========================================================================================================
--07 - Tabla Dual
--=========================================================================================================
/*DUAL ===> NOS PERMITE HACER SELECT DE EXPRESIONES ARITMETICAS, CADENAS, FECHAS O DE CUALQUIER 
EXPRESION QUE RESULTE EN UN SOLO VALOR. */
SELECT * FROM dual;
SELECT 3*4 FROM dual;
SELECT 'Hola Mundo' FROM dual;
SELECT SYSDATE FROM dual;
SELECT USER FROM dual;

--CONCATENACION DE CADENAS
SELECT 'Esta es una cadena' ||' ' || 'otra cadena de prueba'
FROM dual; 


SELECT 'Usuario: ' || USER ||' ' || ', el dia de hoy es: ' || SYSDATE AS  "Encabezado"
FROM dual; 

/*SI QUEREMOS AGREGAR UNA COMILLA SIMPLE  DENTRO DE LA CADENA QUE ESTA EN COMILLA SIMPLES
TENEMOS QUE AGREGAR DOS COMILLAS POR EJEM:*/

SELECT 'I''m '|| USER from dual;

--=========================================================================================================
--08 - Añadir filtros con la cláusula WHERE
--=========================================================================================================
SELECT first_name || ' ' || last_name "Name", department_id
FROM employees
WHERE department_id=80;

SELECT department_name
FROM departments
WHERE department_id=80;

DESC job_history;

SELECT * FROM job_history
WHERE job_id='AC_ACCOUNT';

SELECT * FROM COUNTRIES 
WHERE region_id=4;

DESC regions;

SELECT region_name FROM regions
WHERE region_id=4;

/*SIMBOLOS
diferente <>, !=, 
menor que <, <=
mayor que >, >=
*/

SELECT first_name || ' ' || last_name "Name",
       commission_pct
FROM employees
WHERE commission_pct >= 0.35;


--OPERADOR IN : DEFINE VALORES

SELECT first_name || ' ' || last_name "Name",
       department_id 
FROM employees
WHERE department_id IN (10,20,50);

--=========================================================================================================
--09 - Más filtros
--=========================================================================================================

--OPERADOR LOGICO "NOT"
SELECT first_name, department_id
FROM employees
WHERE NOT (department_id >=30);

--OPERADOR LOGICO "AND"
SELECT first_name, salary 
FROM employees
WHERE last_name = 'Smith' AND salary > 7500;


--OPERADOR LOGICO "OR"
SELECT first_name, last_name 
FROM employees
WHERE first_name = 'Kelly' OR last_name = 'Smith';

--OPERADOR BETWEEN

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 6000;

-- FORMA MAS EXPLICITA O EQUIVALENTE AL OPERADOR BETWEEN
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 5000 AND salary <= 6000;


--OPERADOR LIKE => 
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE 'Su%';

-- % COMODIN = REEMPLAZA 0 MAS CARACTERES

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%a';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%C%a';

SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%m%';

--OPERADOR "IS NULL"
SELECT first_name, last_name
FROM employees
WHERE department_id IS NULL;

SELECT first_name, last_name
FROM employees
WHERE department_id IS NOT NULL;

--=========================================================================================================
--10 - Ordenar resultados con la cláusula ORDER BY
--=========================================================================================================
 SELECT * FROM countries
 ORDER BY region_id, country_name;

SELECT first_name || ' ' || last_name "Employee Name"
FROM employees
WHERE department_id=90
ORDER BY last_name;

SELECT last_name, first_name
FROM employees
ORDER BY last_name DESC, first_name ASC;

SELECT first_name, hire_date, salary, manager_id
FROM employees
WHERE department_id IN (110, 100)
ORDER BY first_name;

SELECT first_name, hire_date, salary, manager_id mid
FROM employees
WHERE department_id IN (110, 100)
ORDER BY 4, 2, 3;

SELECT last_name, commission_pct
FROM employees
WHERE last_name LIKE 'R%'
ORDER BY commission_pct ASC, last_name DESC; 

--=========================================================================================================
--11 - Funcion CONCAT
--=========================================================================================================
SELECT 'Esta es una cadena' || 'otra cadena' FROM DUAL;

--CONCAT (X,Y)
SELECT CONCAT('Esto es una cadena', 'otra cadena') FROM DUAL;
SELECT CONCAT(CONCAT('UNO',' DOS'),' TRES') FROM DUAL;

SELECT CONCAT(CONCAT(first_name, ' '), last_name) employee_name, 
       first_name || ' ' || last_name AS employees_name_2
FROM employees
WHERE department_id = 30;

--=========================================================================================================
--12 - Funcion substr 

--=========================================================================================================
--DEVUELVE UNA SUB CADENA DE UNA CADENA MAS GRANDE
--SUBSTR(cadena1, numeroX, [,posicionY])

SELECT SUBSTR('CADENA MUY LARGA DE EJEMPLO', 10) FROM DUAL;
SELECT SUBSTR('CADENA MUY LARGA DE EJEMPLO', 10, 7) FROM DUAL;
SELECT SUBSTR(10000 - 8, 3,2) FROM DUAL;

--dd/mm/yyyy
SELECT SYSDATE, SUBSTR(SYSDATE, 4,3) FROM DUAL;

SELECT SUBSTR('1#3#5#7#9', 5) FROM DUAL;
SELECT SUBSTR('1#3#5#7#9', 2, 6) FROM DUAL;

SELECT 'Nombre: ' || SUBSTR(first_name, 1, 1)
  || '. ' || last_name "Nombre"
FROM employees
WHERE SUBSTR(job_id,1,2) = 'AD';

--DATAFILES
--=========================================================================================================
--13 - Función substr parte 2
--=========================================================================================================
SELECT file_name
FROM dba_data_files;

SELECT INSTR(file_name, '\',-1), file_name
FROM dba_data_files;

SELECT SUBSTR(file_name, INSTR(file_name, '\',-1) + 1)
FROM dba_data_files;

--=========================================================================================================
--14 - Función instr
--=========================================================================================================

--INSTR 
--INSTR (Cadena1, Cadena2[,i,[j]]) 
/*PERMITE ENCONTRAR UN CARACTER DENTRO DE UNA CADENA, ESPECIFICA UN INICIO 
DE BUSQUEDA, QUE NUMERO DE OCURRENCIA QUEREMOS ENCONTRAR
DEVUELVE UN NUMERO, EL NUMERO DE POSICION DE LA CADENA*/ 

SELECT INSTR ('Hola mundo', 'mu') FROM DUAL;
SELECT INSTR ('Otra cadena', 'no existe') FROM DUAL;

SELECT SYSDATE, INSTR (SYSDATE, '16') FROM DUAL;

SELECT INSTR ('1#3#5#7#9','#') FROM DUAL;

--EJEM: CON NUMERO DE OCURRENCIA
SELECT INSTR ('1#3#5#7#9','#',5) FROM DUAL;

SELECT INSTR ('1#3#5#7#9#','#', 3, 4) FROM DUAL;

SELECT * FROM departments
WHERE INSTR(department_name, 'on') =2;


--=========================================================================================================
--15 - Función length
--=========================================================================================================
--FUNCION LENGTH = DEVUELVE LA LONGITUD DE UNA CADENA 
--LENGTH(CADENA1)

SELECT LENGTH ('Cadena es una cadena') FROM DUAL;

SELECT LENGTH ('1 + 2 = ' || 3) FROM DUAL;

--FORMATO FECHA dd/mm/yy
SELECT LENGTH (SYSDATE) FROM DUAL;

SELECT * FROM COUNTRIES 
WHERE LENGTH(country_name)>10; 

SELECT * FROM COUNTRIES 
WHERE LENGTH(country_name)<=10; 

--=========================================================================================================
--16 - Función lower
--=========================================================================================================
--LOWER (cadena de texto)
-- CONVERTIR UNA CADENA A MINUSCULA
SELECT LOWER('hOLa munDo') FROM DUAL;
SELECT LOWER(30+50) FROM DUAL;

SELECT LOWER('La suma ' || ' 10 + 10 ' || '=' || ' 20')
FROM DUAL;

SELECT LOWER(SYSDATE) FROM DUAL;

SELECT first_name, last_name, LOWER(last_name)
FROM employees
WHERE LOWER(last_name) LIKE '%ur%';

--=========================================================================================================
--17 - Funciones Lpad y Rpad
--=========================================================================================================
/*Sirve para rellenar cadenas hasta que tengan una longitud fija*/
--L para LEFT y R para RIGHT
--LPAD(cadena de texto, i(cant. fija de caracteres)[,cadena de texto 2(caracter de relleno)])

SELECT LPAD('cadena', 10), RPAD('cadena', 10) FROM DUAL;

SELECT LPAD('aaaaa', 15,'*'), RPAD('aaaaa', 15, '*') FROM DUAL;

SELECT LPAD(SYSDATE,14,'-?'), RPAD(SYSDATE,14,'-?') FROM DUAL;

SELECT LPAD(last_name, 10) lpad_name, 
       LPAD(salary, 8,'*') lpad_salary
FROM employees
WHERE last_name LIKE '%J%';

SELECT LPAD(last_name, 10) lpad_name, 
       LPAD(salary, 8,'-') lpad_salary
FROM employees
WHERE last_name LIKE '%J%';


--=========================================================================================================
--18 - Función replace
--=========================================================================================================
--REEMPLAZODE UNA CADENA DENTRO DE OTRA
-- REPLACE (cadena1 (origina), cadena2 (buscar para reemplazo), [, cadena3 (con que cadena reemplazar lo que estamos buscando)])

SELECT REPLACE ('downtown', 'down', 'up') FROM DUAL;
SELECT REPLACE ('downtown', 'down') FROM DUAL; --SI NO PONEMOS EL 3ER PARAMETRO SE ELIMINA, es como reemplzarlos con una cadena en blanco

--9999
SELECT REPLACE (10000 -1, '9', '85') FROM DUAL;
--9997
SELECT REPLACE (10000 -3, '9', '85') FROM DUAL;

SELECT REPLACE (SYSDATE, '11', '08') FROM DUAL;

SELECT last_name, salary, REPLACE (salary, '0', '000') "Salario Soñado"
FROM employees
WHERE job_id='SA_MAN';


--=========================================================================================================
--19 - Funciones matemáticas
--=========================================================================================================
/*ABS (Valor Absoluto), esta funcion recibe un argumento y devuelve el valor absoluto de dicho numero*/

SELECT ABS(-52) negative, ABS(52) positive, ABS(0) zero
FROM DUAL;

/*Funcion trigonometrica, ACOS (Coseno), ASIN(n), ATAN(n), COS(n),SIN(n),TAN(n)*/

SELECT ACOS(-1), ACOS(0), ACOS(.045) FROM DUAL;

--FUNCION CEILS(n) => Recibe un argunmento que es un numero y regresa el entero mas pequeño
--que sea mayor o menor que n

--CEIL (n)
SELECT CEIL (9.8), CEIL(-32.85),CEIL(0), CEIL(5)
FROM DUAL;

--FUNCION EXPONENCIAL = EXP(n)
SELECT EXP(1) "e" FROM DUAL;

--FLOOR / SIMILAR A CEIL PERO CON UN COMPORTAMIENTO DISTINTO
--REGRESA EL ENTERO MAS GRANDE QUE SEA MENOR O IGUAL QUE (n)
SELECT FLOOR(9.8), FLOOR(-32.85), FLOOR(137)
FROM DUAL;
/*CEIL => SIGNIFICA TECHO => SUBE LOS DECIMALES QUE TENGA NUESTRO NUMERO
  FLOOR => SIGNIFICA PISO => BAJA LOS DECIMALES QUE TENGA NUESTRO NUMERO
*/

--LN(n) = LOGARITMO NATURAL
SELECT LN(2.7) FROM DUAL;


--POWER(n1,n2) => POTENCIA 
SELECT POWER(2,10), POWER(3,3), POWER(5,3), POWER(2,-3)
FROM DUAL;

/*SIGN(n) => DEVUELVE UN INDICATIVO DEL SIGNO QUE TENGA UN NUMERO 
REGRESA -1 SI n ES NEGATIVO O 1 SI n ES POSITIVO y 0 SI n ES CERO.
*/
SELECT SIGN(-2.3), SIGN(0), SIGN(47) FROM DUAL;

--=========================================================================================================
--20 - Función TO_CHAR
--=========================================================================================================
--CONVIERTE DATOS DE OTROS TIPOS EN DATOS DE TIPO CARACTER
--TO_CHAR(EXPRESION[, FORMATO[, ESPECIFICADOR DE LENGUAJE]])


SELECT TO_CHAR(10) FROM DUAL;
SELECT TO_CHAR(000001) FROM DUAL;

SELECT TO_CHAR(000001, '0999999') FROM DUAL; 
--EL CERO AL INICIO INDICA QUE SI EL # ORIGINAL TIENE '0' AL PRINCIPIO, ESTOS SE DEBEN DE MANTENER

SELECT job_title, max_salary, TO_CHAR(max_salary, '$99,999.99'), 
      TO_CHAR(max_salary, '$9,999.99')
FROM jobs
WHERE UPPER(job_title) LIKE '%PRESIDENT%';

SELECT TO_CHAR(SYSDATE) FROM DUAL;

--MES EN FORMATO ABREVIADO
SELECT TO_CHAR(SYSDATE, 'Month') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'Year') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'Day') FROM DUAL;

--MES EN FORMATO NUMERICO 
SELECT TO_CHAR(SYSDATE, 'MM') FROM DUAL;

SELECT last_name, TO_CHAR(hire_date,'fmDD Month yyyy') "Hire Date"
FROM employees;
--Ddspth => MUESTRA EL DIA CON FORMATO SPELCK O INDICADO POR SUS LETRAS NO POR SU NUMERO 
SELECT TO_CHAR(SYSDATE, 'Day Ddspth, Month YYYY', 'nls_date_language=Spanish') --=German=> SE AGREGA EL LENGUAJE 
FROM DUAL;

--=========================================================================================================
--21  Función TO_DATE
--=========================================================================================================
-- CONVIERTE TIPO DE CARACTER A FECHAS
--TO_DATE(cadena, formato[, especificador de idiomas - nslparam]])
/*MODIFICAMOS EL TIPO POR DEFAULT QUE APARECE EN EL FORMATO DE LAS FECHAS,
PERMITE ESPECIFICAR CLARAMENTE EL FORMATO QUE QUEREMOS PARA LAS FECHAS A LA HORA QUE SE MUESTREN,
IMPORTANTE!!! ESTO SOLO SE MODIFICA A NIVEL DE SESSION (ES TEMPORAL SOLO POR LA SESSION)
*/

ALTER SESSION SET nls_date_format = 'DD-MON-RR HH24:MI:SS';

SELECT TO_DATE('25-DEC-2010') FROM DUAL;

SELECT TO_DATE('25_DEC') FROM DUAL; --ERROR POR EL GUION BAJO.
SELECT TO_DATE('25-DEC') FROM DUAL; --ERROR POR EL FORMATO DE FECHA

SELECT TO_DATE('25-DEC', 'DD-MON') FROM DUAL;

--CORRECTO
SELECT TO_DATE('25-DEC-2010 18:03:45', 'DD-MM-YYYY HH24:MI:SS') FROM DUAL;

SELECT TO_DATE('30-SEP-2007', 'DD/MON/YY') FROM DUAL;
SELECT TO_DATE('SEP-2007 13', 'MON/YYYY HH24') FROM DUAL;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('01/12/2000', 'MM/DD/YYYY')
ORDER BY hire_date;

--=========================================================================================================
--22 - Funciones para fechas
--=========================================================================================================

--FUNCIONES PARA TRABAJAR CON FECHAS
--ARITMETICA PARA FECHAS

SELECT SYSDATE FROM DUAL;
--AÑADE UNA CANTIDAD ESPECIFICA DE MESES A UNA FECHA
--FUNCION ADD_MONTHS(FECHA(d), CANT. MESES(i))
SELECT SYSDATE "mes actual", ADD_MONTHS(SYSDATE, -1) "mes anterior", ADD_MONTHS(SYSDATE, 12) "año siguiente"
FROM DUAL;

/*OBS: NO HAY FUNCION PARA RESTAR MESES*/

--RANGO DE FECHA CON BETWEEN
SELECT MONTHS_BETWEEN('31-MAY-08', '30-SEP-08') f1,
       ROUND(MONTHS_BETWEEN('11-MAY-08', '30-SEP-08')) f2,
       ROUND(MONTHS_BETWEEN('01-MAY-08', '30-SEP-08')) f3,
       MONTHS_BETWEEN('31-MAY-08', '30-SEP-08') f4
FROM DUAL;

--CUAL ES EL ULTIMO DEL DIA DEL MES EN EL QUE ESTAMOS
SELECT SYSDATE,
        LAST_DAY(SYSDATE) fin_de_mes, 
        LAST_DAY(SYSDATE) + 1 dia_siguiente
FROM DUAL; 

--REDONDEAR FECHAS
--ROUND (fecha (d) [,formato como queremos tratar a la fecha (fmt))
SELECT SYSDATE, ROUND(SYSDATE, 'HH24') ROUND_HOUR, 
                ROUND(SYSDATE) ROUND_DATE, ROUND(SYSDATE, 'MM') NEW_MONTH,
                ROUND(SYSDATE, 'YY') NEW_YEAR
FROM DUAL;

--=========================================================================================================
--23 - Funciones para datos nulos
--=========================================================================================================
--FUNCIONES NVL, NVL2, COALSCE

--NVL (X1, X2) = RECIBE DOS ARGUMENTOS, PUEDEN SER EXPRESIONES, NVL REGRESA X2 SI X1 ES NULL, SI X1 NO ES NULL LO REGRESA.
SELECT last_name, NVL(department_id,0)
FROM employees
ORDER BY 2;

SELECT first_name, salary, NVL(commission_pct,0),
       salary + (salary * NVL(commission_pct,0)) "Compensacion"
FROM employees
WHERE first_name LIKE 'T%';

--NVL2 (X1,X2,X3) = REGRESA X3 SI X1 ES NULL, Y X2 SI X1 NO ES NULL.

SELECT first_name, salary, commission_pct, 
       NVL2(commission_pct, salary + salary * commission_pct,salary) "Compensacion"
FROM employees
WHERE first_name LIKE 'T%';

--COALSCE 
/*RECIBE UNA LISTA DE EXPRESSIONES (1,2,3 O MAS EXPRESIONMES)

COALSCE  (X1, X2, X3, O MAS) = SI X1 ES NULL, REVISAMOS X2 SI NO REGRESA A X1, 
SI X2 ES NULL, REVISAMOS X3 SI NO REGRESAMOS A X2, SI X3 ES NULL SE REGRESA NULL O SI 
NO SE REGRESA X3, EN POCAS PALABRAS ESTO VA A REGRESAR LA PRIMERA EXPRESION QUE NO SEA NULL
DENTRO DE LA FUNCION*/

SELECT  last_name, salary, commission_pct AS comm,
COALESCE(salary + salary * commission_pct, salary + 100,900/*--ESTE NUNCA VA A SER NULL, POR QUE ES 900*/) "Comision"
FROM employees
WHERE last_name LIKE 'T%';

--=========================================================================================================
--24 - Funciones adicionales
--=========================================================================================================
--DECODE (SE PARECE A LA ESTRUCTURA IF-ELSE O AL CASE O SWITCH)
--DECODE (x (dato - expresion)), m1(match), r (resultado), m2 (match), r2 (resultado2), m3 (match), r3 (resultado3)

SELECT country_id, country_name, region_id, 
       DECODE(region_id, 1, 'Europa',
                         2, 'America',
                         3,'Asia',
                           'Otro') Region
FROM countries;
        
--GREATEST = RECIBE UNA LISTA DE EXPRESIONES Y LAS ORDENAR DE MAYOR A MENOR Y SELECCIONA LA MAYOR.

SELECT GREATEST('01-APR-08','30-DIC-08','20-ENE-10') FROM DUAL; 
/*OBS: LOS DATOS SON CADENAS DE TEXTO NO FECHAS, ES POR ENDE QUE SE ORDENAN COMO SI FUERA TEXTO
TAMBIEN CABE RESALTAR QUE EL PRIMER TIPO DE DATO QUE APARECE EN LA LISTA VA A INDICAR EL TIPO DE DATO
SERAN LOS SIGUIENTES*/

SELECT GREATEST(345,'XYZ',234) FROM DUAL;
--ERROR! POR QUE LA 1RA EXP. ES NUMERO Y LA SIGUIENTE LO TOMA ASI (PERO NO ES).

SELECT GREATEST('XYZ',345,234) FROM DUAL;
--CORRECTO! POR QUE TOMAR LOS VALORES DE LA LISTA COMO EL 1RO, EL CUAL ES TEXTO.

SELECT last_name, salary, GREATEST(salary*0.15, 500) bono
FROM employees
WHERE department_id IN (30,10)
ORDER BY last_name;

--LEAST = FUNCION EL EQUIVALENTE DE GREATEST, EL CUAL MUESTRA EL MENOR
SELECT LEAST(SYSDATE,'15-MAR-2002','17-JUN-2002') FROM DUAL;

--=========================================================================================================
--25 - Función COUNT
--=========================================================================================================
--COUNT RECIBE UN ARGUMENTO QUE PUEDE SER EL * O UNA EXPRESION
--COUNT(*, expresion)

-- CUANDO SE UTILIZA EL (*) EL CONTEO SIEMPRE VA A SER EL TOTAL DE LAS FILAS QUE SE CONTENGA EN ESA TABLA
SELECT COUNT(*)
FROM employees;

SELECT COUNT(*) FROM countries;

SELECT COUNT(commission_pct) FROM employees;

--EL COUNT SOLO VA A TOMAR EN CUENTO AQUELLO QUE NO SEAN NULOS
SELECT commission_pct FROM employees; 

/*SI QUEREMOS CONSIDERAR LOS VALORES QUE SON DISTINTOS DE UNA COLUMNA DADA,
AGREGAMOS UN MODIFICADOR LLAMADO DISTINCT*/

SELECT COUNT(DISTINCT commission_pct) FROM employees;
/*EL DISTINCT VA A TOMAR LOS % DE COMISION QUE SEAN DISTINTOS ENTRE SI Y LOS 
VA A CONTAR, DANDO UN TOTAL DE 7 PORCENTAJES*/

--TAMBIEN SE PUEDE AGREGAR UN MODIFICADOR LLAMADO "ALL", AUNQUE YA SE APLICA POR DEFAULT
SELECT COUNT(ALL commission_pct) FROM employees;

--VARIAS VECES LA FUNCION COUNT.
SELECT COUNT(hire_date), COUNT(manager_id) FROM employees;

SELECT COUNT(*),
       COUNT(DISTINCT NVL(department_id, 0)),
       COUNT(DISTINCT NVL(job_id, 0))
FROM employees;

SELECT COUNT(*) "Paises comenzando con 'A'"
FROM countries
WHERE country_name LIKE 'A%';

SELECT country_name
FROM countries
WHERE country_name LIKE 'A%';

--=========================================================================================================
--26 - Función AVG
--=========================================================================================================
--AVG([DISTINCT|ALL] Expresion)

SELECT AVG(5) FROM employees; --NO TIENE CASO HACERLO CON NUMEROS

--OK!
--TRUNC ==> PARA QUITAR LOS DECIMALES
SELECT TRUNC(AVG(salary)) FROM employees;
SELECT TRUNC(AVG(DISTINCT(salary))) FROM employees;
SELECT AVG(commission_pct) FROM employees;

SELECT last_name,job_id,ROUND((SYSDATE -hire_date) / 365.25,1) "Años Trabajados"
FROM employees
WHERE job_id= 'IT_PROG';

SELECT ROUND(AVG((SYSDATE -hire_date) / 365.25),1 ) "Promedio de Años Trabajados"
FROM employees
WHERE job_id= 'IT_PROG';

--=========================================================================================================
--27 - Función SUM
--=========================================================================================================
--SUM([DISTINCT]|ALL])expr);

SELECT SUM(salary) FROM employees;
SELECT salary FROM employees WHERE salary IS NULL;
SELECT SUM(5) FROM employees; --NO TIENE SENTIDO, AGREGAR UN NUMERO --PARA SUMAR CONSTANTE DE UNA CIERTA CANTIDAD DE EMPLEADOS

SELECT 5 * COUNT(*) FROM employees;
SELECT SUM(DISTINCT salary)FROM employees;
SELECT SUM(DISTINCT commission_pct) FROM employees;

SELECT ROUND(SUM(SYSDATE-hire_date)/365.25,2) "Total de años trabajados" 
FROM employees;

--NO SE PUEDE SUMAR FECHAS O NOMBRES (CADENA DE CARACTERES)
--=========================================================================================================
--28 - Funciones MIN y MAX
--=========================================================================================================
--MIN,MAX ([DISTINCT|ALL] expresion)
SELECT MIN(commission_pct), MAX(commission_pct)
FROM employees;

/*NO TOMA LOS VALORES NULL, YA QUE NO SE TOMAN EN CUENTA EN LAS FUNCIONES DE 
AGREGACION,EXCEPTO POR COUNT(*).
LOS NULL EN EL CRITERIO DE ORDENAMIENTO SIEMPRE SON ">" QUE LOS DEMAS DATOS*/

--FECHA
SELECT MIN(start_date), MAX(end_date) FROM job_history;
--CADENA DE TEXTO
SELECT MIN(job_id), MAX(job_id) FROM employees;

SELECT MIN(hire_date), MIN(salary), MAX(hire_date), MAX(salary)
FROM employees
WHERE job_id='SA_REP';

/*EJERCICIO:
Calcular el prom. de la long. de los nombre de todos los paises, cualquier
componente de fraccion debera ser redondeado al numero entero*/

SELECT ROUND(AVG(LENGTH(country_name)),0) "Prom. de Longitudes"
FROM countries;

--=========================================================================================================
--29 - Cláusula GROUP BY
--=========================================================================================================
SELECT ROUND(AVG(salary)), department_id
FROM employees
GROUP BY department_id
ORDER BY 1 DESC;

/*LA CLAUSULA "ORDER BY" SIEMPRE IRA AL FINAL DE LA CONSULTA

**LO IMPORTANTE A ANOTAR PARA PODER AGRUPAR POR MEDIO DE UNA CARACTERISTICA, 
DEBEMOS COLOCAR ESA CARACTERISTICA EN LA CLAUSULA GROUP BY, NO ES NECESARIO
AGREGARLA EN LA PARTE DEL SELECT, SIN EMBARGO ES UTIL PARA SABER ESE DATO.
*/

SELECT COUNT(*), manager_id
FROM employees
GROUP BY manager_id
ORDER BY 1 DESC, 2 NULLS LAST;

SELECT MAX(salary), COUNT(*),department_id
FROM employees
GROUP BY department_id
ORDER BY department_id;

--VERIFICACION
SELECT LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES ORDER BY 2;

--CUANTOS EMPLEADOS RENUNCIARON POR AÑO
SELECT TO_CHAR(end_date,'YYYY') "Año",
       COUNT(*) "Empleados"       
FROM job_history
GROUP BY TO_CHAR(end_date, 'YYYY')
ORDER BY COUNT(*) DESC;

--SE PUEDE ORDERNAR SEGUN EXPRESION.

--ERRORES MAS COMUNES QUE SE SUCITAN CUANDO TRABAJAMOS CON GROUP BY.
SELECT end_date, COUNT(*)
FROM job_history --ERROR SI LO DEJAMOS HASTA AQUIU
GROUP BY end_date; --SOLUCION, AGREGAR GROUP BY.

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
/*MUY MUY IMPORTANTE!!!
TODAS LAS EXPRESIONES O COLUMNAS QUE NO SEAN DE AGRUPACION QUE APAREZCA EN 
SELECT DEBEN DE ESTAR EN UN GROUP BY, SI NO VAN A OCURRIR UN ERROR.*/
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

SELECT end_date, start_date, COUNT(*)
FROM job_history
GROUP BY end_date, start_date;

--=========================================================================================================
--30 - Cláusula GROUP BY parte 2
--=========================================================================================================

SELECT department_id, SUM(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

SELECT department_id,job_id,SUM(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id,job_id;

/*EJERCICIO::::::::::::::::::
CREAR UN REPORTE QUE CONTENGA EL NUMERO DE EMPLEADOS QUE HAN DEJADO SUS TRABAJOS
AGRUPADOS POR EL AÑO EN EL CUAL SE FUERON, LOS TRABAJOS QUE REALIZABAN DEBEN
MOSTRARSE, LOS RESULTADOS DEBEN SER ORDENADOS EN ORDEN DESCENDENTE BASADO EN EL 
# DE EMPLEADO DE CADA GRUPO, EL REPORTE DEBE DE LISTAR EL AÑO, JOB_ID Y EL # 
DE EMPLEADOS QUE DEJARON UN PARTICULAR TRABAJO ESE AÑO*/

SELECT TO_CHAR(end_date,'YYYY'),job_id, COUNT(*)
FROM job_history
GROUP BY TO_CHAR(end_date,'YYYY'),job_id
ORDER BY COUNT(*) DESC;

/*EJERCICIO::::::::::::::::::
SELECCIONAR LA LONGITUD DEL NOMBRE MAS LARGO Y MAS CORTO DE LOS EMPLEADOS QUE
SEAN REPRESENTANTES DE VENTAS*/

SELECT MAX(LENGTH(last_name)), MIN(LENGTH(last_name))
FROM employees
WHERE job_id = 'SA_REP';


--=========================================================================================================
--31 - Cláusula HAVING
--=========================================================================================================
--PARA FILTRAR Y REFINAR LAS CONSULTAS BASADAS EN GRUPOS.


--MODELO A SEGUIR PARA CONSULTAS COMPLETAS!!!
SELECT department_id, COUNT(*)
FROM job_history
WHERE department_id IN (50, 60, 80, 110) --AND COUNT(*) >1 ===> ERROR
GROUP BY department_id
HAVING COUNT(*) >1 --OK! HAVING PARA CONDICIONAR LAS FUNCIONES DE AGRUPACIONES.
ORDER BY 1;

SELECT job_id, AVG(salary), COUNT(*)
FROM employees
GROUP BY job_id
HAVING AVG(salary) >10000 AND COUNT(*)>1
ORDER BY 2 DESC;

/*HAVING SOLO SE AGREGA CUANDO EN LA CONSULTA EXISTE UN GROUP BY, POR QUE
HAVING SOLO FUNCIONA CON GRUPO.*/

/*EJERCICIO::::::::::::::::::
IDENTIFICAR LOS DIAS DE LA SEMANA EN LOS CUALES 15 O MAS MIEMBROS DEL 
STAFF FUERON CONTRATADOS, EL REPORTE DEBE DE LISTAR LOS DIAS Y EL # DE 
EMPLEADOS CONTRATADOS EN CADA UNO DE ELLOS*/

SELECT TO_CHAR(hire_date, 'DAY'), COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'DAY')
HAVING COUNT(*)>=15
ORDER BY COUNT(*);

--=========================================================================================================
--32 - Introducción a los joins
--=========================================================================================================
--REGION DE CANADA
SELECT region_name
FROM regions NATURAL JOIN countries
WHERE country_name='Canada';

DESC regions;
DESC countries;

/*PARA QUE EL NATURAL JOIN PUEDA FUNCIONAR DE MANERA CORRECTA AMBAS TABLAS DEBEN
DE TENER UNA MISMA COLUMNA QUE SE LLAME IGUAL Y TENGA EL MISMO TIPO DE DATO. */

SELECT country_name 
FROM countries NATURAL JOIN regions
WHERE region_name ='Americas';

/*JOIN CON OTRA SINTAXIS*/
SELECT region_name
FROM regions JOIN countries
USING (region_id)
WHERE country_name='Canada';

/*ON ===>>INDICA QUE COLUMNAS SE VAN A COMPARAR*/
SELECT country_name
FROM countries JOIN regions
ON (countries.region_id = regions.region_id)
WHERE region_name = 'Americas'; 

/*JOIN CRUZADO O PRODUCTO CARTESIANO, ES MENOS UTILIZADO PERO HAY OCACIONES
DONDE SE PUEDE UTILIZAR*/

SELECT COUNT(*) FROM countries; --> 25
SELECT COUNT (*) FROM regions;-->4

--
SELECT * FROM regions CROSS JOIN countries;
SELECT COUNT(*) FROM regions CROSS JOIN countries;
/*LO QUE HACE UN CROSS JOIN ES JUNTAR TODAS LAS FILAS DE UNA TABLA JUNTO CON 
TODAS LAS FILAS DE LA OTRA SIN IMPORTAR QUE HAYA COINCIDENCIA DE HECHO NO 
TIENE QUE HABER UNA COLUMNA EN COMUN, PUEDE ESTAR O NO ESTAR, PERO SIEMPRE 
REALIZARA UNA MULTIPLICACION. */


--33 - Join natural
/*SELECT table1.column, table2.column
FROM table1
NATURAL JOIN table2;*/

SELECT *
FROM locations NATURAL JOIN countries;

/* JOIN EQUIVALENTE A NATURAL JOIN PERO CON OTRA SINTAXIS*/
SELECT *
FROM locations, countries
WHERE locations.country_id=countries.country_id;

/*SE RECOMIENDA NATURAL JOIN POR QUE ES EL MAS USADO, ASI MISMO LIBERA LA 
CLAUSULA WHERE PARA PODER PONER OTRAS CONDICIONES SIN TENER QUE PONER 
OTRA CONDICIONES LOGICAS, LA DESVENTAJA QUE ESTA COLUMNA SE DEBE DE LLAMAR IGUAL
EN ESE CASO LA SOLUCION SE TIENE QUE HACER POR LA IGUALDA DE CAMPOS CON WHERE*/

/*EN FORMA RESUMIDA*/
SELECT l.street_address,l.city, c.country_name 
FROM locations l, countries c
WHERE l.country_id = c.country_id;

/*QUE PASA SI SE REALIZA EL NATURAL JOIN CUANDO NO SE TIENE LA COLUMNA EN 
COMUN ENTRE DOS TABLAS? 
R//= DEVUELVE UN CROSS JOIN O PRODUCTO CARTESIANO NOS DEVUELVE LA MULTIPLICACION
DE LAS FILAS DE UNA TABLA CON LAS FILAS DE OTRA TABLA
*/
DESC jobs;
DESC countries;

SELECT *
FROM jobs NATURAL JOIN countries;

/*JOIN EQUIVALENTE CON OTRA SINTAXIS*/
SELECT *
FROM jobs, countries; /*SIN INDICAR EL WHERE POR QUE NO HAY COLUMNA COMUN*/

--INGLES
/*The JOB_HISTORY table shares three identically named columns with 
the EMPLOYEES table: EMPLOYEE_ID, JOB_ID, and DEPARTMENT_ID. You 
are required to describe the tables and fetch the EMPLOYEE_ID, JOB_ID,
DEPARTMENT_ID, LAST_NAME, HIRE_DATE, and END_DATE values for all 
rows retrieved using a pure natural join. Alias the EMPLOYEES table as EMP and 
the JOB_HISTORY table as JH and use dot notation where possible.*/

--ESPAÑOL
/*La tabla JOB_HISTORY comparte tres columnas con nombres idénticos
la tabla EMPLEADOS: EMPLOYEE_ID, JOB_ID, y DEPARTMENT_ID. Tú
son necesarios para describir las tablas a buscar EMPLOYEE_ID, JOB_ID,
DEPARTMENT_ID, apellidos, HIRE_DATE, y END_DATE valores para todos
filas recuperadas utilizando un puro natural se unen. Alias la tabla EMPLEADOS 
como EMP y la tabla JOB_HISTORY como JH y el uso de la notación de puntos 
siempre que sea posible.*/

/*RECORDAR: NO PODEMOS ANTEPONER EL NOMBRE DE LA TABLA O DEL ALIAS 
CUANDO ESTEMOS CON LA SINTAXIS DE NATURAL JOIN*/
SELECT employee_id, job_id, department_id,
    e.last_name, e.hire_date, jh.end_date
FROM job_history jh NATURAL JOIN employees e;
--=========================================================================================================
--34 - Uniendo múltiples tablas

--departments. locations, countries, regions

SELECT d.department_name, l.city, c.country_name, r.region_name 
FROM departments d
NATURAL JOIN locations l
NATURAL JOIN countries c
NATURAL JOIN regions r;

DESC departments;

/*EQUIVALENTE CON JOIN ON*/
SELECT d.department_name, l.city, c.country_name, r.region_name 
FROM departments d
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id);

/*EQUIVALENTE CON JOIN USING*/
SELECT d.department_name, l.city, c.country_name, r.region_name 
FROM departments d
JOIN locations l USING (location_id)
JOIN countries c USING (country_id)
JOIN regions r USING (region_id);

SELECT d.department_id, l.city, d.department_name
FROM departments d
JOIN locations l ON l.location_id = d.location_id 
WHERE d.department_name LIKE 'P%';    



--35 - Sentencias DML - =========================================================================================================

CREATE TABLE personas(
  id INTEGER NOT NULL,
  nombre VARCHAR2(50),
  edad INTEGER 
);

INSERT INTO personas (id,nombre,edad) 
VALUES (1,'Juan',28);

INSERT INTO personas VALUES (2,'Carlos',31);
INSERT INTO personas (id,nombre)VALUES (3,'Maria');
INSERT INTO personas (id,nombre)VALUES (4,'Pedro');
INSERT INTO personas (id,edad) VALUES (5,27);

SELECT * FROM personas;

UPDATE personas 
SET edad=38 
WHERE id=3;

UPDATE personas
SET nombre='Alfonso'
WHERE id=5;

UPDATE personas
SET nombre='Pedro IV', edad=42
WHERE id=4;

UPDATE personas
SET edad=NULL;

DELETE FROM personas
WHERE nombre='Alfonso';

DELETE FROM personas;

DROP TABLE personas;

--36 - Operadores de conjuntos

SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--37 - Modelar un Diagrama Entidad-Relación
 CREATE TABLE autores(
   id NUMBER (4) PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   apellido_paterno VARCHAR2(50) NOT NULL,
   apellido_materno VARCHAR2(50) NOT NULL
);

CREATE TABLE libros(
  isbn VARCHAR2(13) PRIMARY KEY,
  titulo VARCHAR2(255) NOT NULL,
  sinopsis VARCHAR2(1000),
  num_paginas NUMBER(4),
  editorial_id NUMBER (4)
);

CREATE TABLE autores_libros(
  autor_id NUMBER(4),
  libro_id VARCHAR2(13)
);

CREATE TABLE editoriales(
  id NUMBER(4) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  sede VARCHAR2(255)
);

ALTER TABLE autores_libros
ADD CONSTRAINT autores_fk FOREIGN KEY (autor_id)
REFERENCES autores (id);

ALTER TABLE autores_libros
ADD CONSTRAINT libros_fk FOREIGN KEY (libro_id)
REFERENCES libros (isbn);

ALTER TABLE libros
ADD CONSTRAINT libros_editorial_fk FOREIGN KEY (editorial_id)
REFERENCES editoriales (id);

--38 - Índices
/*CREATE [UNIQUE  ][BITMAP] INDEX nombre
ON tabla (columna [,columna]);*/

CREATE INDEX emp_last_name_idx
ON employees(last_name);


--39 - Restricciones
/*CREATE TABLE table_name
column_name1 data_type (size),
column_name2 data_type (size),
column_name3 data_type (size),
...
);*/

CREATE TABLE personas(
  person_id INT,
  first_name VARCHAR2(255),
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500)
);


--TIPOS DE CONSTRAINT
--UNIQUE
--PRIMARY KEY
--FOREIGN KEY
--CHECK
--DEFAULT


--CONSTRAINT UNIQUE
CREATE TABLE personas(
  person_id INT NOT NULL,
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500)
);

INSERT INTO personas (person_id,last_name) VALUES (1,'Doe');
DROP TABLE personas;

CREATE TABLE personas(
  person_id INT NOT NULL UNIQUE,
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500)
);

INSERT INTO personas (person_id,first_name) VALUES (1,'John');

ALTER TABLE personas
ADD UNIQUE (person_id);

--MAS DETALLADO CON NOMBRE DE CONSTRAINT

--FORMA SIN NOMBRE DE CONSTRAINT 
ALTER TABLE personas
ADD UNIQUE (person_id)

--FORMA CON NOMBRE DE CONSTRAINT 
ALTER TABLE personas
ADD CONSTRAINT unique_person_id UNIQUE (person_id);

DROP TABLE personas;

--CONSTRAINT PRIMARY KEY

-- PRIMARY KEY = UNIQUE + NOT NULL

CREATE TABLE personas(
  person_id INT,
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500),  
  CONSTRAINT personas_pk PRIMARY KEY (person_id)
);

--OTRA FORMA DE APLICAR EL CONSTRAINT
ALTER TABLE personas
ADD PRIMARY KEY (person_id);

--OTRA FORMA DE APLICAR EL CONSTRAINT
ALTER TABLE personas
ADD CONSTRAINT personas_pk PRIMARY KEY (person_id);

--BORRAR CONSTRAINT SE USA LO SIGUIENTE
ALTER TABLE personas
DROP CONSTRAINT personas_pk;

--CONSTRAINT CHECK
DROP TABLE personas;

CREATE TABLE personas(
  person_id INT CHECK (person_id > 0),
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500),  
  CONSTRAINT personas_pk PRIMARY KEY (person_id)
);

CREATE TABLE personas(
  person_id INT,
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255),
  address VARCHAR2(500),  
  CONSTRAINT personas_pk PRIMARY KEY (person_id),
  CONSTRAINT personas_chk CHECK (person_id > 0)
);

--OTRA FORMA DE APLICAR EL CONSTRAINT
ALTER TABLE personas
ADD CHECK (person_id > 0);

--OTRA FORMA DE APLICAR EL CONSTRAINT
ALTER TABLE personas
ADD CONSTRAINT personas_chk CHECK (person_id > 0);

--BORRAR CONSTRAINT 
ALTER TABLE 
DROP CONSTRAINT personas_chk;

--CONSTRAINT DEFAULT
---------------------------------

CREATE TABLE personas(
  person_id INT,
  first_name VARCHAR2(255)NOT NULL,
  last_name VARCHAR2(255),
  city VARCHAR2(255) DEFAULT 'Seatle',
  address VARCHAR2(500),  
  CONSTRAINT personas_pk PRIMARY KEY (person_id),
  CONSTRAINT personas_chk CHECK (person_id > 0)
);

--OTRA FORMA DE APLICAR EL CONSTRAINT
ALTER TABLE personas
MODIFY city DEFAULT 'Seatle';

--OTRA FORMA
ALTER TABLE personas
ALTER COLUMN city DROP DEFAULT

--BORRAR CONSTRAINT DEFAULT
ALTER TABLE personas
ALTER COLUMN city DROP DEFAULT
-----------------------------------------------------------------------
-----------------------------------------------------------------------
--40 - Secuencias
/*Se almacenan como objeto de manera independiente
lo cual se pueden aplicar para diferentes tablas*/

/*SINTAXIS PARA SECUENCIA

CREATE SEQUENCE secuence
  [INCREMENT BY n]
  [START WITH n]
  [{MAXVALUE n} | NOMAXVALUE]
  [{MINVALUE n} | NOMINVALUE]
  [{CYCLE| NOCYCLE}]
  [{CACHE | NOCACHE}]
*/

CREATE SEQUENCE mi_secuencia
       INCREMENT BY 10
       START WITH 120
       MAXVALUE 9999
       NOCACHE
       NOCYCLE;

--CREAR TABLA PARA USAR LA SECUENCIA
CREATE TABLE test(
   id NUMBER PRIMARY KEY,
   coll NUMBER
); 

/*NEXTVAL = REGRESA EK SIGUIENTE ENTERO DISPONIBLE POR LA SECUENCIA,
            REGRESA UN VALOR UNICO CADA VEZ QUE LA LLAMAMOS INCLUSO 
            PARA DISTINTOS USUARIOS, SIEMPRE DEBE SER LLAMADA ANTES DE CURVAL, 
            POR QUE SI NO HABRA UN ERROR
*/
--CURRVAL = OBTIENE EL NUMERO ACTUAL 

INSERT INTO test VALUES (mi_secuencia.NEXTVAL,10);
INSERT INTO test VALUES (mi_secuencia.NEXTVAL,20);
INSERT INTO test VALUES (mi_secuencia.NEXTVAL,30);
INSERT INTO test VALUES (mi_secuencia.NEXTVAL,40);
INSERT INTO test VALUES (mi_secuencia.NEXTVAL,100);

SELECT * FROM test;
       
--SI QUISIERA VER EL NUMERO DE LA SECUENCIA ANTES DE INSERTAR

SELECT mi_secuencia.CURRVAL FROM DUAL;

INSERT INTO test VALUES (mi_secuencia.NEXTVAL,50);

SELECT mi_secuencia.CURRVAL FROM DUAL;

/*MODIFICAR LAS SECUENCIAS SE CAMBIA EN LA SINTAXIS DE CREACION LA 
PALABRA CREATE POR ALTER, ANTES SE DEBEN DE TENER EN CONSIDERACION 
LO SIGUIENTE:

1. PERMISOS DE ADMINISTRADOR
2. NUMEROS DE SECUENCIAS SOLO SE PUEDEN ALTERAR LOS NUMEROS FUTUROS,
   LOS QUE YA ESTAN SIENDO UTILIZADO EN ALGUNA TABLA POR MEDIO DE UN 
   INSERT O CUALQUIER OTRO MEDIO NO SE VAN A MODIFICAR.
   
SI SE QUIERE REINICIAR LA SECUENCIA EN UN NUMERO DIFERENTE, NO SERA 
SUFICIENTE EL 'ALTER', SE DEBE BORRAR LA SECUENCIA Y VOLVER A GENERARLA,
SE DEBE DE HACER ALGUNA VALIDACION. */

--BORRAR SECUENCIA
DROP SEQUENCE mi_secuencia;

--ESTE OBJETO SOLO SE USA EN ORACLE EN OTROS GESTORES SE REALIZA DE FORMA DIFERENTE.

/* CABE MENCIONAR QUE SI SE QUIERE EMPEZAR LA SECUENCIA EN 1 Y QUE SE 
INCREMENTE DE 1 EN 1, SOLO SE CREA LA SECUENCIA SIN LOS MODIFICADORES,
YA QUE SON OPCIONALES. */

--41 - Esquemas

CREATE USER miusuario IDENTIFIED BY password;
/*EVIDENTEMENTE VA A DAR ERROR EN LA CONEXION HR, HAY QUE CAMBIAR 
DE CONEXION A SYSTEM*/

CREATE USER miusuario IDENTIFIED BY password;

GRANT CREATE SESSION TO miusuario;
GRANT CREATE TABLE TO miusuario;
GRANT CREATE VIEW TO miusuario;
GRANT CREATE ANY TRIGGER TO miusuario;
GRANT CREATE ANY PROCEDURE TO miusuario;
GRANT CREATE SEQUENCE TO miusuario;
GRANT CREATE SYNONYM TO miusuario;

CREATE TABLE miusuario.prueba (coll NUMBER);

CREATE PUBLIC SYNONYM pr FOR miusuario.prueba;

SELECT * FROM pr;

--42 - Transacciones
COMMIT;

CREATE TABLE prueba(
  col1 NUMBER,
  col2 NUMBER
);

INSERT INTO prueba VALUES (1,1);
INSERT INTO prueba VALUES (2,4);
INSERT INTO prueba VALUES (3,9);
INSERT INTO prueba VALUES (4,16);

DELETE FROM prueba

SELECT * FROM prueba;

COMMIT;

SET TRANSACTION NAME 'actualiza campo1';
UPDATE prueba SET col2=0 WHERE col1=1;

SELECT * FROM prueba;

SAVEPOINT despues_Act_1;
UPDATE prueba SET col2=-1 WHERE col1=2;

SAVEPOINT despues_Act_2;

ROLLBACK TO despues_Act_1;
SELECT * FROM prueba;

UPDATE prueba SET col2=-10 WHERE col1=3;

ROLLBACK;
SELECT * FROM prueba;

INSERT INTO prueba VALUES (5,25);
INSERT INTO prueba VALUES (6,36);

COMMIT; --CONFIRMADO
SELECT * FROM prueba;

DELETE FROM prueba WHERE col1=6;
SELECT * FROM prueba;

--43 - Vistas
--SINTAXIS
/*CREATE VIEW  view_name AS 
SELECT column_name (s)
FROM table_name
WHERE condition
*/

CREATE VIEW empleados_depts AS 
SELECT first_name || ' ' || last_name AS NOMBRE,
       department_name, city
FROM employees NATURAL JOIN departments 
NATURAL JOIN locations;

--ELIMINAR VISTAS
DROP VIEW empleados_depts

--SELECCIONAR VISTA
SELECT * FROM empleados_depts;

SELECT * FROM empleados_depts
WHERE department_name LIKE 'F%';

SELECT COUNT (*),department_name 
FROM empleados_depts
GROUP BY department_name;

--MODIFICAR UNA VISTA
CREATE OR REPLACE VIEW empleados_depts AS 
SELECT first_name || ' ' || last_name AS NOMBRE,
       department_name, city, country_name
FROM employees NATURAL JOIN departments 
NATURAL JOIN countries 
NATURAL JOIN locations;

SELECT * FROM empleados_depts;



