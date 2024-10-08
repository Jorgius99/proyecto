# Fase 1: Construcción del build de React
# Usar una imagen de Node.js para construir la aplicación de React
FROM node:16 AS build

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar los archivos package.json y package-lock.json a la imagen
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos de la aplicación
COPY . .

# Construir la aplicación de React
RUN npm run build

# Fase 2: Servir con Nginx
# Usar una imagen de Nginx como base
FROM nginx:latest

# Copiar el contenido del build de React a la carpeta de Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto 80 (puerto estándar de Nginx)
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
