FROM openjdk:17-alpine
RUN apk add --no-cache netcat-openbsd
RUN  mkdir -m 777 /uploads
COPY /uploads uploads
COPY ./target/hirportal-0.0.1.jar app.jar
COPY server_entrypoint.sh /opt/server_entrypoint.sh
ENTRYPOINT /opt/server_entrypoint.sh
