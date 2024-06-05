

##### Make the database connection from python work:
This step can be skipped if you have xampp installed on bare metall. 
Xampp only allows connections from localhost by default.
Since the mysql server is running in docker we are tecnically not connecting from localhost. 
Add an entry in the default mysql database like so:

```
CREATE USER 'root'@'%' IDENTIFIED BY 'root-password';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
```


It is advised to run python in a virtual environment:
(for windows based machines)

```
$ py -m venv .venv
$ .\.venv\Scripts\activate
```

TODO import the DB
TODO python webservice (possibly minimalist with requests lib)
TODO build functions for three or four predefined sql queries