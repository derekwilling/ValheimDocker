# Valheim Docker Server

This repo contains the files necessary to get Valheim up and running in docker.

Prerequisites:

- **Edit the `docker-compose.yml` ENV variables before starting so that your server has a unique name and password!**
- Ensure that port forwarding has been configured on your local network to forward ports 2456, 2457, and 2458 through to your host.

After you clone this repo, create the following directory structure:

    ValheimDocker
    +-- valheim
        +-- data
        +-- server

- `data`: contains save file data from the server
- `server`: contains the server binaries

Start the server by running:

    docker-compose -f "docker-compose.yml" up -d --build

or build and run the docker image with

    docker build -t valheim .
    mkdir -p /opt/valheim/
    docker run -d --name=valheim \
    -v /opt/valheim/:/home/steam/valheim/ \
    -p 0.0.0.0:2456:2456/udp \
    -p 0.0.0.0:2457:2457/udp \
    -p 0.0.0.0:2458:2458/udp \
    -e SERVER_NAME="Valheim Docker" \
    -e SERVER_PORT=2456 \
    -e SERVER_PASSWORD="secret" \
    -e SERVER_WORLD="Dedicated" \
    valheim:latest

Thanks to https://github.com/CanadaBry/ValheimDocker for the help in the Valheim Discord.
