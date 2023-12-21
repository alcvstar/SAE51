#!/bin/bash

MYSQL_PASSWORD="foo"

# Parcours de tous les fichiers .dbml dans le dossier /shared_sae51
for file in /shared_sae51/*.dbml; do
    if [ -f "$file" ]; then
        echo "Conversion de $file en SQL"
        name=${file%.dbml}
        echo "processing $name"
        dbml2sql $file --mysql > $name.sql

        echo "Conversion de $file en SVG"
        dbml-renderer render "$file" -o "${file%.dbml}.svg"

        echo "Exécution du script SQL dans la base de données sae51_bdd"
        mysql -u root -p$MYSQL_PASSWORD sae51_bdd < "${file%.dbml}.sql"
        echo "ok"
    else
        echo "Aucun fichier .dbml trouvé dans /shared_sae51."
    fi
done
