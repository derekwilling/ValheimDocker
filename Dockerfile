FROM cm2network/steamcmd:latest
LABEL Name=valheimdocker Version=0.0.1
# RUN ./steamcmd.sh +login anonymous +force_install_dir ./valheim +app_update 896660 +quit
WORKDIR /home/steam
COPY server.sh .
ENTRYPOINT [ "sh", "/home/steam/server.sh" ]
EXPOSE 2456-2458/udp