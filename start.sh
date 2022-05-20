#!/bin/bash

set -e

# Note: update /etc/hosts separately, may require sudo privileges

# Install mkcert, assumes brew already installed
brew install mkcert

# # Initialize and create certificates
mkcert -install
mkdir -p ./nginx/certs
mkcert -key-file ./nginx/certs/react.test-key.pem -cert-file ./nginx/certs/react.test.pem react.test

# Run docker containers as daemons
docker-compose stop && docker-compose up -d --build

echo "Nginx started, please open the https://react.test. Ensure that the '127.0.0.1 react.test' exists in your '/private/etc/hosts' file."

# Open default browser
open https://react.test