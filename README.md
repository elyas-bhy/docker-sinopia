## Sinopia (Docker Image)

Sinopia is a private npm repository server
current version 1.4.0

based on keyvanfatehi/docker-sinopia.git

### Installing Image

`docker pull so0k/sinopia:latest`

### Quickstart

```
docker run -d --name sinopia -h sinopia -p 4873:4873 so0k/sinopia:latest
docker logs sinopia

#to stop & remove
docker stop sinopia && docker rm sinopia
```

### Setting Registry

`npm set registry http://<docker_host>:4873/`

### Advanced Configuration

```
mkdir -p ~/sinopia/{storage,config}
# get default config file. It allows all users to do anything (modify for production)
curl -L https://raw.githubusercontent.com/rlidwka/sinopia/master/conf/default.yaml -o ~/sinopia/config/config.yaml
# edit config.yaml add listen: 0.0.0.0:4873 
vim ~/sinopia/config/config.yaml
#generate user passwords
htpasswd -c ~/sinopia/config/htpasswd admin
sudo chown -R 1000:1000 ~/sinopia/

#with docker compose:
(cd ~/sinopia/;docker-compose up -d)

#or manually:
cd ~
docker run --name npm -d -p 4873:4873 -h npm -v `pwd`/sinopia/config/:/opt/sinopia/config/ -v `pwd`/sinopia/storage/:/opt/sinopia/storage/ so0k/sinopia:latest
```

### Determining Username and Password

`docker logs sinopia`

### Modify configuration

`vim /var/sinopia/config.yaml`

## Links

* [Sinopia on Github](https://github.com/rlidwka/sinopia)
