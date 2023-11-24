# on base le conteneur sur une image MySQL
FROM mysql:latest

# on configure MySQL
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=sae51_bdd
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=user

# on copie le script de création de la bdd
COPY create_tables.sql /docker-entrypoint-initdb.d/

# on expose le port MySQL
EXPOSE 3306