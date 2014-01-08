
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
