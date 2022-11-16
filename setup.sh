#!/bin/bash
docker-compose up -d
sudo chown -R $USER:www-data ./drupal
read -s -p "Enter Git-UserName: " gituser 
echo
read -s -p "Enter Git-Token: " gittoken 


cd drupal  && git clone https://$gituser:$gittoken@github.com/nightlifemedia/UNL_Drupal.git .
sudo cp ./sites/default/default.settings.php ./sites/default/settings.php
sudo chown -R $USER:www-data *
sudo chmod -R 775 *
