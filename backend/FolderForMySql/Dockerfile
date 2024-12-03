# Alap MySQL image verzióval
FROM mysql:8.0

# Kötelező környezeti változók beállítása
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=adatbazisnev
ENV MYSQL_USER=felhasznalonev
ENV MYSQL_PASSWORD=jelszo

# Az init.sql fájl másolása az image-be
COPY fakenews.sql /docker-entrypoint-initdb.d/

# MySQL alapértelmezett portjának megnyitása
EXPOSE 3306



