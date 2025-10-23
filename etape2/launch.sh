container http: docker container run -d -p 8080:80 --name http -v ./config:/etc/nginx/conf.d -v ./html:/app nginx
dans le dossier config se trouve le default.conf modifier
container script: docker container run -d --name script -v ./html:/var/www/html php:fpm 
dans le dossier html se trouve le index.php
docker network create linkstart (pour créer le network)
docker network connect linkstart http
docker network connect linkstart script

# récupération de l'image mariadb
docker pull mariadb:latest 
# container db: 
docker container run -d --name data -p 3306:3306 -e MARIADB_RANDOM_ROOT_PASSWORD='true' -v "$(pwd)/create.sql:/docker-entrypoint-initdb.d/create.sql" mariadb:latest

docker network connect linkstart data