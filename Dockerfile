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

ENTRYPOINT ["/entrypoint.sh"]
