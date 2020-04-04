start:
	docker-compose up -d

build:
	docker-compose -f "docker-compose.yml" up -d --build

stop:
	docker-compose stop

restart:
	docker-compose stop
	docker-compose up -d

remove:
	docker-compose stop
	docker-compose rm

bash:
	docker exec -u www-data -it php-fpm bash

mysql:
	docker exec -it mysql bash
