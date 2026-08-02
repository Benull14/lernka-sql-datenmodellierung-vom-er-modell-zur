import sqlite3
import os
import pytest


def lade_datenbank():
    verbindung = sqlite3.connect(":memory:")
    basis_pfad = os.path.dirname(__file__)
    with open(os.path.join(basis_pfad, "schema.sql"), "r", encoding="utf-8") as f:
        verbindung.executescript(f.read())
    return verbindung


def fuehre_abfrage_aus(verbindung):
    basis_pfad = os.path.dirname(__file__)
    with open(os.path.join(basis_pfad, "loesung.sql"), "r", encoding="utf-8") as f:
        abfrage = f.read()
    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    return cursor.fetchall()


def test_buecherliste_mit_autorennamen():
    verbindung = lade_datenbank()
    ergebnis = fuehre_abfrage_aus(verbindung)

    erwartet = [
        ("Das Schloss", 1926, "Franz Kafka"),
        ("Der Prozess", 1925, "Franz Kafka"),
        ("Der Steppenwolf", 1927, "Hermann Hesse"),
        ("Homo faber", 1957, "Max Frisch"),
        ("Siddhartha", 1922, "Hermann Hesse"),
    ]

    assert ergebnis == erwartet
