## Christopher Sentis
## Niklas Kamps
## Noah Paulssen




### Docker Compose provided for easy startup

```
$ docker compose -f "docker-compose.yaml" up -d
```

Web-Application bound to :80

### To view the logs and console output

```
$ docker logs --tail 1000 -f <container_name>
```