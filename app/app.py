import sys
import time
import mysql
import mysql.connector
from flask import Flask, render_template, jsonify, request

## connect to myqsl
for i in range(0, 20):
    try:
        print("Trying for DB Connection " + str(i) + "/20", file=sys.stderr)
        db = mysql.connector.connect(
            user="root",
            password="password",
            database="liga",
            host="mysql",
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
        "SELECT G.Spiel_ID, V1.Name AS Heim, G.Tore_Verein1 AS Heimtore, V2.Name AS Gast, G.Tore_Verein2 AS Gasttore, O.Name AS Ort FROM Spiele G JOIN Vereine V1 ON G.Verein1_ID = V1.VereinsID JOIN Vereine V2 ON G.Verein2_ID = V2.VereinsID JOIN Ort O ON V1.Verein_PLZ = O.PLZ;"
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


@app.route("/refresh", methods=["GET", "POST"])
def refresh():
    cursor = db.cursor()
    cursor.execute("TRUNCATE TABLE Spiele;")
    cursor.execute(
        "INSERT INTO Spiele (Verein1_ID, Verein2_ID) SELECT V1.VereinsID AS Verein1_ID, V2.VereinsID AS Verein2_ID FROM Vereine V1 CROSS JOIN Vereine V2 WHERE V1.VereinsID <> V2.VereinsID;"
    )
    result = cursor.fetchall()
    cursor.close()
    for x in result:
        print(x, file=sys.stderr)
    return jsonify(result)

@app.route('/save_data_heim', methods=['POST'])
def save_data_heim():
    data = request.get_json()
    row_id = data['id']
    heimtore = data['Heimtore']
    cursor = db.cursor()
    cursor.execute(
        "UPDATE Spiele SET Tore_Verein1 =" + heimtore + " WHERE Spiel_ID = " + str(row_id) + ";"
    )
    cursor.close()
    return jsonify({"message": "Data saved successfully"}), 200

@app.route('/save_data_gast', methods=['POST'])
def save_data_gast():
    data = request.get_json()
    row_id = data['id']
    gasttore = data['Gasttore']
    cursor = db.cursor()
    cursor.execute(
        "UPDATE Spiele SET Tore_Verein2 =" + gasttore + " WHERE Spiel_ID = " + str(row_id) + ";"
    )
    cursor.close()
    return jsonify({"message": "Data saved successfully"}), 200


    ## Update the games data with the new scores
    #if row_index is not None and 0 <= row_index < len(games_data):
    #    games_data[row_index]['heimtore'] = heimtore
    #    games_data[row_index]['gasttore'] = gasttore
    #    return jsonify({"message": "Data saved successfully"}), 200
    #else:
    #    return jsonify({"message": "Invalid row index"}), 400


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)
