import mysql.connector

# connect to mariaDB
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password"
)

# print(db)

