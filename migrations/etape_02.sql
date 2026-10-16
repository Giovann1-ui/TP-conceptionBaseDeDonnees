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