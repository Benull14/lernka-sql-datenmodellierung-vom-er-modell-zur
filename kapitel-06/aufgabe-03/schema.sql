-- Schema und Testdaten für die Aufgabe "Vielschreiber finden"
-- Szenario: Ein Verlag möchte wissen, welche Autoren bereits mehrere Bücher
-- veröffentlicht haben, um sie für eine eigene Autoren-Reihe vorzuschlagen.

CREATE TABLE autoren (
    autor_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE buecher (
    buch_id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor_id INTEGER NOT NULL,
    erscheinungsjahr INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autoren(autor_id)
);

INSERT INTO autoren (autor_id, name) VALUES
    (1, 'Max Mustermann'),
    (2, 'Erika Musterfrau'),
    (3, 'John Doe'),
    (4, 'Anna Schmidt'),
    (5, 'Peter Klein');

INSERT INTO buecher (buch_id, titel, autor_id, erscheinungsjahr) VALUES
    (1, 'Der Weg zur Wolke', 1, 2015),
    (2, 'Sturm im Wasserglas', 1, 2017),
    (3, 'Neue Horizonte', 1, 2019),
    (4, 'Sommerregen', 2, 2018),
    (5, 'Winterlicht', 2, 2020),
    (6, 'Einsame Wege', 3, 2016),
    (7, 'Der letzte Tag', 4, 2014),
    (8, 'Morgenrot', 4, 2016),
    (9, 'Abendstern', 4, 2018),
    (10, 'Nachtschicht', 4, 2021);
