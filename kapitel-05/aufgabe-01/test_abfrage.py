import os
import sqlite3

import pytest


def _lade_datei(dateiname):
    pfad = os.path.join(os.path.dirname(__file__), dateiname)
    with open(pfad, "r", encoding="utf-8") as f:
        return f.read()


def _erzeuge_verbindung():
    verbindung = sqlite3.connect(":memory:")
    verbindung.executescript(_lade_datei("schema.sql"))
    return verbindung


def test_verfuegbare_buecher():
    verbindung = _erzeuge_verbindung()
    cursor = verbindung.cursor()

    abfrage = _lade_datei("loesung.sql")
    cursor.executescript(abfrage) if False else None  # Platzhalter, wird unten korrekt ausgeführt

    # Abfrage direkt ausführen, um Ergebnisse abzurufen
    cursor.execute(abfrage)
    ergebnis = cursor.fetchall()

    erwartet = [
        (1, "Der Steppenwolf", "Hermann Hesse", 1),
        (3, "Die Verwandlung", "Franz Kafka", 1),
        (5, "Siddhartha", "Hermann Hesse", 1),
    ]

    assert ergebnis == erwartet

    verbindung.close()
