import mysql
import mysql.connector
from flask import Flask, render_template, request, jsonify
import json
import sys
import time

## connect to myqsl
for i in range(0, 20):
    try:
        print("Trying for DB Connection " + str(i) + "/20", file=sys.stderr)
        db = mysql.connector.connect(
            user="root",
            password="password",
            database="liga",
            host="localhost",
            port="3306",
        )
    except:
        time.sleep(15)
        continue
    break

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/spieler", methods=["GET", "POST"])
def spieler():
    return render_template("spieler.html")

@app.route("/tabelle", methods=["GET", "POST"])
def tabelle():
    return render_template("tabelle.html")

@app.route("/games", methods=["GET", "POST"])
def games():
    return render_template("games.html")

@app.route("/spieler_query", methods=["GET", "POST"])
def spieler_query():
    cursor = db.cursor()
    cursor.execute(
        "SELECT S.Name AS Name, S.Vorname AS Vorname, V.Name AS Team, S.Tore AS Tore FROM Spieler S JOIN Vereine V ON S.Vereins_ID = V.VereinsID;"
    )
    result = cursor.fetchall()
    for x in result:
        print(x, file=sys.stderr)
    cursor.close()
    return jsonify(result)

@app.route("/games_query", methods=["GET", "POST"])
def games_query():
    cursor = db.cursor()
    cursor.execute(
        "SELECT V1.Name AS Heim, G.Tore_Verein1 AS Heimtore, V2.Name AS Gast, G.Tore_Verein2 AS Gasttore, O.Name AS Ort FROM Spiele G JOIN Vereine V1 ON G.Verein1_ID = V1.VereinsID JOIN Vereine V2 ON G.Verein2_ID = V2.VereinsID JOIN Ort O ON V1.Verein_PLZ = O.PLZ;"
    )
    result = cursor.fetchall()
    cursor.close()
    for x in result:
        print(x, file=sys.stderr)
    return jsonify(result)

@app.route("/tabelle_query", methods=["GET", "POST"])
def tabelle_query():
    cursor = db.cursor()
    cursor.execute(
        "SELECT T.Platz, V.Name, T.Siege, T.Niederlagen, T.Punkte, V.VereinsID, T.Tabelle_ID FROM Tabelle T JOIN Vereine V ON T.Vereins_ID = V.VereinsID;"
    )
    result = cursor.fetchall()
    cursor.close()
    for x in result:
        print(x, file=sys.stderr)
    return jsonify(result)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)
