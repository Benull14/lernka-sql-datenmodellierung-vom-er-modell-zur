-- Tabelle für den Bücherbestand einer Buchhandlung
CREATE TABLE buecher (
    id INTEGER PRIMARY KEY,
    titel TEXT NOT NULL,
    autor TEXT NOT NULL,
    erscheinungsjahr INTEGER NOT NULL,
    verfuegbar INTEGER NOT NULL -- 1 = verfügbar, 0 = nicht verfügbar
);

INSERT INTO buecher (id, titel, autor, erscheinungsjahr, verfuegbar) VALUES
(1, 'Die Wolkenreise', 'Anna Berg', 2020, 1),
(2, 'Sternenstaub', 'Karl Fried', 2023, 1),
(3, 'Der letzte Sommer', 'Nina Voss', 2018, 0),
(4, 'Nebelpfade', 'Tom Reiser', 2023, 0),
(5, 'Lichtjahre entfernt', 'Anna Berg', 2021, 1),
(6, 'Der stille Fluss', 'Karl Fried', 2015, 1);
