# based on https://hub.docker.com/r/wodby/drupal6/dockerfile

FROM php:7.1-fpm-alpine
MAINTAINER Jigish-addweb

RUN set -eux \
    && apk add --no-cache \
        c-client \
        ca-certificates \
        freetds \
        freetype \
        gettext \
        gmp \
        icu-libs \
        imagemagick \
        imap \
        libffi \
        libgmpxx \
        libintl \
        libjpeg-turbo \
        libmcrypt \
        libpng \
        libpq \
        libssh2 \
        libstdc++ \
        libtool \
        libxpm \
        libxslt \
        libzip \
        make \
        rabbitmq-c \
        tidyhtml \
        tzdata \
        vips \
        yaml

RUN set -eux \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        bzip2-dev \
        cmake \
        curl-dev \
        freetds-dev \
        freetype-dev \
        gcc \
        gettext-dev \
        git \
        gmp-dev \
        icu-dev \
        imagemagick-dev \
        imap-dev \
        krb5-dev \
        libc-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libssh2-dev \
        libwebp-dev \
        libxml2-dev \
        libxpm-dev \
        libxslt-dev \
        libzip-dev \
        linux-headers \
        openssl-dev \
        pcre-dev \
        pkgconf \
        postgresql-dev \
        rabbitmq-c-dev \
        tidyhtml-dev \
        vips-dev \
        yaml-dev \
        zlib-dev \


# Install gd
    && ln -s /usr/lib/x86_64-linux-gnu/libXpm.* /usr/lib/ \
    && docker-php-ext-configure gd \
        --enable-gd \
        --with-webp \
        --with-jpeg \
        --with-xpm \
        --with-freetype \
        --enable-gd-jis-conv \
    && docker-php-ext-install -j$(nproc) gd \
    && true \
\
# Install amqp
    && echo "/usr" | pecl install amqp \
    && docker-php-ext-enable amqp \
    && true \
\
# Install apcu
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && true \
\
# Install gettext
    && docker-php-ext-install -j$(nproc) gettext \
    && true \
\
# Install gmp
    && docker-php-ext-install -j$(nproc) gmp \
    && true \
\
# Install bcmath
    && docker-php-ext-install -j$(nproc) bcmath \
    && true \
\
# Install bz2
    && docker-php-ext-install -j$(nproc) bz2 \
    && true \
\
# Install exif
    && docker-php-ext-install -j$(nproc) exif \
    && true \
\
# Install imap
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl --with-imap \
    && docker-php-ext-install -j$(nproc) imap \
    && true \
\
# Install imagick
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && true \
\
# Install intl
    && docker-php-ext-install -j$(nproc) intl \
    && true \
\

# Install xmlrpc
    && docker-php-ext-configure xmlrpc --with-iconv-dir=/usr \
    && docker-php-ext-install -j$(nproc) xmlrpc \
    && true \
\
# Install memcache
    && pecl install memcache-4.0.5.2 \
    && docker-php-ext-enable memcache \
    && true \
\

# Install mysqli
    && docker-php-ext-install -j$(nproc) mysqli \
    && true \
\
# Install oauth
    && pecl install oauth \
    && docker-php-ext-enable oauth \
    && true \
\
# Install pdo_mysql
    && docker-php-ext-configure pdo_mysql --with-zlib-dir=/usr \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && true \
\
# Install pdo_dblib
    && docker-php-ext-install -j$(nproc) pdo_dblib \
    && true \
\
# Install pcntl
    && docker-php-ext-install -j$(nproc) pcntl \
    && true \
\
# Install pdo_pgsql
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && true \
\
# Install pgsql
    && docker-php-ext-install -j$(nproc) pgsql \
    && true \
\

# Install sockets, sysvmsg, sysvsem, sysvshm (also needed by swoole)
    && docker-php-ext-install -j$(nproc) \
        sockets \
        sysvmsg \
        sysvsem \
        sysvshm \
    && docker-php-source extract \
    && true \

# Install zip
    && docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install -j$(nproc) zip \
    && true 




WORKDIR /var/www/html

# # https://www.drupal.org/node/3060/release?api_version%5B%5D=87
# ENV DRUPAL_VERSION 6.38

# RUN curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
#     && tar -xz --strip-components=1 -f drupal.tar.gz \
#     && rm drupal.tar.gz \
#     && chown -R www-data:www-data sites

