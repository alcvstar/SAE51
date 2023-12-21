#!/bin/bash

# Démarrer MySQL en arrière-plan
mysqld --local-infile=1 &

# Attendre que MySQL soit complètement démarré
sleep 20

# Exécuter les scripts
./create-db.sh
./convert-dbml.sh
./import-csv.sh

# Démarrer le serveur MySQL en premier plan
exec mysqld --local-infile=1
