import mysql.connector
from flask import Flask

# connect to mariaDB
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password"
)

# print(db)

app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>Hello from Flask & Docker</h2>'


if __name__ == "__main__":
    app.run(debug=True)

