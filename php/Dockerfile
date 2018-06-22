FROM php:7.2-fpm

MAINTAINER Sergey <sergey@ml1000.net>

ARG WEB_USER
ARG WEB_GROUP
ARG PHP_DIR

COPY www.conf ${PHP_DIR}/php-fpm.d/www.conf

#Install dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    zlib1g-dev \
    git \
    libicu-dev \
    libmcrypt-dev \
    libpq-dev \
    libxml2-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    g++ \
    mysql-client \
    #Composer install
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
    && docker-php-ext-install gd

RUN useradd -m user && \
        echo "user:user" | chpasswd && \
        usermod --shell /bin/bash user && \
        usermod -aG sudo user && \
        mkdir /etc/sudoers.d && \
        echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/user && \
        chmod 0440 /etc/sudoers.d/user && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 user && \
        groupmod --gid 1000 user && \
        chgrp -R staff ${PHP_DIR}/php-fpm.d/www.conf
