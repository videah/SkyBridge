#!/bin/sh

# If the FLY_SWAP environment variable is set to true, enable swap.
# This is used to help prevent the server from crashing on low-memory fly.io instances.
if [ "$FLY_SWAP" = "true" ]; then
  echo "Enabling swapfile..."
  fallocate -l 512M /swapfile
  chmod 0600 /swapfile
  mkswap /swapfile
  echo 10 > /proc/sys/vm/swappiness
  swapon /swapfile
  echo 1 > /proc/sys/vm/overcommit_memory
fi

cd /app || exit

# Run any necessary database migrations.
npx --yes prisma migrate deploy

./bin/server