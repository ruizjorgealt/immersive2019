FROM ubuntu:xenial

# Set UTC
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen en_US.UTF-8 \

# software-properties-common & python-software-properties to install apt-add-repository 
  && apt-get install -y software-properties-common python-software-properties \
  && apt-get update \

# Add PHP repository
  && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
  && add-apt-repository ppa:jonathonf/backports \
  && apt-get update \ 

# Install LAMP stack
  && apt-get install -y \
    apache2 \
    git \ 
    php7.3 \
    vim \  

# Enable apache mods
  && a2enmod headers \ 
  && a2enmod php7.3 

# Set environment variables
ENV APACHE_RUN_USER=www-data \
  APACHE_RUN_GROUP=www-data \
  APACHE_LOG_DIR=/var/log/apache2 \
  APACHE_PID_FILE=/var/run/apache2.pid \
  APACHE_RUN_DIR=/var/run/apache2 \
  APACHE_LOCK_DIR=/var/lock/apache2

# Create directories
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR \

# Chown directories owned by apache
  && chown -hR www-data:www-data /var/www/ 

# Set /var/www/ as working directory
WORKDIR /var/www/

# Expose port 80
EXPOSE 80

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD ["apache2", "-D", "FOREGROUND"]
