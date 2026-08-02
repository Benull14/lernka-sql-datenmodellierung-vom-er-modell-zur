import sqlite3
import os

import pytest

BASISPFAD = os.path.dirname(__file__)


def lade_sql(dateiname):
    with open(os.path.join(BASISPFAD, dateiname), encoding="utf-8") as datei:
        return datei.read()


@pytest.fixture
def verbindung():
    conn = sqlite3.connect(":memory:")
    conn.executescript(lade_sql("schema.sql"))
    yield conn
    conn.close()


def test_buecher_von_autor_und_jahr(verbindung):
    abfrage = lade_sql("loesung.sql")
    cursor = verbindung.cursor()
    cursor.execute(abfrage)
    ergebnis = cursor.fetchall()

    erwartet = [
        ("Die Insel unter dem Meer", "Isabel Allende", 2009),
        ("Der Wind kennt meinen Namen", "Isabel Allende", 2023),
    ]

    assert ergebnis == erwartet
