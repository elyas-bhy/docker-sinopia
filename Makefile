rmi: stop-test
	docker rmi so0k/sinopia 2>&1 > /dev/null

build:
	docker build -t so0k/sinopia:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage so0k/sinopia:latest
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t so0k/sinopia:latest

shell: build
	docker run --rm -i -t so0k/sinopia:latest /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push so0k/sinopia:latest

test: start-test
