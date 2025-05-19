/* --------------------------------------------------    Examen Parcial - SQL  ------------------------------------------------------*/
/* ----------------------------------------------------------------------------------------------------------------------------------*/
select * from Experimental

/* Descripción general de la base de datos*/
SELECT COUNT(*)  from Experimental e where e."treat" = 0 /* 260 de control */

SELECT COUNT(*)  from Experimental e where e."treat" = 1 /* 185 de tratamiento */

/* Descripción general de la variables cuantitativas*/
SELECT avg(e."age"), avg(e."edu"), avg(re74), avg(re75), avg(re78) from Experimental e

/* Descripción general de la variables cualitativas*/
SELECT e."black", count(*) as Cant_Personas from Experimental e
group by e."black"

SELECT e."hisp", count(*) as Cant_Personas from Experimental e
group by e."hisp"

SELECT e."marr", count(*) as Cant_Personas from Experimental e
group by e."marr"

SELECT e."nodegree", count(*) as Cant_Personas from Experimental e
group by e."nodegree"

SELECT e."black", count(e."black") as Cant_personas, avg(e."age") as Edad_prom, avg(e."edu") as Educ_prom, 
avg(e."re74") as Salario74_prom, avg(e."re75") as Salario75_prom, avg(e."re78") as Salario78_prom
from Experimental e 
group by e."black"

SELECT e."hisp", count(e."hisp"), avg(e."age"), avg(e."edu"), avg(e."re74"), avg(e."re75"), avg(e."re78") 
from Experimental e 
group by e."hisp"

SELECT e."marr", count(e."marr"), avg(e."age"), avg(e."edu"), avg(e."re74"), avg(e."re75"), avg(e."re78") 
from Experimental e
group by e."marr"

SELECT e."nodegree", count(e."nodegree"), avg(e."age"), avg(e."edu"), avg(e."re74"), avg(e."re75"), avg(e."re78") 
from Experimental e
group by e."nodegree"

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Descripción general de la variables por grupo de tratamiento y control*/
SELECT e."treat", avg(e."age"), avg(e."edu"), avg(re74), avg(re75), avg(re78) from Experimental e
group by e."treat"

/* Variables cualitativas*/
SELECT e."treat", e."black", count(*) as Cant_Personas from Experimental e
group by e."treat", e."black"

SELECT e."treat", e."hisp", count(*) as Cant_Personas from Experimental e
group by e."treat", e."hisp"

SELECT e."treat", e."marr", count(*) as Cant_Personas from Experimental e
group by e."treat", e."marr"

SELECT e."treat", e."nodegree", count(*) as Cant_Personas from Experimental e
group by e."treat", e."nodegree"

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Algo importante a analizar son los resultados después del programa */

/* Personas sin ingresos en 1974 y 1975 y sus ingresos luego del programa (grupo 1)*/
SELECT e."treat", avg(e."re78"), avg(e."age"), avg(e."edu")  from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" > 0
group by e."treat"

/* Personas sin ingresos en 1975 y sus ingresos luego del programa (grupo 2) */
SELECT e."treat", avg(e."re78"), avg(e."age"), avg(e."edu")  from Experimental e 
where e."re74" = 0 and e."re75" > 0 and e."re78" > 0
group by e."treat"

/* Personas con ingresos en 1974 y 1975 y sus ingresos luego del programa (grupo 3)*/
SELECT e."treat", avg(e."re78"), avg(e."age"), avg(e."edu")  from Experimental e 
where e."re74" > 0 and e."re75" > 0 and e."re78" > 0
group by e."treat"

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Analizando el grupo 1*/
SELECT e."treat", e."black", count(e."black"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" > 0
group by e."treat", e."black"
order by Salario78 desc

SELECT e."treat", e."hisp", count(e."hisp"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" > 0
group by e."treat", e."hisp"
order by Salario78 desc

SELECT e."treat", e."marr", count(e."marr"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" > 0
group by e."treat", e."marr"
order by Salario78 desc

SELECT e."treat", e."nodegree", count(e."nodegree"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" > 0
group by e."treat", e."nodegree"
order by Salario78 desc
/* ----------------------------------------------------------------------------------------------------------------------------------*/

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Analizando el grupo 2*/
SELECT e."treat", e."black", count(e."black"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."black"
order by Salario78 desc

SELECT e."treat", e."hisp", count(e."hisp"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."hisp"
order by Salario78 desc

SELECT e."treat", e."marr", count(e."marr"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."marr"
order by Salario78 desc

SELECT e."treat", e."nodegree", count(e."nodegree"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" = 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."nodegree"
order by Salario78 desc
/* ----------------------------------------------------------------------------------------------------------------------------------*/

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Analizando el grupo 3*/
SELECT e."treat", e."black", count(e."black"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" > 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."black"
order by Salario78 desc

SELECT e."treat", e."hisp", count(e."hisp"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" > 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."hisp"
order by Salario78 desc

SELECT e."treat", e."marr", count(e."marr"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" > 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."marr"
order by Salario78 desc

SELECT e."treat", e."nodegree", count(e."nodegree"), avg(e."age"), avg(e."edu"), avg(e."re78") as Salario78
from Experimental e 
where e."re74" > 0 and e."re75" > 0 and e."re78" > 0
group by e."treat", e."nodegree"
order by Salario78 desc
/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Finalmente podemos revisar aquellos que no tuvieron éxito para 1978*/
SELECT t."treat", t."black", count(t."black"), avg(t."age"), avg(t."edu") from
(SELECT * from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" = 0) as t
group by t."treat", t."black"

SELECT t."treat", t."hisp", count(t."hisp"), avg(t."age"), avg(t."edu") from
(SELECT * from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" = 0) as t
group by t."treat", t."hisp"

SELECT t."treat", t."marr", count(t."marr"), avg(t."age"), avg(t."edu") from
(SELECT * from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" = 0) as t
group by t."treat", t."marr"

SELECT t."treat", t."nodegree", count(t."nodegree"), avg(t."age"), avg(t."edu") from
(SELECT * from Experimental e 
where e."re74" = 0 and e."re75" = 0 and e."re78" = 0) as t
group by t."treat", t."nodegree"

/* ----------------------------------------------------------------------------------------------------------------------------------*/
/* Posteriormente, con los resultados de la estimación, se procederá a realizar otros análisis*/
