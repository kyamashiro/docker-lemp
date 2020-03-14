# Linux Nginx MySQL PHP7.4

```
# build Image.
$ make build
```

## SSL

- install mkcert  
  https://github.com/FiloSottile/mkcert

```sh
mkcert --install
mkcert localhost
```

- add cert file  
  ./nginx/ssl/localhost.pem  
  ./nginx/ssl/localhost-key.pem
