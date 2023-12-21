#!/bin/bash

# Définition du mot de passe MySQL
MYSQL_PASSWORD="foo" # Remplacez par votre mot de passe MySQL

# Vérification de l'existence du dossier CSV
if [ ! -d "/shared_sae51/csv" ]; then
    echo "Le dossier /shared_sae51/csv n'existe pas. Arrêt du script."
    exit 1
fi

# Importation des données CSV dans chaque table correspondante
echo "Début de l'importation des données CSV..."
for csv_file in /shared_sae51/csv/*.csv; do
    if [ -f "$csv_file" ]; then
        # Le nom de la table est déduit du nom du fichier CSV
        table_name=$(basename "$csv_file" .csv)
        echo "Importation des données dans la table $table_name à partir de $csv_file..."

        # Commande d'importation MySQL
        mysqlimport --local --ignore-lines=1 \
                    -u root -p$MYSQL_PASSWORD \
                    --fields-terminated-by=',' \
                    --lines-terminated-by='\n' \
                    sae51_bdd $csv_file
    else
        echo "Aucun fichier CSV trouvé pour la table $table_name."
    fi
done
echo "Importation des données CSV terminée."