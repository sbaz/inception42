FROM	debian:buster

RUN		apt-get update -y &&\
		apt-get upgrade -y
RUN		apt-get -y install php7.3\
		php-fpm\
		php-mysql\
		mariadb-client\
		wget\
		curl

# wordpress 다운받기
RUN		wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www
RUN		cd /var/www &&\
		tar -xvf wordpress-5.9.2.tar.gz &&\
		rm wordpress-5.9.2.tar.gz

#  config file 복사하기
COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

# wordpress에게 /var/www/wordpress 소유권 넘겨주기
RUN		chown -R root:root /var/www/wordpress

# wordpress-client 다운받기
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp

# run.sh로 wordpress 시작하기
COPY	./tools/run.sh /
ENTRYPOINT ["bash", "run.sh"]