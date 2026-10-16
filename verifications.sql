-- ETAPE 1 : afficher les plats du plus cher au moins cher
SELECT * FROM plats ORDER BY prix DESC;
--  id |        libelle        | prix 
-- ----+-----------------------+------
--   3 | Akoho sy voanio       | 8500
--   2 | Ravitoto sy henakisoa | 8000
--   1 | Romazava              | 7000
--   4 | Mi sao                | 6000
--   5 | Soupe chinoise        | 5000
--   6 | Mofo gasy (les 4)     | 1000
--   7 | Ranon ampango         |  500

-- RQP: Le type choisi pour le prix est INTEGER car on utilise pas les centimes a madagascar, l'indentifiant utilise pour le prix est INTEGER

-- ETAPE 2
SELECT c.id, c.libelle, COUNT(p.id) AS nombre_plats
FROM plats p
RIGHT JOIN categorie_plats c ON c.id = p.id_categorie_plats
GROUP BY c.id, c.libelle
ORDER BY c.id ASC;
--  id |      libelle      | nombre_plats 
-- ----+-------------------+--------------
--   1 | Plat malagasy     |            3
--   2 | Plat chinois      |            1
--   3 | Soupe             |            1
--   4 | Dessert et goûter |            1
--   5 | Boisson           |            1
--   6 | Amuse-gueule      |            0

-- RQP: on n'ajoute pas une colonne categorie VARCHAR(50) car si l'on souhaite rechercher les plats d'une categorie mais que certains plats sont mal orthoraphiee sur la colonne categorie, certains plats vont etre absent du resultat
-- exemple : si on a une categorie "Boisson" mais que certains plats sont ecrit "boisson" ou "Jus", les resultats seront incomplet

-- ETAPE 3
SELECT c.id, c.date, SUM(cd.quantite * cd.prix) AS total_commande
FROM commandes c
RIGHT JOIN commandes_details cd ON c.id = cd.id_commande
GROUP BY c.id, c.date
ORDER BY c.date DESC;
-- id |        date         | total_commande 
------+---------------------+----------------
--  2 | 2024-01-02 15:30:00 |          25500
--  1 | 2024-01-01 10:00:00 |          22000

-- RQP: On place la quantite dans la table commandes_details car un plat peut etre commandé plusieurs fois dans une commande