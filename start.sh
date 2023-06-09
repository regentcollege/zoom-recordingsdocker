#!/usr/bin/env bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

if [ "$env" != "local" ]; then
    echo "Caching configuration..."
    (cd /var/www/zoom-recordings/current && php artisan config:cache && php artisan view:cache)
fi

if [ "$role" = "app" ]; then

    exec apache2-foreground

elif [ "$role" = "queue" ]; then

    exec supervisord

elif [ "$role" = "scheduler" ]; then

    while [ true ]
    do
      php /var/www/zoom-recordings/current/artisan schedule:run --verbose --no-interaction &
      sleep 60
    done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi
