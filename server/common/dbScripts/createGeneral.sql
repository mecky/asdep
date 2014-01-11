SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `general` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `general` ;

-- -----------------------------------------------------
-- Table `general`.`association`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`association` (
  `idassociation` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cui` VARCHAR(13) NOT NULL,
  `county` VARCHAR(20) NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  `number_of_apartments` INT UNSIGNED NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idassociation`),
  UNIQUE INDEX `cui_UNIQUE` (`cui` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `general`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`user` (
  `iduser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `created_date` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `general`.`user_has_association`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`user_has_association` (
  `user_iduser` INT UNSIGNED NOT NULL,
  `association_idassociation` INT UNSIGNED NOT NULL,
  `roles` INT UNSIGNED NOT NULL COMMENT '1 << 0 - tenant\n1 << 1 - administrator\n1 << 2 - censor\n1 << 3 - president',
  PRIMARY KEY (`association_idassociation`, `user_iduser`),
  INDEX `fk_user_has_association_association1_idx` (`association_idassociation` ASC),
  INDEX `fk_user_has_association_user_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_association_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `general`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_association_association1`
    FOREIGN KEY (`association_idassociation`)
    REFERENCES `general`.`association` (`idassociation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `general` ;

-- -----------------------------------------------------
-- procedure add_role
-- -----------------------------------------------------

DELIMITER $$
USE `general`$$
create procedure `add_role`(in idassociation integer unsigned, in iduser integer unsigned, 
						in role integer unsigned)
begin
declare `old_role` integer unsigned;
if ((select count(`user_iduser`) from `user_has_association` 
where `user_iduser` = iduser and `association_idassociation` = idassociation) = 0)
then 
	insert into `user_has_association` (`association_idassociation`, `user_iduser`,`roles`) 
	values (idassociation, iduser, role);
else
	select roles from `user_has_association` 
	where `user_iduser` = iduser and `association_idassociation` = idassociation into `old_role`;
	set `old_role` = (`old_role` | role);
	update `user_has_association` set `roles`= `old_role` where 
	`association_idassociation` = idassociation 
	and `user_iduser` = iduser;
end if;
end 
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure remove_role
-- -----------------------------------------------------

DELIMITER $$
USE `general`$$
create procedure `remove_role`(in idassociation integer unsigned, in iduser integer unsigned, 
                           in role integer unsigned)
begin
declare `old_role` tinyint;
select roles from `user_has_association` 
where `user_iduser` = iduser and `association_idassociation` = idassociation into `old_role`;
-- verificam daca el are alt rol in asociatie si facem update, in cazul in care nu are alt rol stergem linku user_has_association
if ((`old_role` & (~role)) != 0)
then
    set `old_role` = `old_role` & (~role);
    update `user_has_association` set `roles`= `old_role` where 
    `association_idassociation` = idassociation 
    and `user_iduser` = iduser;
else 
    delete from `user_has_association` 
    where `association_idassociation` = idassociation and `user_iduser` = iduser;
end if;

end
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
