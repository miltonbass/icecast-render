FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar Icecast sin iniciar servicios
RUN apt-get update && \
    apt-get install -y --no-install-recommends icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear directorio de logs
RUN mkdir -p /var/log/icecast2

# Copiar configuración
COPY icecast.xml /etc/icecast2/icecast.xml

EXPOSE 8000

# Ejecutar icecast directamente (sin preocuparnos por el usuario)
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]