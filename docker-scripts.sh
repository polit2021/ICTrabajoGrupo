#!/usr/bin/env bash
# Creamos el container de MySQL 
docker run -d --name poligran-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=poligran2021 mysql:latest


# Creamos el container de phpMyAdmin
# 
# --link permite acceso a la instancia de MySQL a la que se va a conectar
# según https://hub.docker.com/r/phpmyadmin/phpmyadmin/
# le pasamos el nombre con ":db" porque así lo va a ver dentro de la red
# ya que el contenedor de MySQL expone la db como un subrecurso con el nombre "db"
docker run -d \
    --name poligran-phpmyadmin \
    --link=poligran-mysql:db \
    -p 8080:80 \
    phpmyadmin/phpmyadmin:latest

