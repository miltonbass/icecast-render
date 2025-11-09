FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio de logs
RUN mkdir -p /var/log/icecast2 && \
    chown -R icecast2:icecast2 /var/log/icecast2

# Copiar configuración
COPY icecast.xml /etc/icecast2/icecast.xml

# Asegurar permisos
RUN chown -R icecast2:icecast2 /etc/icecast2

EXPOSE 8000

# Ejecutar como usuario icecast2
USER icecast2
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]