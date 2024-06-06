From php:8.3-cli

RUN apt-get -y update

# Install git
RUN apt-get -y install git

# Install pcov extension for code coverage
RUN pecl install pcov
RUN docker-php-ext-enable pcov

# Install unzip utility and libs needed by zip PHP extension
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip
RUN docker-php-ext-install zip

# Install composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"