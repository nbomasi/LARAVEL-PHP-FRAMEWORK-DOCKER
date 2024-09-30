# Base image
FROM php:7.4-cli
# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libonig-dev \
    libzip-dev \
    unzip

# Install PHP extensions using docker-php-ext-install
RUN docker-php-ext-install \
    gd \
    mysqli \
    pdo_mysql \
    mbstring \
    xml \
    curl \
    zip \
    opcache 
    # Install Composer
COPY . .

#RUN mv .env.sample .env
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install \
    && php artisan config:clear \
    && chown -R www-data:www-data /var/www/html

USER www-data

# Expose port 8000
EXPOSE 8000

# Run the Laravel development server
CMD ["bash", "start-apache.sh"]

