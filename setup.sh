# based on https://hub.docker.com/r/wodby/drupal6/dockerfile
FROM orsolin/docker-php-5.3-apache



# RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update -y && apt-get install -y libpng12-dev libjpeg-dev --force-yes

RUN apt-get update && apt-get install -y  --force-yes \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd  \
	&& docker-php-ext-install  gd  mbstring pdo pdo_mysql  mysql mysqli 

#--with-freetype --with-jpeg
# RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
#     && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql mysql mysqli 




WORKDIR /var/www/html
