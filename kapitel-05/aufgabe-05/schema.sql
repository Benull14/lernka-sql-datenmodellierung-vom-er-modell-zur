-- Tabelle für den Bücherbestand einer Buchhandlung
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    preis REAL NOT NULL
);

INSERT INTO buecher (id, titel, autor, preis) VALUES
    (1, 'Die Stadt der Träumenden Bücher', 'Walter Moers', 12.99),
    (2, 'Der Wind in den Weiden', 'Kenneth Grahame', 9.50),
    (3, 'Rumo & Die Wunder im Dunkeln', 'Walter Moers', 14.99),
    (4, 'Der Hobbit', 'J.R.R. Tolkien', 11.00),
    (5, 'Der Herr der Ringe', 'J.R.R. Tolkien', 24.99),
    (6, 'Die Insel der Tausend Leuchttürme', 'Walter Moers', 13.50),
    (7, 'Momo', 'Michael Ende', 10.20),
    (8, 'Die unendliche Geschichte', 'Michael Ende', 15.00);
