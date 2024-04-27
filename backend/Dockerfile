FROM openjdk:17
COPY ./target/hirportal-0.0.1.jar app.jar
COPY ./server_entrypoint.sh /opt/server_entrypoint.sh
ENTRYPOINT /opt/server_entrypoint.sh
