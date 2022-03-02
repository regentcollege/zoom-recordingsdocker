Here is a docker-compose.yml example: 

services:
  parking:
    image: ghcr.io/regentcollege/retreatdocker
    ports: 
       - '80:80'
    volumes:
      - /var/www/retreat:/var/www/retreat
