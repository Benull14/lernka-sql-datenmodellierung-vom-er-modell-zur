-- Schema für Bibliotheksverwaltung: Bücher und Autoren

CREATE TABLE autoren (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    erscheinungsjahr INTEGER NOT NULL,
    autor_id INTEGER NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autoren(id)
);

INSERT INTO autoren (id, name) VALUES
    (1, 'Max Frisch'),
    (2, 'Hermann Hesse'),
    (3, 'Franz Kafka');

INSERT INTO buecher (id, titel, erscheinungsjahr, autor_id) VALUES
    (1, 'Der Prozess', 1925, 3),
    (2, 'Siddhartha', 1922, 2),
    (3, 'Homo faber', 1957, 1),
    (4, 'Das Schloss', 1926, 3),
    (5, 'Der Steppenwolf', 1927, 2);
