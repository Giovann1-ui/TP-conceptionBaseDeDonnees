-- ETAPE 01
CREATE TABLE plats (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255),
    prix INTEGER
);

INSERT INTO plats (libelle, prix)
VALUES
('Romazava', 7000),
('Ravitoto sy henakisoa', 8000),
('Akoho sy voanio', 8500),
('Mi sao', 6000),
('Soupe chinoise', 5000),
('Mofo gasy (les 4)', 1000),
('Ranon ampango', 500);

-- ETAPE 02
CREATE TABLE categorie_plats (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100)
);

ALTER TABLE plats DROP id_categorie;
INSERT INTO categorie_plats (libelle)
VALUES
('Plat malagasy'),
('Plat chinois'),
('Soupe'),
('Dessert et goûter'),
('Boisson'),
('Amuse-gueule');

ALTER TABLE plats ADD id_categorie_plats INTEGER REFERENCES categorie_plats(id);
UPDATE plats SET id_categorie_plats = 1 WHERE id IN (1,2,3);
UPDATE plats SET id_categorie_plats = CASE 
    WHEN id = 4 THEN 2
    WHEN id = 5 THEN 3
    WHEN id = 6 THEN 4
    WHEN id = 7 THEN 5
    ELSE 1
END;

ALTER TABLE plats ALTER COLUMN id_categorie_plats SET NOT NULL; 

-- ETAPE 03
CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE commandes_details (
    id SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commandes(id),
    id_plat INTEGER NOT NULL REFERENCES plats(id),
    quantite INTEGER NOT NULL,
    prix INTEGER NOT NULL
);

INSERT INTO commandes (date)
VALUES
('2024-01-01 10:00:00'),
('2024-01-02 15:30:00');

INSERT INTO commandes_details (id_commande, id_plat, quantite, prix)
VALUES
(1, 1, 2, 7000),
(1, 2, 1, 8000),
(2, 3, 3, 8500);