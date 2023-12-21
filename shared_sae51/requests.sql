-- Liste de toutes les machines de marque HP
SELECT * FROM hardware WHERE marque = 'HP';

-- Liste de toutes les machines achetées en 2023
SELECT * FROM hardware WHERE date_achat BETWEEN '2023-01-01' AND '2023-12-31';

-- Liste de toutes les machines de marque HP achetées en 2023
SELECT * FROM hardware WHERE marque = 'HP' AND date_achat BETWEEN '2023-01-01' AND '2023-12-31';

-- Nombre de machines de la marque DELL
SELECT COUNT(*) FROM hardware WHERE marque = 'DELL';

-- Liste des utilisateurs utilisant une machine de marque HP
SELECT users.* FROM users
JOIN hardware ON users.id_user = hardware.id_user
WHERE hardware.marque = 'HP';

-- Liste des utilisateurs utilisant une machine de marque HP avec un OS "Windows"
SELECT users.* FROM users
JOIN hardware ON users.id_user = hardware.id_user
WHERE hardware.marque = 'HP' AND hardware.os = 'Windows';

-- Liste des machines sur lesquelles il y a eu intervention technique entre le 10/10/2023 et le 10/12/2023
SELECT hardware.* FROM hardware
JOIN maintenance ON hardware.id_maintenance = maintenance.id_maintenance
WHERE maintenance.date_maintenance BETWEEN '2023-10-10' AND '2023-12-10';

-- Liste des machines sur lesquelles le technicien Baker Grace a fait de la maintenance
-- Cette requête suppose que le nom du technicien est stocké dans la table `users` et relié à `maintenance` via `id_user`
SELECT hardware.* FROM hardware
JOIN maintenance ON hardware.id_maintenance = maintenance.id_maintenance
JOIN users ON maintenance.id_user = users.id_user
WHERE users.nom = 'Grace' AND users.prenom = 'Baker';
