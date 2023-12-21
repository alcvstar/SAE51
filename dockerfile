# Utilisation d'Ubuntu 22.04 comme image de base
FROM ubuntu:22.04

# Mise à jour des paquets et installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    mysql-server \
    && rm -rf /var/lib/apt/lists/*

# Installation de dbml-cli et dbml-renderer via npm
RUN npm install -g @dbml/cli
RUN npm install -g @softwaretechnik/dbml-renderer

# Définition du dossier de travail
WORKDIR /shared_sae51

# Copie du script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Utilisation du script d'entrée comme point d'entrée
ENTRYPOINT ["/entrypoint.sh"]

# Exécution de MySQL comme processus principal
CMD ["mysqld", "--local-infile=1"]