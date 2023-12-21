#!/bin/bash

# Définition du mot de passe MySQL
MYSQL_PASSWORD="foo"

# Création de la base de données "sae51_bdd" si elle n'existe pas
echo "Création de la base de données sae51_bdd"
mysql -u root -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS sae51_bdd;"
