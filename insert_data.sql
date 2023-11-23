-- Utilisation de la base de données existante
USE sae51_bdd;

-- Insertion des données dans la table "users"
LOAD DATA LOCAL INFILE '~/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Insertion des données dans la table "maintenance"
LOAD DATA LOCAL INFILE '~/maintenance.csv'
INTO TABLE maintenance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Insertion des données dans la table "hardware"
LOAD DATA LOCAL INFILE '~/hardware.csv'
INTO TABLE hardware
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
