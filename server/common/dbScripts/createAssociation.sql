SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartment` (
  `idapartment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(4) NOT NULL,
  `link_password` VARCHAR(10) NOT NULL,
  `tenant_name` VARCHAR(40) NOT NULL,
  `prezent_persons` INT UNSIGNED NOT NULL,
  `surface` FLOAT(5,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`idapartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_has_apartment` (
  `user_iduser` INT UNSIGNED NOT NULL,
  `apartment_idapartment` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_iduser`, `apartment_idapartment`),
  INDEX `fk_user_has_apartment_apartment1_idx` (`apartment_idapartment` ASC),
  INDEX `fk_user_has_apartment_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_apartment_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `general`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_apartment_apartment1`
    FOREIGN KEY (`apartment_idapartment`)
    REFERENCES `apartment` (`idapartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `month`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `month` (
  `idmonth` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `month` ENUM('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`idmonth`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meter` (
  `idmeter` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `location` ENUM('KITCHEN', 'BATHROOM', 'SECONDARY_BATHROOM', 'GARAGE') NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `type` ENUM('COLD_WATER','HOT_WATER') NOT NULL,
  `series` VARCHAR(20) NULL,
  `apartment_idapartment` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idmeter`),
  INDEX `fk_meter_apartment1_idx` (`apartment_idapartment` ASC),
  CONSTRAINT `fk_meter_apartment1`
    FOREIGN KEY (`apartment_idapartment`)
    REFERENCES `apartment` (`idapartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meter_index`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `meter_index` (
  `meter_idmeter` INT UNSIGNED NOT NULL,
  `month_idmonth` INT UNSIGNED NOT NULL,
  `consumption` FLOAT(6,2) NOT NULL DEFAULT 0,
  `index` FLOAT(9,2) NOT NULL DEFAULT 0,
  `state` ENUM('NO_VALUE_INTRODUCED', 'ONLINE_USER_REPORT', 'ADMINISTRATOR_DEFAULT_VALUE', 'RECEIVED_FROM_USER','CONFIRMENT','READ_BY_ADMINISTRATOR') NOT NULL DEFAULT 'NO_VALUE_INTRODUCED',
  PRIMARY KEY (`meter_idmeter`, `month_idmonth`),
  INDEX `fk_meter_has_month_month1_idx` (`month_idmonth` ASC),
  INDEX `fk_meter_has_month_meter1_idx` (`meter_idmeter` ASC),
  CONSTRAINT `fk_meter_has_month_meter1`
    FOREIGN KEY (`meter_idmeter`)
    REFERENCES `meter` (`idmeter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meter_has_month_month1`
    FOREIGN KEY (`month_idmonth`)
    REFERENCES `month` (`idmonth`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartments_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartments_group` (
  `idapartments_group` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `predefined_type` ENUM('ENTRANCE' , 'BLOCK') NULL,
  `type` ENUM('GROUP' , 'GROUP_OF_GROUPS') NOT NULL,
  PRIMARY KEY (`idapartments_group`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartments_group_has_apartments_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartments_group_has_apartments_group` (
  `apartments_group_idapartments_group` INT UNSIGNED NOT NULL,
  `apartments_group_idapartments_group1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`),
  INDEX `fk_apartments_group_has_apartments_group_apartments_group2_idx` (`apartments_group_idapartments_group1` ASC),
  INDEX `fk_apartments_group_has_apartments_group_apartments_group1_idx` (`apartments_group_idapartments_group` ASC),
  CONSTRAINT `fk_apartments_group_has_apartments_group_apartments_group1`
    FOREIGN KEY (`apartments_group_idapartments_group`)
    REFERENCES `apartments_group` (`idapartments_group`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_apartments_group_has_apartments_group_apartments_group2`
    FOREIGN KEY (`apartments_group_idapartments_group1`)
    REFERENCES `apartments_group` (`idapartments_group`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apartment_has_apartments_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apartment_has_apartments_group` (
  `apartment_idapartment` INT UNSIGNED NOT NULL,
  `apartments_group_idapartments_group` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`apartment_idapartment`, `apartments_group_idapartments_group`),
  INDEX `fk_apartment_has_apartments_group_apartments_group1_idx` (`apartments_group_idapartments_group` ASC),
  INDEX `fk_apartment_has_apartments_group_apartment1_idx` (`apartment_idapartment` ASC),
  CONSTRAINT `fk_apartment_has_apartments_group_apartment1`
    FOREIGN KEY (`apartment_idapartment`)
    REFERENCES `apartment` (`idapartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_apartment_has_apartments_group_apartments_group1`
    FOREIGN KEY (`apartments_group_idapartments_group`)
    REFERENCES `apartments_group` (`idapartments_group`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

DELIMITER $$
CREATE TRIGGER `apartment_BINS` BEFORE INSERT ON `apartment` FOR EACH ROW
begin
set new.`link_password` = substring(md5(rand()) from 1 for 10);
end$$

CREATE TRIGGER `user_has_apartment_ADEL` 
AFTER DELETE ON `user_has_apartment` 
FOR EACH ROW
begin
declare `idassociation` integer unsigned; 
-- check if user has other apartments in this association
-- if not delete the entity else do nothing
if ((select count(`user_iduser`) from user_has_apartment where `user_iduser` = old.`user_iduser`) = 0)
then 
    select substring((select database()),12) into `idassociation`;
    call general.`remove_role`(idassociation, old.`user_iduser`, 1);
end if; 
-- generate new password for the apartment
update `apartment` set `link_password` = (substring(md5(rand()) from 1 for 10)) where `idapartment`= old.`apartment_idapartment`;

end$$

CREATE TRIGGER `user_has_apartment_AINS` AFTER INSERT ON `user_has_apartment` FOR EACH ROW
begin
declare `idassociation` integer unsigned;  
select substring((select database()), 12) into `idassociation`;
call general.`add_role`(idassociation, new.user_iduser, 1);
end$$

CREATE TRIGGER `month_AINS` AFTER INSERT ON `month` FOR EACH ROW
begin
declare `mon` integer unsigned;
select max(`month_idmonth`) from `meter_index` into `mon`;

if (`mon` != 0)
then
	insert into `meter_index` (`index`, `consumption`, `meter_idmeter`, `month_idmonth`)
		select `index`, 0, `meter_idmeter`, new.`idmonth`
		from `meter_index`
		where `month_idmonth` = `mon`;
end if;
end$$

CREATE TRIGGER `meter_AINS` AFTER INSERT ON `meter` FOR EACH ROW
begin
if (new.`active` = 1)
then
    insert into `meter_index` (`meter_idmeter`, `month_idmonth`) 
    values (new.`idmeter`, (select max(`idmonth`) from `month`));
end if;
end$$

CREATE TRIGGER `meter_BUPD` BEFORE UPDATE ON `meter` FOR EACH ROW
BEGIN
if ( new.`active` != old.`active` and new.`active` = 0)
then
    delete from `meter-index` 
    where `meter_idmeter`=new.`idmeter` and `month_idmonth`= (select max(`idmonth`) from `month`);
else
    if ( new.`active` != old.`active`)
    then
        insert into `meter_index` (`meter_idmeter`, `month_idmonth`) 
        values (new.`idmeter`, (select max(`idmonth`) from `month`));
    end if;
end if;

end$$

CREATE TRIGGER `meter_index_BUPD` BEFORE UPDATE ON `meter_index` FOR EACH ROW
begin

if (old.`index` != 0)
then
	if (new.`consumption` = old.`consumption`)
	then
		set new.`consumption` = old.`consumption` + new.`index` - old.`index`;
	end if;
end if;

end$$


DELIMITER ;
