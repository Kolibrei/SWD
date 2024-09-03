import mysql
import mysql.connector
from flask import Flask, render_template, request, jsonify
import json

## connect to myqsl
db = mysql.connector.connect(
    user="root",
    password="password",
    database="liga",
    host="localhost",

)

# print(db)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/query", methods=['GET','POST'])
def query():
    if request.method == "POST":
        # Checking if the table exists on the MySQL server
        cursor = db.cursor()
        cursor.execute("SHOW TABLES")

        for tables in cursor:
            print(tables)

        # Closing the cursor
        cursor.close()
        #with open('home.json') as json_data:
        return



if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)


