FROM php:7.4-fpm

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN apt update -yqq && apt install -yqq \
    git \
    wget \
    zip \
    unzip \
    vim \
    cron \
    default-mysql-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php'); unlink('installer.sig');" \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repos.packagist composer https://packagist.jp \
    && composer global require hirak/prestissimo

# mysql driver
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install pdo_mysql opcache

# cron
ADD ./cron.d /etc/cron.d
RUN touch /var/log/cron.log && chmod 0644 /etc/cron.d/*
CMD cron && docker-php-entrypoint php-fpm

RUN usermod -u 1000 www-data && chown -R www-data:www-data /var/www
