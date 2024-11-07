FROM openjdk:17-slim
RUN apt-get update && apt-get install -y curl unzip bash nano && apt-get clean

# Download and extract server files
RUN curl -o /server.zip -L "https://www.curseforge.com/api/v1/mods/711776/files/4876569/download" && \
    mkdir /server && \
    unzip /server.zip -d /server && \
    rm /server.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chmod +x /server/start.sh

# env's for retaining data paths
ENV WORLD_DIR=/data/world
ENV CONFIG_DIR=/data/config
ENV CRASH_REPORTS_DIR=/data/crash-reports
ENV LOGS_DIR=/data/logs
ENV WHITELIST_FILE=/data/whitelist.json
ENV OPS_FILE=/data/ops.json
ENV BANNED_PLAYERS_FILE=/data/banned-players.json
ENV BANNED_IPS_FILE=/data/banned-ips.json
ENV SERVER_PROPERTIES_FILE=/data/server.properties

ENTRYPOINT ["/entrypoint.sh"]
