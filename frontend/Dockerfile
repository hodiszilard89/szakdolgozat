
FROM alpine:latest

ENV SERVER_HOST=localhost

RUN apk update && apk add --no-cache nginx

COPY ./build/ /usr/share/nginx/html/


RUN cat > /etc/nginx/http.d/default.conf <<EOF
server {    

            listen 3000;    
            server_name example.com;
            root /usr/share/nginx/html;
            index index.html;

        }
EOF

          
EXPOSE 3000


CMD ["nginx", "-g", "daemon off;"]