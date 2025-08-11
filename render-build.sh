#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
composer install --prefer-dist --no-dev --no-progress --no-interaction

# Build production assets (if using Webpack Encore/AssetMapper)
php bin/console asset-map:compile
# OR for Webpack Encore: yarn install && yarn build

# Run database migrations
php bin/console doctrine:migrations:migrate --no-interaction