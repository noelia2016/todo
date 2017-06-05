/*************************** ESTRUCTURA DE TABLAS ************************************/
### Tabla tarea
id_tarea
nombre
inicio (fecha de inicio de la tarea)
estimacion (tiempo en horas que tarda en hacerlo)
consumo
fin (fecha de finalizada la tarea)
estado (pendiente, en curso y finalizada)

### consignas
id
detalle
fecha_realizado
estado (pendiente, hecho)
id_tarea
### Tabla usuario
id_usuario

### Tabla comentario
id_comentario
detalle
id_tarea     // en que tarea se realizo el comentario 
id_usuario   // y que usuario de todos los que pueden hacer la tarea realizo un comentario en la misma

### Tabla usuario
id_usuario
nombre
apellido

### Tabla tarea_users
id_tarea_users
id_tarea
id_usuario

/************************** FIN DE ESTRUCTURA DE TABLAS ******************************/

/*************************** SENTENCIAS DE LA CREACION DE LAS TABLAS *******************************************/

// primero creo la base de datos
create database `proyecto_noelia`;

// creo las tablas
CREATE TABLE `tarea` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `inicio` datetime NOT NULL,
  `estimacion` float(8,2) DEFAULT '0.00',
  `consumo` float(8,2) DEFAULT '0.00',
  `fin` datetime NOT NULL,
  `estado` varchar(50) NOT NULL,
    PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
    PRIMARY KEY (`id_usuario`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(50) NOT NULL,
  `fecha_realizado` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
    PRIMARY KEY (`id_comentario`),
    FOREIGN KEY (`id_tarea`) references tarea(`id_tarea`) on delete cascade, // de tarea 
    FOREIGN KEY (`id_usuario`) references usuario (`id_usuario`) on delete cascade // de usuario porque multiples usuarios pueden hacer las tareas
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `consignas` (
  `id_consignas` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(50) NOT NULL,
  `fecha_realizado` datetime NOT NULL,
  `estado` varchar(50) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
    PRIMARY KEY (`id_consignas`),
    FOREIGN KEY (`id_tarea`) references tarea (`id_tarea`) on delete cascade,
    FOREIGN KEY (`id_usuario`) references usuario (`id_usuario`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `tarea_users` (
  `id_tuser` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,    // de usuario
  `id_tarea` int(11) NOT NULL  // de tarea
    PRIMARY KEY (`id_tuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*************************** FIN DE SENTENCIAS DE LA CREACION DE LAS TABLAS ************************************/

/*************************** INICIO DE SENTENCIAS PARA ELIMINAR LAS TABLAS *****************************************/

DROP TABLE `tarea`;
DROP TABLE `usuario`;
DROP TABLE `comentarios`;
DROP TABLE `consignas`;
DROP TABLE `tarea_users`;

/*************************** FIN DE SENTENCIAS PARA ELIMINAR LAS TABLAS ************************************/