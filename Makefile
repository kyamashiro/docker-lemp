start:
	docker compose up -d

stop:
	docker compose stop

restart:
	@make stop
	@make start

build:
	docker compose up -d --build

rebuild:
	docker compose build --no-cache --force-rm

remove:
	docker compose rm -s -v

bash:
	docker exec -it --user 1000 php-fpm bash

mysql:
	docker exec -it mysql bash -c 'mysql -u root -p$$MYSQL_ROOT_PASSWORD'

web:
	docker exec -it nginx bash

logs:
	docker compose logs -f