import mysql
import mysql.connector
from flask import Flask, render_template, request, jsonify
import json
import sys

## connect to myqsl
db = mysql.connector.connect(
    user="root",
    password="password",
    database="liga",
    host="mysql",
    port = "3306"

)

# print(db)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/query", methods=['GET','POST'])
def query():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Ort")
    result = cursor.fetchall()

    for x in result:
        print(type(x), file=sys.stderr)
    cursor.close()
    return jsonify(result)



if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)

