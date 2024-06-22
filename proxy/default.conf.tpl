server {
    listen ${LISTEN_PORT};

    location /static/static {
        alias /vol/static;
    }

    location /static/media {
        alias /vol/media;
    }

    location / {
        include                 gunicorn_headers;
        proxy_redirect          off;
        proxy_pass              http://${APP_HOST}:${APP_PORT};
        # uwsgi_pass            ${APP_HOST}:${APP_PORT};
        # include               /etc/nginx/uwsgi_params;
        client_max_body_size    10M;
    }
}
