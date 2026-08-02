-- Schema und Testdaten für die Bibliotheksdatenbank
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    jahr INTEGER NOT NULL,
    verfuegbar INTEGER NOT NULL
);

INSERT INTO buecher (id, titel, autor, jahr, verfuegbar) VALUES
(1, 'Die Kunst des Krieges', 'Sun Tzu', 1998, 1),
(2, 'Die Kunst, recht zu behalten', 'Arthur Schopenhauer', 2005, 1),
(3, 'Die Verwandlung', 'Franz Kafka', 1915, 0),
(4, 'Die Kunst der Fotografie', 'Michael Freeman', 2013, 1),
(5, 'Der Report der Magd', 'Margaret Atwood', 1985, 1),
(6, 'Die Blechtrommel', 'Günter Grass', 1959, 1);
