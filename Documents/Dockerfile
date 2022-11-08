FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y  nginx wget php php7.4 php-fpm php7.4-mysql php7.4-soap php7.4-bcmath php7.4-xml php7.4-mbstring php7.4-gd php7.4-common php7.4-cli php7.4-curl php7.4-intl php7.4-zip zip unzip -y &&  apt install -y mysql-server mysql-client &&\
apt remove --purge apache2 -y && apt autoremove -y &&\
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" HASH="$(wget -q -O - https://composer.github.io/installer.sig)" php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
php composer-setup.php --install-dir=/usr/local/bin --filename=composer &&\
composer -V && nginx -t && rm -rf /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-{available,enabled}/default
COPY auth.json /root/.config/composer/auth.json
COPY php.ini /etc/php/7.4/fpm/php.ini
COPY php.dockerfile /
COPY default.conf  /etc/nginx/sites-available/
ENTRYPOINT ["/php.dockerfile"]
EXPOSE 80 22 9200
