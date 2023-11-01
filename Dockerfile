# Official Dart image: https://hub.docker.com/_/dart
# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.17)
FROM dart:stable AS build

WORKDIR /app

# Resolve app dependencies.
COPY pubspec.* ./
RUN dart pub get
RUN dart pub global activate dart_frog_cli

# Copy app source code and AOT compile it.
COPY . .

# Install Node.js LTS.
RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
     | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
    NODE_MAJOR=18; \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" \
     > /etc/apt/sources.list.d/nodesource.list; \
    apt-get -qy update; \
    apt-get -qy install nodejs;

RUN npm i prisma@4.16.2
RUN npx prisma generate

# Generate a production build.
RUN dart pub global activate dart_frog_cli 0.3.8
RUN dart pub global run dart_frog_cli:dart_frog build

# Ensure packages are still up-to-date if anything has changed.
RUN dart pub get --offline
RUN dart compile exe build/server/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM dart:stable AS runtime

RUN set -uex; \
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
     | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
    NODE_MAJOR=18; \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" \
     > /etc/apt/sources.list.d/nodesource.list; \
    apt-get -qy update; \
    apt-get -qy install nodejs;

RUN npm i prisma@4.16.2

COPY --from=odroe/prisma-dart:latest / /runtime
COPY --from=build /app/build/bin/server /app/bin/
COPY --from=build /app/build/public /app/public/
COPY --from=build /app/entrypoint.sh /app/
COPY --from=build /app/prisma /app/prisma
COPY --from=build /app/node_modules/prisma/query-engine-* /app/bin/

# Start the server.
CMD ["/app/entrypoint.sh"]