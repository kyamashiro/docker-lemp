# Docker LEMP開発環境 
## Linux Nginx MySQL PHP7.4 Redis

```
# build image.
$ make build
# start container
$ make start
# stop container
$ make stop
# restart container
$ make restart
# remove image
$ make remove
```

## SSL化

- install mkcert  
  https://github.com/FiloSottile/mkcert

```sh
mkcert --install
mkcert localhost
```

- add cert file  
  ./nginx/ssl/localhost.pem  
  ./nginx/ssl/localhost-key.pem

- enable ssl nginx conf file in docker-compose.yml
```
  ### Nginx ##############################################
  nginx:
    image: nginx:1.17.9-alpine
    container_name: nginx
    ports:
      - 80:80
      - 443:443
    volumes:
      # - ./nginx/nossl.default.conf.template:/etc/nginx/conf.d/default.conf.template
      # SSL化用
      - ./nginx/default.conf.template:/etc/nginx/conf.d/default.conf.template
      - ./nginx/ssl:/etc/nginx/ssl
      - ./workspace:/var/www/html
    environment:
      - PHP_APP_HOST=php-fpm
    command: /bin/sh -c "envsubst '$$PHP_APP_HOST' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
```
