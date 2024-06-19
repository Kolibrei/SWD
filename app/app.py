import mysql.connector
from flask import Flask, render_template, request, jsonify
import json

## connect to mariaDB in xampp container
#db = mysql.connector.connect(
#    host="127.0.0.1",
#    user="root",
#    password="password"
#)

# print(db)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/query", methods=['GET','POST'])
def query():
    with open('home.json') as json_data:
        d = jsonify(json_data)
    return d
    


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=81)

