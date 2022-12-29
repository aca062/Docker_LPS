-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lps_trabajo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lps_trabajo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lps_trabajo` DEFAULT CHARACTER SET utf8 ;
USE `lps_trabajo` ;

-- -----------------------------------------------------
-- Table `lps_trabajo`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lps_trabajo`.`profesores` (
  `id_prof` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `usuario_prof` VARCHAR(45) NOT NULL,
  `pass_prof` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_prof`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lps_trabajo`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lps_trabajo`.`alumnos` (
  `id_alum` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `usuario_alum` VARCHAR(45) NOT NULL,
  `pass_alum` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_alum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lps_trabajo`.`profesor_has_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lps_trabajo`.`profesor_has_alumno` (
  `alumnos_id_alum` INT NOT NULL,
  `profesores_id_prof` INT NOT NULL,
  `asignatura` ENUM('Anatomia', 'Genetica', 'Psiquiatria') NOT NULL,
  `parcial_1` INT NOT NULL,
  `parcial_2` INT NOT NULL,
  `final` INT NOT NULL,
  PRIMARY KEY (`alumnos_id_alum`, `profesores_id_prof`),
  CONSTRAINT `fk_alumnos_has_profesores_alumnos`
    FOREIGN KEY (`alumnos_id_alum`)
    REFERENCES `lps_trabajo`.`alumnos` (`id_alum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_has_profesores_profesores1`
    FOREIGN KEY (`profesores_id_prof`)
    REFERENCES `lps_trabajo`.`profesores` (`id_prof`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_alumnos_has_profesores_profesores1_idx` ON `lps_trabajo`.`profesor_has_alumno` (`profesores_id_prof` ASC);

CREATE INDEX `fk_alumnos_has_profesores_alumnos_idx` ON `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `lps_trabajo`.`profesores`
-- -----------------------------------------------------
START TRANSACTION;
USE `lps_trabajo`;
INSERT INTO `lps_trabajo`.`profesores` (`id_prof`, `nombre`, `usuario_prof`, `pass_prof`) VALUES (1, 'Pedro', 'pedro_umu', 'pe_pass_dro');
INSERT INTO `lps_trabajo`.`profesores` (`id_prof`, `nombre`, `usuario_prof`, `pass_prof`) VALUES (2, 'Ana', 'ana_umu', 'ana@1234');
INSERT INTO `lps_trabajo`.`profesores` (`id_prof`, `nombre`, `usuario_prof`, `pass_prof`) VALUES (3, 'Juan', 'juan_umu', '12345');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lps_trabajo`.`alumnos`
-- -----------------------------------------------------
START TRANSACTION;
USE `lps_trabajo`;
INSERT INTO `lps_trabajo`.`alumnos` (`id_alum`, `nombre`, `usuario_alum`, `pass_alum`) VALUES (1, 'Miguel', 'miguel_alum_umu', 'migueel12');
INSERT INTO `lps_trabajo`.`alumnos` (`id_alum`, `nombre`, `usuario_alum`, `pass_alum`) VALUES (2, 'Francisco', 'fco_alum_umu', 'ffccoo1234');
INSERT INTO `lps_trabajo`.`alumnos` (`id_alum`, `nombre`, `usuario_alum`, `pass_alum`) VALUES (3, 'Irene', 'irene_alum_umu', 'ir_en_e_1');
INSERT INTO `lps_trabajo`.`alumnos` (`id_alum`, `nombre`, `usuario_alum`, `pass_alum`) VALUES (4, 'Luisa', 'luisa_alum_umu', 'asiul_23');
INSERT INTO `lps_trabajo`.`alumnos` (`id_alum`, `nombre`, `usuario_alum`, `pass_alum`) VALUES (5, 'Maria', 'maria_alum_umu', 'm.a.r.i.123');

COMMIT;


-- -----------------------------------------------------
-- Data for table `lps_trabajo`.`profesor_has_alumno`
-- -----------------------------------------------------
START TRANSACTION;
USE `lps_trabajo`;
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (1, 1, 'Anatomia', 2, 3, 3);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (2, 1, 'Anatomia', 3, 6, 5);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (3, 1, 'Anatomia', 7, 8, 8);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (4, 1, 'Anatomia', 5, 6, 6);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (5, 1, 'Anatomia', 6, 6, 6);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (1, 2, 'Genetica', 5, 7, 6);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (2, 2, 'Genetica', 7, 6, 7);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (3, 2, 'Genetica', 9, 8, 9);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (4, 2, 'Genetica', 4, 6, 5);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (5, 2, 'Genetica', 6, 10, 8);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (1, 3, 'Psiquiatria', 3, 6, 5);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (2, 3, 'Psiquiatria', 8, 5, 6);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (3, 3, 'Psiquiatria', 10, 9, 10);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (4, 3, 'Psiquiatria', 4, 6, 5);
INSERT INTO `lps_trabajo`.`profesor_has_alumno` (`alumnos_id_alum`, `profesores_id_prof`, `asignatura`, `parcial_1`, `parcial_2`, `final`) VALUES (5, 3, 'Psiquiatria', 7, 7, 7);

COMMIT;

