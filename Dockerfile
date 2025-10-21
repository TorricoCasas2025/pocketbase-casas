# ...existing code...
# Usar la imagen base de Debian
FROM debian:bullseye-slim


# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY . /app

# Da permisos de ejecución al binario de PocketBase
RUN chmod +x /app/pocketbase

# Exponer el puerto especificado para PocketBase
EXPOSE 8090

# Comando para iniciar PocketBase
CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
# ...existing code...