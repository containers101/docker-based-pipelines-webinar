#!/usr/bin/env bash
wait_for_db() {
  nslookup mongo
  if ! nc -z mongo 27017; then
    echo "Waiting for db..."
    sleep 2
    wait_for_db
  fi
}

wait_for_db

cd /src
npm install
npm install -g mocha
npm test