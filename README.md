## Christopher Sentis
## Niklas Kamps
## Noah Paulssen

### Description

This is an example webapp constructed with Python Flask. 
It means to demonstrate interactions of the frontend with a database backend. 
The app and database are served from separate Docker containers. 

### What does it do?

Flask provides a webserver which can seamlessly serve HTML from so called templates. 
Usually these templates are used in conjuntion with Jinja2, to provide interaction or dynamic content on a webpage. 
We decided to use pure javascript instead, because Jinja tends to be kinda clunky. 
Besides implementing it with Javascript was a good learning experience, since non of us had worked with it before. 

The structure of a flask application typically consists of three parts. 
The HTML templates, so called routes and any additional logic or backend components like a database. 
Routes define how a specific webrequest to a path on the webserver should be handeled. 
For example we could define a route for /index and tell it to return a HTML template and data from a database, when it gets called with a HTTP-Get request. When needed the database connection is handeled through a Python library. 

### Docker Compose provided for easy startup

```
$ docker compose -f "docker-compose.yaml" up -d
```

Web-Application bound to :80

### To view the logs and console output

```
$ docker logs --tail 1000 -f <container_name>
```