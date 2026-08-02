-- Schema und Testdaten für Autoren und Bücher
CREATE TABLE autoren (
    autor_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE buecher (
    buch_id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor_id INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autoren(autor_id)
);

INSERT INTO autoren (autor_id, name) VALUES
(1, 'Max Mustermann'),
(2, 'Erika Musterfrau'),
(3, 'Anna Schmidt'),
(4, 'Peter Weber'),
(5, 'Julia Klein');

INSERT INTO buecher (buch_id, titel, autor_id) VALUES
(1, 'SQL Grundlagen', 1),
(2, 'Datenbanken kompakt', 1),
(3, 'Java für Einsteiger', 3);
