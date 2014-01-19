-- For creating the database you have to sync the model from the drive and populate the tables
-- the population can be made with the script bellow or manually depending on the mood and desire!
-- NOTE: for each association added there need to be created a schema synced with association generic
-- the name of the schema need to have following format - association`id` ex: association1
-- drop schema if exists `association1`;
-- drop schema if exists `association2`;
-- CREATE SCHEMA `association1` ;
-- CREATE SCHEMA `association2` ;
-- NOTE: remember to sync the two schemas with the err before going further
-- this is done from diagram view in workbench -> database -> sync model -> next next.. -> overwrite the associationgeneric with the association you want to sync

-- Populate asociatie
-- use the association you want to populate
-- use association1;


-- creating blocks
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Bloc1', '2', '2');
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Bloc2', '2', '2');


-- creating entrances
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `apartmentsGroupHasApartmentsGroup` (`idGroup`, `idGroupOfGroups`) VALUES ('1', '3');
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `apartmentsGroupHasApartmentsGroup` (`idGroup`, `idGroupOfGroups`) VALUES ('1', '4');
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Scara3', '1', '1');
INSERT INTO `apartmentsGroupHasApartmentsGroup` (`idGroup`, `idGroupOfGroups`) VALUES ('1', '5');
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `apartmentsGroupHasApartmentsGroup` (`idGroup`, `idGroupOfGroups`) VALUES ('2', '6');
INSERT INTO `apartmentsGroup` (`name`, `predefinedType`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `apartmentsGroupHasApartmentsGroup` (`idGroup`, `idGroupOfGroups`) VALUES ('2', '7');

-- adding apartments on entrances

-- scara 1 bloc 1
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('1', '', 'tenant1', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('1', '3');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('2', '', 'tenant2', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('2', '3');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('3', '', 'tenant3', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('3', '3');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('4', '', 'tenant4', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('4', '3');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('5', '', 'tenant5', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('5', '3');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('6', '', 'tenant6', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('6', '3');

-- scara 2 bloc 1
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('7', '', 'tenant7', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('7', '4');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('8', '', 'tenant8', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('8', '4');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('9', '', 'tenant9', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('9', '4');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('10', '', 'tenant10', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('10', '4');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('1', '', 'tenant11', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('11', '4');

-- scara 3 bloc 1
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('1', '', 'tenant12', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('12', '5');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('2', '', 'tenant13', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('13', '5');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('3', '', 'tenant14', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('14', '5');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('4', '', 'tenant15', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('15', '5');

-- scara 1 bloc 2
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('5', '', 'tenant16', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('16', '6');
INSERT INTO `apartment` (`number`, `linkPassword`, `tenantName`, `presentPersons`, `surface`) VALUES ('6', '', 'tenant17', '1', '1');
INSERT INTO `apartmentsGroupHasApartment` (`apartmentIdApartment`, `apartmentsGroupIdApartmentsGroup`) VALUES ('17', '6');


-- ading roles on apartments
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('1', '1');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('1', '2');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('1', '3');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('2', '1');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('2', '2');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('2', '5');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('2', '7');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('3', '1');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('3', '8');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('3', '9');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('3', '10');
INSERT INTO `userHasApartment` (`userIdUser`, `apartmentIdApartment`) VALUES ('4', '6');

-- adding month
INSERT INTO `month` (`month`, `year`) VALUES ('1', 2014);

-- adding metters
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '1');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '1');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '1');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '1');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '2');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '2');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '2');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '2');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '1', '', '3');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '2', '', '3');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '1', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '2', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '4');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '1', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '2', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '5');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '6');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '6');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '1', '', '7');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '2', '', '8');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '9');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '10');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '10');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '11');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '11');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '2', '', '12');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('1', '1', '1', '', '12');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '2', '', '12');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('2', '1', '1', '', '12');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '2', '', '13');
INSERT INTO `meter` (`location`, `active`, `type`, `series`, `apartmentIdApartment`) VALUES ('3', '1', '1', '', '13');