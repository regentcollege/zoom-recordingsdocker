Here is a docker-compose.yml example: 

services:
  parking:
    image: regentcollege/retreat
    ports: 
       - '80:80'
    volumes:
      - /var/www/parking:/var/www/retreat
