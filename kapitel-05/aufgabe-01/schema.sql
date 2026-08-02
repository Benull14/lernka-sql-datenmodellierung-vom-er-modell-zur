-- Schema und Testdaten für die Tabelle buecher
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    verfuegbar INTEGER NOT NULL
);

INSERT INTO buecher (id, titel, autor, verfuegbar) VALUES
(1, 'Der Steppenwolf', 'Hermann Hesse', 1),
(2, 'Faust', 'Johann Wolfgang von Goethe', 0),
(3, 'Die Verwandlung', 'Franz Kafka', 1),
(4, 'Buddenbrooks', 'Thomas Mann', 0),
(5, 'Siddhartha', 'Hermann Hesse', 1);
