FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configuración mínima sin usuarios personalizados
COPY icecast-simple.xml /etc/icecast2/icecast.xml

# Crear directorio de logs
RUN mkdir -p /var/log/icecast2

EXPOSE 8000

# Ejecutar directamente (aceptando ejecutar como root para testing)
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]