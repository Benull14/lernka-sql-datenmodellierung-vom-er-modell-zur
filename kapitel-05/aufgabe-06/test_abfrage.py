import os
import sqlite3


def _verzeichnis():
    return os.path.dirname(os.path.abspath(__file__))


def _lade_datenbank():
    verbindung = sqlite3.connect(":memory:")
    schema_pfad = os.path.join(_verzeichnis(), "schema.sql")
    with open(schema_pfad, "r", encoding="utf-8") as datei:
        verbindung.executescript(datei.read())
    return verbindung


def _fuehre_loesung_aus(verbindung):
    loesung_pfad = os.path.join(_verzeichnis(), "loesung.sql")
    with open(loesung_pfad, "r", encoding="utf-8") as datei:
        sql = datei.read()
    cursor = verbindung.cursor()
    cursor.execute(sql)
    return cursor.fetchall()


def test_buecher_filter_und_sortierung():
    verbindung = _lade_datenbank()
    ergebnis = _fuehre_loesung_aus(verbindung)

    erwartet = [
        ("Effi Briest", "Fontane, Theodor", 1894, 1),
        ("Faust", "Goethe, Johann Wolfgang", 1808, 1),
        ("Die Leiden des jungen Werther", "Goethe, Johann Wolfgang", 1774, 1),
        ("Der Prozess", "Kafka, Franz", 1925, 1),
        ("Die Verwandlung", "Kafka, Franz", 1915, 1),
        ("Buddenbrooks", "Mann, Thomas", 1901, 1),
    ]

    assert ergebnis == erwartet

    verbindung.close()
