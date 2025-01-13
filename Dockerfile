# Dockerfile

# Usar la imagen base de Nixpacks
FROM nixpacks/build:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el binario de PocketBase a la imagen
COPY pocketbase /app/pocketbase

# Ejecuta la construcción con Nixpacks y coloca los artefactos en la carpeta de salida
RUN nixpacks build /app -o /output

# Imagen base liviana para ejecutar la aplicación
FROM debian:bullseye-slim

# Copia los artefactos construidos desde la primera fase
COPY --from=0 /output /

# Expone el puerto de la aplicación
EXPOSE 8090

# Ejecuta el comando para iniciar PocketBase
CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
