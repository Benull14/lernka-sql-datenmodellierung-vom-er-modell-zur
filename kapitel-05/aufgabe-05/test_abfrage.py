import sqlite3
import os
import pytest


def lade_datenbank():
    verzeichnis = os.path.dirname(__file__)
    verbindung = sqlite3.connect(":memory:")
    cursor = verbindung.cursor()

    with open(os.path.join(verzeichnis, "schema.sql"), "r", encoding="utf-8") as datei:
        cursor.executescript(datei.read())

    return verbindung


def fuehre_abfrage_aus(verbindung):
    verzeichnis = os.path.dirname(__file__)
    with open(os.path.join(verzeichnis, "loesung.sql"), "r", encoding="utf-8") as datei:
        abfrage = datei.read()

    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    return cursor.fetchall()


def test_alle_autoren_ohne_duplikate():
    verbindung = lade_datenbank()
    ergebnis = fuehre_abfrage_aus(verbindung)

    erwartet = [
        ('J.R.R. Tolkien',),
        ('Kenneth Grahame',),
        ('Michael Ende',),
        ('Walter Moers',),
    ]

    assert ergebnis == erwartet
