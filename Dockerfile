FROM debian
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev default-libmysqlclient-dev build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY django_tutorial /usr/share/app
WORKDIR /usr/share/app
RUN pip3 install --no-cache-dir -r requirements.txt && pip3 install mysqlclient
ENV SUPERUSER=admin
ENV SUPERPASSWORD=admin
ENV DATABASE_NAME=django
ENV DATABASE_USER=user
ENV DATABASE_PASSWORD=user
ENV DATABASE_HOST=server_mariadb
RUN chmod +x /usr/share/app/script.sh
CMD ["/usr/share/app/script.sh"]
