#!/bin/bash
php artisan migrate  
APP_KEY=$(php artisan key:generate --show)
#php artisan cache:clear
#php artisan config:clear
#php artisan route:clear
php artisan serve  --host=0.0.0.0  
