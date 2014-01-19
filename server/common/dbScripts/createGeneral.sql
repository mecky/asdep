SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `general` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `general` ;

-- -----------------------------------------------------
-- Table `general`.`association`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`association` (
  `idAssociation` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cui` VARCHAR(13) NOT NULL,
  `county` VARCHAR(20) NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  `numberOfApartments` INT UNSIGNED NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idAssociation`),
  UNIQUE INDEX `cui_UNIQUE` (`cui` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `general`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`user` (
  `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(30) NOT NULL,
  `lastName` VARCHAR(30) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `createdDate` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `general`.`userHasAssociation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `general`.`userHasAssociation` (
  `userIdUser` INT UNSIGNED NOT NULL,
  `associationIdAssociation` INT UNSIGNED NOT NULL,
  `roles` INT UNSIGNED NOT NULL COMMENT '1 << 0 - tenant\n1 << 1 - administrator',
  PRIMARY KEY (`userIdUser`, `associationIdAssociation`),
  INDEX `fkUserHasAssociationAssociation1_idx` (`associationIdAssociation` ASC),
  INDEX `fkUserHasAssociationUser_idx` (`userIdUser` ASC),
  CONSTRAINT `fkUserHasAssociationUser`
    FOREIGN KEY (`userIdUser`)
    REFERENCES `general`.`user` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkUserHasAssociationAssociation1`
    FOREIGN KEY (`associationIdAssociation`)
    REFERENCES `general`.`association` (`idAssociation`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `general` ;

-- -----------------------------------------------------
-- procedure addRole
-- -----------------------------------------------------

DELIMITER $$
USE `general`$$
create procedure `addRole`(in idAssociation integer unsigned, in idUser integer unsigned, 
						in role integer unsigned)
begin
declare `oldRole` integer unsigned;
if ((select count(`userIdUser`) from `userHasAssociation` 
where `userIdUser` = idUser and `associationIdAssociation` = idAssociation) = 0)
then 
	insert into `userHasAssociation` (`associationIdAssociation`, `userIdUser`,`roles`) 
	values (idAssociation, idUser, role);
else
	select roles from `userHasAssociation` 
	where `userIdUser` = idUser and `associationIdAssociation` = idAssociation into `oldRole`;
	set `oldRole` = (`oldRole` | role);
	update `userHasAssociation` set `roles`= `oldRole` where 
	`associationIdAssociation` = idAssociation 
	and `userIdUser` = idUser;
end if;
end 
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure removeRole
-- -----------------------------------------------------

DELIMITER $$
USE `general`$$
create procedure `removeRole`(in idAssociation integer unsigned, in idUser integer unsigned, 
                           in role integer unsigned)
begin
declare `oldRole` tinyint;
select roles from `userHasAssociation` 
where `userIdUser` = idUser and `associationIdAssociation` = idAssociation into `oldRole`;
-- verificam daca el are alt rol in asociatie si facem update, in cazul in care nu are alt rol stergem linku userHasAssociation
if ((`oldRole` & (~role)) != 0)
then
    set `oldRole` = `oldRole` & (~role);
    update `userHasAssociation` set `roles`= `oldRole` where 
    `associationIdAssociation` = idAssociation 
    and `userIdUser` = idUser;
else 
    delete from `userHasAssociation` 
    where `associationIdAssociation` = idAssociation and `userIdUser` = idUser;
end if;

end
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
