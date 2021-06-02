#!/usr/bin/env bash
# Creamos el container de MySQL 
docker run -d --name poligran-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=poligran2021 mysql:latest


# Creamos el container de phpMyAdmin
# 
# PMA_HOST es el dominio de la instancia de MySQL a la que se va a conectar
# según https://hub.docker.com/r/phpmyadmin/phpmyadmin/
# le pasamos el nombre porque así lo va a ver dentro de la red
docker run -d \
    --name poligran-phpmyadmin \
    --link=poligran-mysql:db \
    -p 8080:80 \
    phpmyadmin/phpmyadmin:latest

