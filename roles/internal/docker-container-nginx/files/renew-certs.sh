#/bin/bash

docker stop nginx
sudo certbot renew
docker start nginx
