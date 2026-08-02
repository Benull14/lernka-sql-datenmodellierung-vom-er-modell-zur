import sqlite3
import os
import pytest


def lade_datenbank():
    verbindung = sqlite3.connect(':memory:')
    basis_pfad = os.path.dirname(__file__)
    with open(os.path.join(basis_pfad, 'schema.sql'), 'r', encoding='utf-8') as datei:
        verbindung.executescript(datei.read())
    return verbindung


def fuehre_abfrage_aus(verbindung):
    basis_pfad = os.path.dirname(__file__)
    with open(os.path.join(basis_pfad, 'loesung.sql'), 'r', encoding='utf-8') as datei:
        abfrage = datei.read()
    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    return cursor.fetchall()


def test_anzahl_buecher_pro_autor():
    verbindung = lade_datenbank()
    ergebnis = fuehre_abfrage_aus(verbindung)
    verbindung.close()

    erwartet = [
        ('Max Mustermann', 3),
        ('Erika Musterfrau', 2),
        ('John Doe', 1),
        ('Anna Schmidt', 0),
    ]

    assert ergebnis == erwartet
