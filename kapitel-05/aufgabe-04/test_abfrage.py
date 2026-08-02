import sqlite3
import pathlib

import pytest


def _lade_datenbank():
    verbindung = sqlite3.connect(":memory:")
    schema_pfad = pathlib.Path(__file__).parent / "schema.sql"
    with open(schema_pfad, "r", encoding="utf-8") as datei:
        verbindung.executescript(datei.read())
    return verbindung


def _fuehre_loesung_aus(verbindung):
    loesung_pfad = pathlib.Path(__file__).parent / "loesung.sql"
    with open(loesung_pfad, "r", encoding="utf-8") as datei:
        abfrage = datei.read()
    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    return cursor.fetchall()


def test_neueste_verfuegbare_buecher_sortiert():
    verbindung = _lade_datenbank()
    ergebnis = _fuehre_loesung_aus(verbindung)

    erwartet = [
        ("Sternenstaub", "Karl Fried", 2023),
        ("Lichtjahre entfernt", "Anna Berg", 2021),
        ("Die Wolkenreise", "Anna Berg", 2020),
        ("Der stille Fluss", "Karl Fried", 2015),
    ]

    assert ergebnis == erwartet
