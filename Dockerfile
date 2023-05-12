# Isar does not provided prebuilt linux/arm64 binaries so we need to build it
# ourselves. This only happens on linux/arm64.
FROM --platform=linux/arm64 rust:slim-bullseye AS isar

# Install libclang, needed for libmdbx-rs
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends --ignore-missing \
        build-essential libclang-dev wget unzip git

WORKDIR /app

# Download Isar source code.
RUN wget https://github.com/isar/isar/archive/refs/tags/3.1.0+1.zip
RUN unzip 3.1.0+1.zip

# Extract and build Isar.
WORKDIR /app/isar-3.1.0-1
RUN chmod +x tool/build_linux.sh
RUN tool/build_linux.sh

# On linux/amd64 we can use the official binaries.
# I did try to have it build on both platforms for completeness but there is actually
# an issue with a dependency that prevents it from compiling on x86 in a docker container.
# The joys of computers. Here is a relevant github issue on the dependency repo:
# https://github.com/vorot93/libmdbx-rs/issues/13
FROM --platform=linux/amd64 bitnami/minideb:bullseye AS isar
WORKDIR /app/isar-3.1.0-1
RUN install_packages wget ca-certificates
RUN wget https://github.com/isar/isar/releases/download/3.1.0%2B1/libisar_linux_x64.so

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

# Generate a production build.
RUN dart pub global run dart_frog_cli:dart_frog build

# Ensure packages are still up-to-date if anything has changed.
RUN dart pub get --offline
RUN dart compile exe build/server/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM bitnami/minideb:bullseye

# Needed for Isar to run.
RUN install_packages libgcc-s1

COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/
COPY --from=build /app/build/public /public/

# Get our Isar library from the previous stage.
COPY --from=isar /app/isar-3.1.0-1/*.so /app/bin/

# Start the server.
CMD ["/app/bin/server"]