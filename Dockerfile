FROM nginx:latest
 
RUN echo 'server {\n\
    listen       80 default_server;\n\
    server_name  _;\n\
    root         /usr/share/nginx/html;\n\
    location / {\n\
        index index.html index.htm;\n\
        if (!-e $request_filename) {\n\
            rewrite ^/(.*) /index.html last;\n\
            break;\n\
        }\n\
    }\n\
    error_page 404 /404.html;\n\
        location = /40x.html {\n\
    }\n\
    error_page 500 502 503 504 /50x.html;\n\
        location = /50x.html {\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf
 
#USER nginx
COPY ./ /usr/share/nginx/html/