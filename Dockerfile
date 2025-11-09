FROM ubuntu:22.04

# Evitar preguntas interactivas durante instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario y grupo icecast2 (no se crean automáticamente)
RUN groupadd -r icecast2 && \
    useradd -r -g icecast2 icecast2

# Crear directorio de logs
RUN mkdir -p /var/log/icecast2 && \
    chown -R icecast2:icecast2 /var/log/icecast2

# Copiar configuración personalizada
COPY icecast.xml /etc/icecast2/icecast.xml
COPY start.sh /start.sh

# Dar permisos de ejecución
RUN chmod +x /start.sh

# Exponer puerto de Icecast
EXPOSE 8000

# Comando de inicio
CMD ["/start.sh"]