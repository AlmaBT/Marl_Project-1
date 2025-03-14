FROM nginx
ADD ./coffeshop-html /usr/share/nginx/html
RUN apt update -y
RUN apt upgrade -y
RUN apt install nano -y
 