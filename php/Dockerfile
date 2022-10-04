# based on https://hub.docker.com/r/wodby/drupal6/dockerfile

FROM cespi/php-5.3
MAINTAINER Jigish-addweb
RUN apt-get update -y && apt-get install -y libpng12-dev libjpeg-dev --force-yes

RUN apt-get update && apt-get install -y  --force-yes \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd  \
	&& docker-php-ext-install  gd  mbstring pdo pdo_mysql  mysql mysqli 





WORKDIR /var/www/html

# # https://www.drupal.org/node/3060/release?api_version%5B%5D=87
# ENV DRUPAL_VERSION 6.38

# RUN curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
#     && tar -xz --strip-components=1 -f drupal.tar.gz \
#     && rm drupal.tar.gz \
#     && chown -R www-data:www-data sites

