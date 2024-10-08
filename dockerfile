# Usar una imagen de Nginx como base
FROM nginx:latest

# Copiar el contenido del build de React a la carpeta de Nginx
COPY ./build /usr/share/nginx/html

# Exponer el puerto 80 (puerto estándar de Nginx)
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
