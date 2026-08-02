import sqlite3
import os

BASISPFAD = os.path.dirname(__file__)


def lade_sql(dateiname):
    with open(os.path.join(BASISPFAD, dateiname), encoding="utf-8") as f:
        return f.read()


def test_buecher_mit_aehnlichem_titel():
    verbindung = sqlite3.connect(":memory:")
    cursor = verbindung.cursor()

    schema = lade_sql("schema.sql")
    cursor.executescript(schema)

    abfrage = lade_sql("loesung.sql")
    cursor.execute(abfrage)
    ergebnis = cursor.fetchall()

    erwartet = [
        (4, 'Die Kunst der Fotografie', 'Michael Freeman', 2013),
        (1, 'Die Kunst des Krieges', 'Sun Tzu', 1998),
        (2, 'Die Kunst, recht zu behalten', 'Arthur Schopenhauer', 2005),
    ]

    assert ergebnis == erwartet

    verbindung.close()
