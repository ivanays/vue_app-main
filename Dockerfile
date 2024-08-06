# Используем официальный образ Nginx
FROM nginx:latest

LABEL description="This is a custom Nginx for GitLab Ci/CD test"

# Копируем файл index.html в директорию по умолчанию Nginx
COPY index.html /usr/share/nginx/html/
RUN mkdir /usr/share/nginx/html/vue/
COPY vue_app/index.html /usr/share/nginx/html/vue/
COPY vue_app/public/favicon.ico /usr/share/nginx/html/vue/
RUN mkdir /usr/share/nginx/html/vue/assets/

COPY vue_app/src/assets/* /usr/share/nginx/html/vue/assets/
COPY vue_app/src/assets/* /usr/share/nginx/html/assets/

# EXPOSE 80 - указывает на то, что контейнер будет слушать порт 80
EXPOSE 80

# Установка прав доступа
RUN chown -R www-data:www-data /usr/share/nginx/html