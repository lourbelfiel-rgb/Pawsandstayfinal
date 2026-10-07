#!/bin/bash
set -e

# Railway dynamically assigns a PORT — Apache must listen on it
PORT="${PORT:-80}"

# Update Apache to listen on the assigned port
sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-enabled/000-default.conf

echo "Starting Apache on port ${PORT}..."
exec apache2-foreground
