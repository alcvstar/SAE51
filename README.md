# Dépot archivant l'ensemble des travaux réalisés dansle cadre de la sae51

### Mise en place du conteneur

On construit d'abord le conteneur

```bash
docker build -t sae51_image .
```

Ensuite, on le lance en précisant le chemin absolu du dossier shared_sae51, qui contient les fichiers qui seront importés dans le conteneur (il s'agit en fait de notre WORKDIR).

```bash
docker run -it -v chemin-absolu\shared_sae51:/shared_sae51 sae51_image
```

On récupère le nom du conteneur et on accède à celui-ci.

```bash
docker ps
docker exec -it nom-du-conteneur bash
```

Enfin, on lance le script chargé de faire les requêtes SQL.

```bash
mysql -u root -p sae51_bdd < /shared_sae51/requests.sql
```
