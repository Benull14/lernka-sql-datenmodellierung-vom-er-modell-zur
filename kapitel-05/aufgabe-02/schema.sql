-- Tabelle für die Bücherverwaltung einer Buchhandlung
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    erscheinungsjahr INTEGER NOT NULL,
    preis REAL NOT NULL
);

INSERT INTO buecher (id, titel, autor, erscheinungsjahr, preis) VALUES
    (1, 'Das Geisterhaus', 'Isabel Allende', 1982, 12.99),
    (2, 'Eva Luna', 'Isabel Allende', 1987, 10.50),
    (3, 'Paula', 'Isabel Allende', 1994, 9.99),
    (4, 'Die Insel unter dem Meer', 'Isabel Allende', 2009, 14.99),
    (5, 'Der Wind kennt meinen Namen', 'Isabel Allende', 2023, 22.00),
    (6, 'Harry Potter und der Stein der Weisen', 'J.K. Rowling', 1997, 8.99),
    (7, 'Harry Potter und die Kammer des Schreckens', 'J.K. Rowling', 1998, 8.99),
    (8, 'Der Circle', 'Dave Eggers', 2013, 11.99);
