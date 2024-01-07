FROM composer:2 as composer

FROM php:8.3.1-fpm-alpine

WORKDIR /app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
    /usr/local/bin/

COPY files/ /
COPY --from=composer /usr/bin/composer /usr/local/bin/composer
COPY app/ /app

RUN apk add --no-cache bash~=5 \
    && chmod +x /usr/local/bin/install-php-extensions \
    && install-php-extensions mongodb \
    && composer install --no-dev --no-suggest --no-progress

ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh"]
CMD ["php", "/app/index.php"]
