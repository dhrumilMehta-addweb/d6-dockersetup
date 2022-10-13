FROM php:5.6-fpm

MAINTAINER Torchbox Sysadmin <sysadmin@torchbox.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libssl-dev \
        libmemcached-dev \
        libz-dev \
        zlib1g-dev \
        libsqlite3-dev \
        zip \
        libxml2-dev \
        libcurl3-dev \
        libedit-dev \
        libpspell-dev \
        libldap2-dev \
        unixodbc-dev \
        libpq-dev

# https://bugs.php.net/bug.php?id=49876
RUN ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

RUN echo "Installing PHP extensions" \
    && docker-php-ext-install iconv mcrypt gd pdo_mysql pdo_pgsql pcntl zip bcmath simplexml xmlrpc soap pspell ldap mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-enable iconv mcrypt gd pdo_mysql pdo_pgsql pcntl zip bcmath simplexml xmlrpc soap pspell ldap mbstring \
    # && git clone https://github.com/php-memcached-dev/php-memcached.git /usr/src/php/ext/memcached \
    # && cd /usr/src/php/ext/memcached \
    # && docker-php-ext-configure memcached \
    # && docker-php-ext-install memcached \
    && pecl install memcached-2.2.0 \ 
    && docker-php-ext-enable memcached \
    && apt-get autoremove -y \
    && dpkg -la | awk '{print $2}' | grep '\-dev' | xargs apt-get remove -y \
    && apt-get clean all \
    && rm -rvf /var/lib/apt/lists/* \
    && rm -rvf /usr/share/doc /usr/share/man /usr/share/locale \
    && rm -fv /usr/local/etc/php-fpm.d/*.conf \
    && rm -rvf /usr/src/php
# RUN  pecl install memcached-2.2.0 \
# 	&& docker-php-ext-enable memcached
# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH

# Install drush
RUN curl -Lo /usr/local/bin/drush https://github.com/drush-ops/drush/releases/download/8.3.0/drush.phar && \
chmod a+x /usr/local/bin/drush

# Clean up, try to reduce image size (much as you can on Debian..)
RUN apt-get autoremove -y \
&& apt-get clean all \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /usr/share/doc /usr/share/man /usr/share/locale \
&& rm -f /usr/local/etc/php-fpm.d/*.conf \
&& rm -rf /usr/src/php

WORKDIR /var/www/html

EXPOSE 9000
