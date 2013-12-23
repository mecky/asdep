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

-- Populate general schema

-- creating users
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user1', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user2', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user3', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user4', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user5', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user6', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user7', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user8', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user9', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');
INSERT INTO `general`.`user` (`username`, `password`, `created_date`, `name`, `email`, `phone_number`) VALUES ('user10', 'password1', '10-20-2011', 'nume1', 'mail1@yahoo.com', '0722123212');


-- creating associations
INSERT INTO `general`.`association` (`name`, `cui`, `county`, `city`, `number_of_apartments`, `address`) VALUES ('Asociatia Nr 1', '121231232123', 'Hunedoara', 'Deva', '120', 'no address');
INSERT INTO `general`.`association` (`name`, `cui`, `county`, `city`, `number_of_apartments`, `address`) VALUES ('Asociatia Nr 2', '121231232124', 'Timis', 'Timisoara', '120', 'no address');



-- adding administrator roles
INSERT INTO `general`.`user_has_association` (`user_iduser`, `association_idassociation`, `roles`) VALUES ('1', '1', '2');
INSERT INTO `general`.`user_has_association` (`user_iduser`, `association_idassociation`, `roles`) VALUES ('1', '2', '2');
INSERT INTO `general`.`user_has_association` (`user_iduser`, `association_idassociation`, `roles`) VALUES ('2', '1', '2');
INSERT INTO `general`.`user_has_association` (`user_iduser`, `association_idassociation`) VALUES ('3', '2');




-- Populate asociatie
-- use the association you want to populate
use association1;


-- creating blocks
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Bloc1', '2', '2');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Bloc2', '2', '2');


-- creating entrances
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '3');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '4');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara3', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '5');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('2', '6');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('2', '7');

-- adding apartments on entrances

-- scara 1 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant1', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('1', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('2', '', 'tenant2', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('2', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('3', '', 'tenant3', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('3', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('4', '', 'tenant4', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('4', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('5', '', 'tenant5', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('5', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('6', '', 'tenant6', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('6', '3');

-- scara 2 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('7', '', 'tenant7', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('7', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('8', '', 'tenant8', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('8', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('9', '', 'tenant9', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('9', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('10', '', 'tenant10', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('10', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant11', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('11', '4');

-- scara 3 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant12', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('12', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('2', '', 'tenant13', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('13', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('3', '', 'tenant14', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('14', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('4', '', 'tenant15', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('15', '5');

-- scara 1 bloc 2
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('5', '', 'tenant16', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('16', '6');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('6', '', 'tenant17', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('17', '6');


-- ading roles on apartments
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '2');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '3');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '2');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '5');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '7');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '8');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '9');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '10');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('4', '6');

-- adding month
INSERT INTO `association1`.`month` (`month`, `year`) VALUES ('1', 2014);

-- adding metters
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '3');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '3');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '6');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '6');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '7');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '8');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '9');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '10');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '10');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '11');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '11');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '13');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '13');

-- Populate asociatie
-- use the association you want to populate
use association2;


-- creating blocks
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Bloc1', '2', '2');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Bloc2', '2', '2');


-- creating entrances
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '3');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '4');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara3', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('1', '5');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara1', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('2', '6');
INSERT INTO `association1`.`apartments_group` (`name`, `predefined_type`, `type`) VALUES ('Scara2', '1', '1');
INSERT INTO `association1`.`apartments_group_has_apartments_group` (`apartments_group_idapartments_group`, `apartments_group_idapartments_group1`) VALUES ('2', '7');

-- adding apartments on entrances

-- scara 1 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant1', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('1', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('2', '', 'tenant2', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('2', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('3', '', 'tenant3', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('3', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('4', '', 'tenant4', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('4', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('5', '', 'tenant5', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('5', '3');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('6', '', 'tenant6', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('6', '3');

-- scara 2 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('7', '', 'tenant7', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('7', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('8', '', 'tenant8', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('8', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('9', '', 'tenant9', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('9', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('10', '', 'tenant10', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('10', '4');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant11', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('11', '4');

-- scara 3 bloc 1
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('1', '', 'tenant12', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('12', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('2', '', 'tenant13', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('13', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('3', '', 'tenant14', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('14', '5');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('4', '', 'tenant15', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('15', '5');

-- scara 1 bloc 2
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('5', '', 'tenant16', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('16', '6');
INSERT INTO `association1`.`apartment` (`number`, `link_password`, `tenant_name`, `prezent_persons`) VALUES ('6', '', 'tenant17', '1');
INSERT INTO `association1`.`apartment_has_apartments_group` (`apartment_idapartment`, `apartments_group_idapartments_group`) VALUES ('17', '6');


-- ading roles on apartments
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '2');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('1', '3');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '2');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '5');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('2', '7');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '1');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '8');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '9');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('3', '10');
INSERT INTO `association1`.`user_has_apartment` (`user_iduser`, `apartment_idapartment`) VALUES ('4', '6');

-- adding month
INSERT INTO `association1`.`month` (`month`, `year`) VALUES ('1', 2014);

-- adding metters
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '1');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '2');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '3');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '3');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '4');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '5');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '6');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '6');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '7');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '8');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '9');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '10');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '10');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '11');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '11');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '2', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('1', '1', '1', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '2', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('2', '1', '1', '', '12');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '2', '', '13');
INSERT INTO `association1`.`meter` (`location`, `active`, `type`, `series`, `apartment_idapartment`) VALUES ('3', '1', '1', '', '13');















