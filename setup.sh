#!/bin/sh
docker-compose up -d
sudo chown -R $USER:www-data ./drupal

cd drupal  && git clone https://github.com/d6lts/drupal.git .
sudo cp ./sites/default/default.settings.php ./sites/default/settings.php
sudo chown -R $USER:www-data *
sudo chmod -R 775 *
