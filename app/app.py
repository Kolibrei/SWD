import mysql.connector
from flask import Flask, render_template

# connect to mariaDB
#db = mysql.connector.connect(
#    host="localhost",
#    user="root",
#    password="password"
#)
#
## print(db)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=81)

