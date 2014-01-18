SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartment` (
  `idApartment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(4) NOT NULL,
  `linkPassword` VARCHAR(10) NOT NULL,
  `tenantName` VARCHAR(40) NOT NULL,
  `presentPersons` INT UNSIGNED NOT NULL,
  `surface` FLOAT(5,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`idApartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `month`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `month` (
  `idMonth` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `month` ENUM('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`idMonth`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meter` (
  `idMeter` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `location` ENUM('KITCHEN', 'BATHROOM', 'SECONDARY_BATHROOM', 'GARAGE') NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `type` ENUM('COLD_WATER','HOT_WATER') NOT NULL,
  `series` VARCHAR(20) NULL,
  `apartmentIdApartment` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMeter`),
  INDEX `fkMeterApartment1_idx` (`apartmentIdApartment` ASC),
  CONSTRAINT `fkMeterApartment1`
    FOREIGN KEY (`apartmentIdApartment`)
    REFERENCES `apartment` (`idApartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meterIndex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meterIndex` (
  `meterIdMeter` INT UNSIGNED NOT NULL,
  `monthIdMonth` INT UNSIGNED NOT NULL,
  `consumption` FLOAT(6,2) NOT NULL DEFAULT 0,
  `index` FLOAT(9,2) NOT NULL DEFAULT 0,
  `state` ENUM('NO_VALUE_INTRODUCED', 'ONLINE_USER_REPORT', 'ADMINISTRATOR_DEFAULT_VALUE', 'RECEIVED_FROM_USER','CONFIRMENT','READ_BY_ADMINISTRATOR') NOT NULL DEFAULT 'NO_VALUE_INTRODUCED',
  PRIMARY KEY (`meterIdMeter`, `monthIdMonth`),
  INDEX `fkMeterHasMonthMonth1_idx` (`monthIdMonth` ASC),
  INDEX `fkMeterHasMonthMeter1_idx` (`meterIdMeter` ASC),
  CONSTRAINT `fkMeterHasMonthMeter1`
    FOREIGN KEY (`meterIdMeter`)
    REFERENCES `meter` (`idMeter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkMeterHasMonthMonth1`
    FOREIGN KEY (`monthIdMonth`)
    REFERENCES `month` (`idMonth`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartmentsGroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartmentsGroup` (
  `idApartmentsGroup` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `predefinedType` ENUM('ENTRANCE' , 'BLOCK') NULL,
  `type` ENUM('GROUP' , 'GROUP_OF_GROUPS') NOT NULL,
  PRIMARY KEY (`idApartmentsGroup`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartmentsGroupHasApartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartmentsGroupHasApartment` (
  `apartmentsGroupIdApartmentsGroup` INT UNSIGNED NOT NULL,
  `apartmentIdApartment` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`apartmentsGroupIdApartmentsGroup`, `apartmentIdApartment`),
  INDEX `fkApartmentsGroupHasApartmentApartment1_idx` (`apartmentIdApartment` ASC),
  INDEX `fkApartmentsGroupHasApartmentApartmentsGroup1_idx` (`apartmentsGroupIdApartmentsGroup` ASC),
  CONSTRAINT `fkApartmentsGroupHasApartmentApartmentsGroup1`
    FOREIGN KEY (`apartmentsGroupIdApartmentsGroup`)
    REFERENCES `apartmentsGroup` (`idApartmentsGroup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkApartmentsGroupHasApartmentApartment1`
    FOREIGN KEY (`apartmentIdApartment`)
    REFERENCES `apartment` (`idApartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartmentsGroupHasApartmentsGroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartmentsGroupHasApartmentsGroup` (
  `idGroup` INT UNSIGNED NOT NULL,
  `idGroupOfGroups` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idGroup`, `idGroupOfGroups`),
  INDEX `fkApartmentsGroupHasApartmentsGroupApartmentsGroup2_idx` (`idGroupOfGroups` ASC),
  INDEX `fkApartmentsGroupHasApartmentsGroupApartmentsGroup1_idx` (`idGroup` ASC),
  CONSTRAINT `fkApartmentsGroupHasApartmentsGroupApartmentsGroup1`
    FOREIGN KEY (`idGroup`)
    REFERENCES `apartmentsGroup` (`idApartmentsGroup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkApartmentsGroupHasApartmentsGroupApartmentsGroup2`
    FOREIGN KEY (`idGroupOfGroups`)
    REFERENCES `apartmentsGroup` (`idApartmentsGroup`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `userHasApartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userHasApartment` (
  `userIdUser` INT UNSIGNED NOT NULL,
  `apartmentIdApartment` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`userIdUser`, `apartmentIdApartment`),
  INDEX `fkUserHasApartmentApartment1_idx` (`apartmentIdApartment` ASC),
  INDEX `fkUserHasApartmentUser1_idx` (`userIdUser` ASC),
  CONSTRAINT `fkUserHasApartmentUser1`
    FOREIGN KEY (`userIdUser`)
    REFERENCES `general`.`user` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkUserHasApartmentApartment1`
    FOREIGN KEY (`apartmentIdApartment`)
    REFERENCES `apartment` (`idApartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

DELIMITER $$
CREATE TRIGGER `apartment_BINS` BEFORE INSERT ON `apartment` FOR EACH ROW
begin
set new.`linkPassword` = substring(md5(rand()) from 1 for 10);
end$$

CREATE TRIGGER `month_AINS` AFTER INSERT ON `month` FOR EACH ROW
begin
declare `mon` integer unsigned;
select max(`monthidMonth`) from `meterIndex` into `mon`;

if (`mon` != 0)
then
	insert into `meterIndex` (`index`, `consumption`, `meterIdMeter`, `monthIdMonth`)
		select `index`, 0, `meterIdMeter`, new.`idMonth`
		from `meterIndex`
		where `monthIdMonth` = `mon`;
end if;
end$$

CREATE TRIGGER `meter_AINS` AFTER INSERT ON `meter` FOR EACH ROW
begin
if (new.`active` = 1)
then
    insert into `meterIndex` (`meterIdMeter`, `monthIdMonth`) 
    values (new.`idMeter`, (select max(`idMonth`) from `month`));
end if;
end$$

CREATE TRIGGER `meter_BUPD` BEFORE UPDATE ON `meter` FOR EACH ROW
BEGIN
if ( new.`active` != old.`active` and new.`active` = 0)
then
    delete from `meterIndex` 
    where `meterIdMeter`=new.`idMeter` and `monthIdMonth`= (select max(`idMonth`) from `month`);
else
    if ( new.`active` != old.`active`)
    then
        insert into `meterIndex` (`meterIdMeter`, `monthIdMonth`) 
        values (new.`idMeter`, (select max(`idMonth`) from `month`));
    end if;
end if;

end$$

CREATE TRIGGER `meterIndex_BUPD` BEFORE UPDATE ON `meterIndex` FOR EACH ROW
begin

if (old.`index` != 0)
then
	if (new.`consumption` = old.`consumption`)
	then
		set new.`consumption` = old.`consumption` + new.`index` - old.`index`;
	end if;
end if;

end$$

CREATE TRIGGER `userHasApartment_ADEL` AFTER DELETE ON `userHasApartment` 
FOR EACH ROW
begin
declare `idAssociation` integer unsigned; 
-- check if user has other apartments in this association
-- if not delete the entity else do nothing
if ((select count(`userIdUser`) from userHasApartment where `userIdUser` = old.`userIdUser`) = 0)
then 
    select substring((select database()),12) into `idAssociation`;
    call general.`removeRole`(idAssociation, old.`userIdUser`, 1);
end if; 
-- generate new password for the apartment
update `apartment` set `linkPassword` = (substring(md5(rand()) from 1 for 10)) where `idApartment`= old.`apartmentIdApartment`;

end$$

CREATE TRIGGER `userHasApartment_AINS` AFTER INSERT ON `userHasApartment` 
FOR EACH ROW
begin
declare `idAssociation` integer unsigned;  
select substring((select database()), 12) into `idAssociation`;
call general.`addRole`(idAssociation, new.userIdUser, 1);
end$$


DELIMITER ;
