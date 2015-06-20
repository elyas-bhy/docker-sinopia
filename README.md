## Sinopia (Docker Image)

Sinopia is a private npm repository server

### Installing Image

`docker pull so0k/sinopia:latest`

### Creating Container

```
mkdir -p /var/sinopia/storage
# get default config file. It allows all users to do anything (modify for production)
curl -L https://raw.githubusercontent.com/rlidwka/sinopia/master/conf/default.yaml -o /var/sinopia/config.yaml
vim /var/sinopia/config.yaml
docker run --name sinopia -d -p 4873:4873 -h npm \
    -v /var/sinopia/config.yaml:/opt/sinopia/config.yaml -v /var/sinopia/storage:/opt/sinopia/storage  \
    so0k/sinopia:latest
```

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

`vim /var/sinopia/config.yaml`

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
