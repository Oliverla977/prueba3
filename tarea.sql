CREATE DATABASE IF NOT EXISTS `Oliver_2190-19-10041` ;
USE `Oliver_2190-19-10041`;

CREATE TABLE if NOT EXISTS `cliente`(
`nit` INT(11) NOT NULL,
`nombre` VARCHAR(40) DEFAULT NULL,
`apellido` VARCHAR(40) DEFAULT NULL,
`edad` INT(3) DEFAULT NULL,
PRIMARY KEY (`nit`)
)ENGINE=InnoDB DEFAULT CHARSET=LATIN1;

CREATE TABLE if NOT EXISTS `proveedor`(
`id` INT(11) AUTO_INCREMENT,
`nombre` VARCHAR(40) DEFAULT NULL,
`correo` VARCHAR(40) DEFAULT NULL,
`telefono` INT(8) DEFAULT NULL,
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=LATIN1;

CREATE TABLE if NOT EXISTS `producto`(
`id` INT(11) AUTO_INCREMENT,
`descripcion` VARCHAR(40) DEFAULT NULL,
`cantidad` INT(4) DEFAULT NULL,
`precio` INT(5) DEFAULT NULL,
`id_proveedor` INT(3) DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=LATIN1;

CREATE TABLE if NOT EXISTS `venta`(
`id` INT(11) AUTO_INCREMENT,
`nit_cliente` INT(11) DEFAULT NULL,
`fecha_de_venta` DATE DEFAULT NULL,
`total_venta` INT(10) DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `fk_cliente` FOREIGN KEY (`nit_cliente`) REFERENCES `cliente` (`nit`)
)ENGINE=InnoDB DEFAULT CHARSET=LATIN1;

CREATE TABLE if NOT EXISTS `detalle_venta`(
`id` INT(11) AUTO_INCREMENT,
`id_venta` INT(11) DEFAULT NULL,
`id_producto` INT(11) DEFAULT NULL,
`cantidad` INT(5) DEFAULT NULL,
`total` INT(10) DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `fk_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id`),
CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=LATIN1;


INSERT INTO `cliente`(`nit`, `nombre`, `apellido`, `edad`) VALUES
(10657890, 'Juan', 'Perez', 33),
(200654371, 'Estudardo', 'Ramirez', 25),
(200654181, 'Ana', 'Santos', 28),
(200654821, 'Esmeralda', 'Ramirez', 45),
(60067332, 'Luis', 'Hernandez', 40);

INSERT INTO `proveedor`(`nombre`,`correo`,`telefono`) VALUES
('Tennis Center','info@tcenter.com',12345678),
('Mundi Deportes','info@mundideportes.com',987654321),
('Sport City','info@sportcity.com',98761234),
('Soccermania','info@soccermania.com',88771100),
('Sport Mania','info@sportmania.com',66553388);

INSERT INTO `producto`(`descripcion`, `cantidad`, `precio`, `id_proveedor`) VALUES
('raquetas', 500, 50, 1),
('Cuerda para saltar', 100, 75, 2),
('Banda elastica', 300, 100, 3),
('Ligas de resistencia', 100, 125, 4),
('Zapatos', 200, 300, 5);

INSERT INTO `venta`(`nit_cliente`, `fecha_de_venta`) VALUES
(10657890, CURDATE());
INSERT INTO `detalle_venta`(`id_venta`, `id_producto`, `cantidad`, `total`) VALUES
(1, 1, 5, (SELECT precio FROM producto WHERE id=1)*5);
UPDATE venta SET `total_venta`= (SELECT total FROM detalle_venta WHERE id=1) WHERE id=1;

INSERT INTO `venta`(`nit_cliente`, `fecha_de_venta`) VALUES
(200654371, CURDATE());
INSERT INTO `detalle_venta`(`id_venta`, `id_producto`, `cantidad`, `total`) VALUES
(2, 2, 3, (SELECT precio FROM producto WHERE id=2)*3);
UPDATE venta SET `total_venta`= (SELECT total FROM detalle_venta WHERE id=2) WHERE id=2;

INSERT INTO `venta`(`nit_cliente`, `fecha_de_venta`) VALUES
(200654181, CURDATE());
INSERT INTO `detalle_venta`(`id_venta`, `id_producto`, `cantidad`, `total`) VALUES
(3, 3, 56, (SELECT precio FROM producto WHERE id=3)*56);
UPDATE venta SET `total_venta`= (SELECT total FROM detalle_venta WHERE id=3) WHERE id=3;

INSERT INTO `venta`(`nit_cliente`, `fecha_de_venta`) VALUES
(200654821, CURDATE());
INSERT INTO `detalle_venta`(`id_venta`, `id_producto`, `cantidad`, `total`) VALUES
(4, 4, 80, (SELECT precio FROM producto WHERE id=4)*80);
UPDATE venta SET `total_venta`= (SELECT total FROM detalle_venta WHERE id=4) WHERE id=4;

INSERT INTO `venta`(`nit_cliente`, `fecha_de_venta`) VALUES
(60067332, CURDATE());
INSERT INTO `detalle_venta`(`id_venta`, `id_producto`, `cantidad`, `total`) VALUES
(5, 5, 100, (SELECT precio FROM producto WHERE id=5)*100);
UPDATE venta SET `total_venta`= (SELECT total FROM detalle_venta WHERE id=5) WHERE id=5;
