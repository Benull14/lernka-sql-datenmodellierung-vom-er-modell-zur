import os
import sqlite3


BASIS_VERZEICHNIS = os.path.dirname(os.path.abspath(__file__))


def lade_schema(verbindung):
    schema_pfad = os.path.join(BASIS_VERZEICHNIS, "schema.sql")
    with open(schema_pfad, "r", encoding="utf-8") as datei:
        verbindung.executescript(datei.read())


def lade_abfrage():
    abfrage_pfad = os.path.join(BASIS_VERZEICHNIS, "loesung.sql")
    with open(abfrage_pfad, "r", encoding="utf-8") as datei:
        return datei.read()


def test_vielschreiber_finden():
    verbindung = sqlite3.connect(":memory:")
    try:
        lade_schema(verbindung)
        abfrage = lade_abfrage()
        cursor = verbindung.cursor()
        cursor.execute(abfrage)
        ergebnis = cursor.fetchall()
    finally:
        verbindung.close()

    erwartet = [
        ("Anna Schmidt", 4),
        ("Max Mustermann", 3),
        ("Erika Musterfrau", 2),
    ]

    assert ergebnis == erwartet
