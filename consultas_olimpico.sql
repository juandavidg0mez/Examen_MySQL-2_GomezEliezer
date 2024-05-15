use Olimpicos;
/*
1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.
*/

SELECT COUNT(E.id_evento_complejo_deportivo) AS Cantidad_eventos,  C.nombre
FROM evento_complejo_deportivo AS E
INNER JOIN complejo_deportivo AS C
ON E.id_evento_complejo_deportivo = C.id_complejo_deportivo
GROUP BY C.nombre;

/*
2. Consulta de Comisarios Asignados a un Evento en Particular.
*/

SELECT C.nombre AS nombre_comisario,  F.nombre AS nombre_evento
FROM comisario AS C
INNER JOIN evento AS F
ON C.id_comisario = F.id_evento
WHERE F.nombre = 'Torneo de Tennis';

/*
3. Consulta de Todos los Eventos en un Rango de Fechas.
*/

SELECT nombre AS Nombre_evento, fecha AS Fecha_2023_TO_2023
FROM evento
WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';

/*
4. Consulta del Número Total de Comisarios Asignados a Eventos.
*/

SELECT COUNT(C.id_comisario) AS Cantidad_Comisarios_asignados
FROM comisario AS C
INNER JOIN evento AS F
ON C.id_comisario = F.id_evento;

/*
5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.
*/

SELECT I.area_complejo as Area_complejo, C.nombre AS Nombre_complejo
FROM info_complejo AS I
INNER JOIN complejo_polideportivo  AS C
ON I.id_complejo = C.id_complejo_polideportivo
WHERE Area_complejo > 60;

/*
6. Consulta de Eventos con Número de Participantes Mayor que la Media.
*/

SELECT  nombre,
        num_participantes AS Participantes_mayor
FROM evento
WHERE num_participantes > (SELECT FORMAT(AVG(num_participantes), 0) FROM evento);


/*
7. Consulta de Equipamiento Necesario para un Evento Específico.
*/


-- los datos estan mal osea no tiene sentido que en el funbol se necesiten raquetal * my bad *



SELECT  E.nombre AS Nombre_Equipamiento,
        E.stock AS Stock,
        V.nombre AS Nombre_Evento
FROM equipamiento AS E
INNER JOIN evento AS V
ON E.id_equipamiento = V.id_evento
WHERE V.nombre = 'Torneo de Futbol';

/*
8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.
*/
SELECT  J.nombre AS Nombre_jefe,
        COUNT(J.id_jefe) AS Total_eventos,
        E.nombre AS Nombre_evento
FROM jefe AS J
INNER JOIN evento AS E
INNER JOIN complejo_deportivo AS C
INNER JOIN evento_complejo_deportivo as EC
ON J.id_jefe = E.id_evento
WHERE  J.nombre = 'Jose Hernandez'
GROUP BY Nombre_jefe ,Nombre_evento;





/*
 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.
*/

SELECT  E.nombre AS Nombre_Polideportivo
FROM complejo_polideportivo AS E
LEFT JOIN evento_complejo_poli AS V
ON E.id_complejo_polideportivo = V.id_evento_complejo
GROUP BY Nombre_Polideportivo;


/*
10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
*/

SELECT  C.nombre AS Nombre_Comisario
FROM comisario AS C
INNER JOIN evento_comisario AS V
ON C.id_comisario = V.id_evento_comisario
GROUP BY Nombre_Comisario;








