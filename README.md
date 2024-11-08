# docker-fabric-bounce-smp
Unraid container for BounceSMP Server 1.6.0 (Minecraft 1.18.2)

Modpack: https://www.curseforge.com/minecraft/modpacks/bouncesmp-public

# Usage

- Map the `/data` path to a local directory to preserve the world and configuration files.
- Set the `ACCEPT_EULA=true` environment variable to accept the Minecraft EULA.
- After the first run, config files will be generated in the `/data` directory. Edit the `server.properties` and `variables.txt` files as needed and restart the container. 



🧐