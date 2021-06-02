#!/usr/bin/env bash
#Este script se debe ejecutar como ROOT


docker network create poligran


 
# Creamos el container de MySQL 
docker run -d \
    --name poligran-mysql \
    --network poligran \
    -e MYSQL_ROOT_PASSWORD="poligran2021" \
    -e MYSQL_USER="poligran"\
    -p 3306:3306 \
    mysql:latest


# Creamos el container de phpMyAdmin
# 
# PMA_HOST es el dominio de la instancia de MySQL a la que se va a conectar
# según https://hub.docker.com/r/phpmyadmin/phpmyadmin/
# le pasamos el nombre porque así lo va a ver dentro de la red
docker run -d \
    --name poligran-phpmyadmin \
    --network poligran \
    -e PMA_HOST=poligran-mysql \
    -p 8080:80 \
    phpmyadmin/phpmyadmin:latest

