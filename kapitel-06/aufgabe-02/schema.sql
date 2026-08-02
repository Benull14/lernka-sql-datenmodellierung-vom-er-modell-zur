-- Schema und Testdaten für die Aufgabe "Anzahl Bücher pro Autor"
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
    (3, 'John Doe'),
    (4, 'Anna Schmidt');

-- Max Mustermann hat 3 Bücher
INSERT INTO buecher (buch_id, titel, autor_id) VALUES
    (101, 'Die Reise nach Süden', 1),
    (102, 'Der Winterwald', 1),
    (103, 'Sommergeschichten', 1);

-- Erika Musterfrau hat 2 Bücher
INSERT INTO buecher (buch_id, titel, autor_id) VALUES
    (104, 'Sterne über Berlin', 2),
    (105, 'Der letzte Brief', 2);

-- John Doe hat 1 Buch
INSERT INTO buecher (buch_id, titel, autor_id) VALUES
    (106, 'Unbekanntes Land', 3);

-- Anna Schmidt hat kein Buch im Bestand
