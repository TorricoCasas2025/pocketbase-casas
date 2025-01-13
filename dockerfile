FROM alpine:3.15

# Copia el archivo pocketbase al contenedor
COPY pocketbase /root/pocketbase

# Cambia el directorio de trabajo
WORKDIR /root

# Da permisos de ejecución a pocketbase
RUN chmod +x /root/pocketbase

# Expone el puerto 8090
EXPOSE 8090

# Ejecuta pocketbase
CMD ["/root/pocketbase", "serve", "--http", "0.0.0.0:8090"]