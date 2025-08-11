
FROM php:8.2-apache


RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libpq-dev libzip-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip opcache


RUN a2enmod rewrite


COPY . /var/www/html


WORKDIR /var/www/html


COPY --from=composer:2 /usr/bin/composer /usr/bin/composer


RUN composer install --no-dev --optimize-autoloader


RUN chown -R www-data:www-data var

