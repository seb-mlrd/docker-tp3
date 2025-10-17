container http: docker container run -d -p 8080:80 --name http -v ./config:/etc/nginx/conf.d -v ./html:/app nginx
dans le dossier config se trouve le default.conf modifier
container script: docker container run -d --name script -v ./html:/var/www/html php:fpm 
dans le dossier html se trouve le index.php
docker network create linkstart (pour créer le network)
docker network connect linkstart http
docker network connect linkstart script
