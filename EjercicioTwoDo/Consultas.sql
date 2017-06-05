/*************************** INICIO DE CONSULTAS ************************************/

1. Contar la cantidad de tareas pendientes totales

    SELECT count(*)
    FROM `tarea`
    WHERE `estado` = 'pendiente';
    
2. Contar la cantidad de tareas completadas totalmente.

    SELECT coutn(*)
    FROM `tarea`
    WHERE `estado` = 'finalizada';
    
3. Retornar todos los comentarios del usuario U

    SELECT `c`.`detalle`
    FROM `comentario` as c left inner join `usuario` as `u` on `c`.`id_usuario` = `u`.`id`
    WHERE `u`.`nombre` = 'U';
    
4. Contar la cantidad de checklist de la tarea T.

    SELECT COUNT(*)
    FROM `checklist` as c left inner join `tarea` as `t` on `c`.`id_tarea` = `t`.`id`
    WHERE `t`.`nombre` = 'T';
    
5. Retornar todos los comentarios ordenados del usuario U

    SELECT `c`.`detalle`
    FROM `comentario` as c left inner join `usuario` as `u` on `c`.`id_usuario` = `u`.`id`
    WHERE `u`.`nombre` = 'U';
    order by `c`.`detalle` asc
    
6. Retornar todos los comentarios en forma invertida del usuario U.

     SELECT `c`.`detalle`
    FROM `comentario` as c left inner join `usuario` as `u` on `c`.`id_usuario` = `u`.`id`
    WHERE `u`.`nombre` = 'U';
    order by `c`.`detalle` des
    
7. Retornar todos los comentarios que hayan sido ingresados por el usuario Z.

    SELECT `c`.`detalle`
    FROM `comentario` as c left inner join `usuario` as `u` on `c`.`id_usuario` = `u`.`id`
    WHERE `u`.`nombre` = 'Z';
    order by `c`.`detalle` asc

8. Retornar todas las tareas del usuario Z
    
    SELECT `c`.`detalle`
    FROM `tarea` as t left inner join `usuario` as `u` on `t`.`id_usuario` = `u`.`id`
    WHERE `u`.`nombre` = 'Z';
    order by `c`.`detalle` asc

9. Retornar la fecha del primer comentario.
    
    SELECT min(`comentario`.`fecha_realizado`)
    FROM `comentario` 

10. Retornar la fecha del primer comentario realizado en la tarea T.
    
    SELECT min(`comentario`.`fecha_realizado`)
    FROM `comentario` as c left inner join `tarea` as `t` on `c`.`id_usuario` = `t`.`id_usuario`
    WHERE `t`.`nombre` = 'T';
    order by `c`.`detalle` asc
    
11. Retornar la lista de tareas en las cuales el usuario U realizo un comentario.

    SELECT `comentario`.`id_tarea`
    FROM `comentario` as `c` left inner join `usuario` on `c`.`id_usuario` = `u`.`id_usuario`
    WHERE `u`.`nombre` = 'U'
    ORDER BY `tarea`.`nombre` ASC 
    
/*************************** FIN DE CONSULTAS ************************************/