FROM porchn/php5.6-apache


 RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update -y && apt-get install -y  libjpeg-dev --force-yes

RUN apt-get update && apt-get install -y  --force-yes \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd  \
	&& docker-php-ext-install  gd  mbstring pdo pdo_mysql  mysql mysqli 
# RUN pear config-set php_ini /etc/php5/apache2/php.in
# RUN  apt-get install -y libz-dev libmemcached-dev 
# RUN  mkdir -p  /usr/local/etc/php/conf.d
# RUN pecl install memcached-2.2.0 && \
#     echo extension=memcached.so > /usr/local/etc/php/conf.d/memcached.ini 

COPY php.ini /etc/php5/apache2/

# Install drush
RUN curl -Lo /usr/local/bin/drush https://github.com/drush-ops/drush/releases/download/8.3.0/drush.phar && \
chmod a+x /usr/local/bin/drush
WORKDIR /var/www/html
