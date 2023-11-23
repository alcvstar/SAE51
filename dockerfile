# Utilisation de l'image MySQL officielle
FROM mysql:latest

# Variables d'environnement pour configurer MySQL
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=sae51_bdd
ENV MYSQL_USER=db_user
ENV MYSQL_PASSWORD=db_password

# Copie du script SQL dans le conteneur
COPY create_tables.sql /docker-entrypoint-initdb.d/

# Installation du client MySQL pour exécuter le script
RUN apt-get update && \
    apt-get install -y mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Exposition du port MySQL
EXPOSE 3306
