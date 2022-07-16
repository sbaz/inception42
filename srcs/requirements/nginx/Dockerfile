FROM	debian:buster

RUN 	apt-get -y update &&	\
    	apt-get -y upgrade &&	\
    	apt-get -yq install nginx	\
    	openssl	\
     	vim		\
     	procps

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509\
        -subj "/C=IT/ST=Lomazzo/L=Lomazzo/O=Lomazzo/OU=42/CN=localhost"\
        -keyout /etc/ssl/private/pceccoli_p.key\
        -out /etc/ssl/certs/pceccoli.crt &&\
        chmod 777 /etc/ssl/certs/pceccoli.crt /etc/ssl/private/pceccoli_p.key

COPY	./conf/default	/etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]