-- création de la BDD
CREATE DATABASE IF NOT EXISTS sae51_bdd;
USE sae51_bdd;

-- création de la table users
CREATE TABLE IF NOT EXISTS users (
    id_user INT AUTO_INCREMENT PRIMARY KEY, -- on définit un "id" (différent pour chaque table) qui fera office de clé primaire
    nom VARCHAR(255) NOT NULL, -- on crée les colonnes correspondant aux données que l'on veut avoir dans nos tables
    prenom VARCHAR(255) NOT NULL, -- précision : on utilise l'argument NOT NULL pour que les colonnes ne puissent pas être vides
    poste VARCHAR(255) NOT NULL
);

-- création de la table maintenance reliée à la table users avec la clé étrangère
CREATE TABLE IF NOT EXISTS maintenance (
    id_maintenance INT AUTO_INCREMENT PRIMARY KEY, 
    date_maintenance DATE NOT NULL,
    id_user INT, -- on crée la colonne correspondant à notre clé étrangère qui permettra de lier cette table à la table maintenance
    FOREIGN KEY (id_user) REFERENCES users(id_user) -- on associe la clé primaire distante en tant que clé entrangère de la table
);

-- création de la table hardware reliée aux tables maitenance et users avec les clés étrangères
CREATE TABLE IF NOT EXISTS hardware (
    id_pc INT AUTO_INCREMENT PRIMARY KEY,
    marque VARCHAR(255) NOT NULL,
    os VARCHAR(255) NOT NULL,
    date_achat DATE NOT NULL, -- on réutilise les mêmes commandes que pour les tables précedentes, en modifiant les points nécessaires
    id_user INT,
    id_maintenance INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_maintenance) REFERENCES maintenance(id_maintenance)
);

-- ensuite, on crée un deuxième fichier sql qui permettra d'insérer des données dans la bdd, grâce à des fichiers csv