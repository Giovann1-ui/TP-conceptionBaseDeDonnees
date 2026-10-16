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

-- Le type choisi pour le prix est INTEGER car on utilise pas les centimes a madagascar, l'indentifiant utilise pour le prix est INTEGER
