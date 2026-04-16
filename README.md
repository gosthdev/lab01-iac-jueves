# lab01-iac-jueves


A. Levantar con Docker Compose:

Desde la raiz del proyecto:

docker compose up -d --build


B. Levantar con Dockerfile 

Desde la raiz del proyecto:

1. web01

docker build -t lab/web01 ./src/web01

docker run -p 4001:80 lab/web01

2. web02

docker build -t lab/web02 ./src/web02

docker run -p 4002:80 lab/web02

URLs:
- web01: http://localhost:4001
- web02: http://localhost:4002
