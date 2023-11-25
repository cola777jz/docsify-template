FROM nginx

# 映射 HTML
COPY ./docs ./usr/share/nginx/html
# Conf

COPY docs/conf/nginx.conf ./etc/nginx/conf.conf
COPY docs/conf/conf.d ./etc/nginx/conf.d

EXPOSE 82

