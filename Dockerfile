FROM freyrus/base-php7.0

MAINTAINER gialac <gialacmail@gmail.com>

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -
RUN sudo apt-get install -y nodejs libnotify-bin
RUN npm install -g gulp

ADD .               /var/www
WORKDIR             /var/www
USER www-data

#RUN composer install

EXPOSE 80

# Clean up APT when done.
USER root
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*