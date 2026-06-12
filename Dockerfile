FROM nginx:stable

COPY /template/. /usr/share/nginx/html/.

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
