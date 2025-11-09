FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario no-root para icecast (diferente al usuario del sistema)
RUN useradd -r -s /bin/false -d /var/log/icecast2 icecastuser && \
    mkdir -p /var/log/icecast2 && \
    chown icecastuser:icecastuser /var/log/icecast2

# Copiar configuración
COPY icecast.xml /etc/icecast2/icecast.xml

# Asegurar permisos
RUN chown -R icecastuser:icecastuser /etc/icecast2

EXPOSE 8000

# Cambiar a usuario no-root
USER icecastuser

# Ejecutar icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]