-- utilisation de la base de données précédemment créée
USE sae51_bdd;

-- insertion des données dans la table "users"
LOAD DATA LOCAL INFILE '~/users.csv'
INTO TABLE users -- on va récupérer le contenu du fichier csv associé à chaque table dans les colonnes correpsondantes
FIELDS TERMINATED BY ',' -- on précise le séparateur permettant de différencier les colonnes dans le csv
LINES TERMINATED BY '\n'-- on précise comment chaque lignes du csv est délimitée
IGNORE 1 ROWS; -- on rajoute cette ligne car la première ligne de chaque csv contient l'en-tête de chaque colonne, afin de faciliter la lecture

-- ensuite, on répète les mêmes commandes pour chaque table

-- insertion des données dans la table "maintenance"
LOAD DATA LOCAL INFILE '~/maintenance.csv'
INTO TABLE maintenance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- insertion des données dans la table "hardware"
LOAD DATA LOCAL INFILE '~/hardware.csv'
INTO TABLE hardware
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
