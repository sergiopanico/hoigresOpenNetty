# Runs the pre-built OpenNetty daemon trial build from ./test (kevinchalet/opennetty-core@myhomeserver1_f523),
# instead of compiling the project from source.
FROM debian:trixie-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends libicu76 ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin/opennetty

COPY test/opennetty-daemon ./opennetty-daemon
COPY test/appsettings.json ./appsettings.json

RUN chmod +x ./opennetty-daemon

ENTRYPOINT ["./opennetty-daemon"]
