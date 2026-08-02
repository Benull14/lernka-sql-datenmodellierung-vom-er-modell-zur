-- Schema und Testdaten für die Bibliotheksübersicht
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    erscheinungsjahr INTEGER NOT NULL,
    verfuegbar INTEGER NOT NULL DEFAULT 1
);

INSERT INTO buecher (id, titel, autor, erscheinungsjahr, verfuegbar) VALUES
    (1, 'Der Prozess', 'Kafka, Franz', 1925, 1),
    (2, 'Die Verwandlung', 'Kafka, Franz', 1915, 1),
    (3, 'Das Schloss', 'Kafka, Franz', 1926, 0),
    (4, 'Faust', 'Goethe, Johann Wolfgang', 1808, 1),
    (5, 'Die Leiden des jungen Werther', 'Goethe, Johann Wolfgang', 1774, 1),
    (6, 'Testbericht Q1', 'Goethe, Johann Wolfgang', 2020, 1),
    (7, 'Effi Briest', 'Fontane, Theodor', 1894, 1),
    (8, 'Der Stechlin', 'Fontane, Theodor', 1899, 0),
    (9, 'Testlauf', 'Kafka, Franz', 2023, 1),
    (10, 'Buddenbrooks', 'Mann, Thomas', 1901, 1);
