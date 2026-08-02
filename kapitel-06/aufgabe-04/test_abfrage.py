import sqlite3
import os

import pytest


def _lade_datenbank():
    verbindung = sqlite3.connect(":memory:")
    basisverzeichnis = os.path.dirname(__file__)
    with open(os.path.join(basisverzeichnis, "schema.sql"), "r", encoding="utf-8") as datei:
        verbindung.executescript(datei.read())
    return verbindung


def _lade_abfrage():
    basisverzeichnis = os.path.dirname(__file__)
    with open(os.path.join(basisverzeichnis, "loesung.sql"), "r", encoding="utf-8") as datei:
        return datei.read()


def test_autoren_ohne_veroeffentlichtes_buch():
    verbindung = _lade_datenbank()
    abfrage = _lade_abfrage()

    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    ergebnis = cursor.fetchall()

    erwartet = [
        ("Erika Musterfrau",),
        ("Julia Klein",),
        ("Peter Weber",),
    ]

    assert ergebnis == erwartet

    verbindung.close()
