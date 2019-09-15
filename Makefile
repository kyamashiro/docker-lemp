docker/start: docker-compose.yml
	docker-compose up -d

docker/build: docker-compose.yml
	docker-compose -f "docker-compose.yml" up -d --build

docker/stop:
	docker-compose stop

docker/re:
	docker-compose stop
	docker-compose up -d

docker/remove:
	docker-compose stop
	docker-compose rm

bash:
	docker exec -u www-data -it php-fpm bash

mysql/bash:
	docker exec -it mysql bash
