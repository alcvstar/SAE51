# Utilisation de l'image MySQL officielle
FROM mysql:latest

# Variables d'environnement pour configurer MySQL
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=sae51_bdd
ENV MYSQL_USER=db_user
ENV MYSQL_PASSWORD=db_password

# Copie du script SQL dans le conteneur
COPY create_tables.sql /docker-entrypoint-initdb.d/

# Exposition du port MySQL
EXPOSE 3306

