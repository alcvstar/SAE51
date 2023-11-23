-- Création de la base de données
CREATE DATABASE IF NOT EXISTS sae51_bdd;
USE sae51_bdd;

-- Création de la table users
CREATE TABLE IF NOT EXISTS users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    poste VARCHAR(255) NOT NULL
);

-- Création de la table maintenance avec la clé étrangère
CREATE TABLE IF NOT EXISTS maintenance (
    id_maintenance INT AUTO_INCREMENT PRIMARY KEY,
    date_maintenance DATE NOT NULL,
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

-- Création de la table hardware avec les clés étrangères
CREATE TABLE IF NOT EXISTS hardware (
    id_pc INT AUTO_INCREMENT PRIMARY KEY,
    marque VARCHAR(255) NOT NULL,
    os VARCHAR(255) NOT NULL,
    date_achat DATE NOT NULL,
    id_user INT,
    id_maintenance INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_maintenance) REFERENCES maintenance(id_maintenance)
);
