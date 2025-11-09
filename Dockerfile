FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario no-root
RUN useradd -r -s /bin/false -d /var/log/icecast2 icecastuser && \
    mkdir -p /var/log/icecast2 && \
    chown icecastuser:icecastuser /var/log/icecast2

# Copiar configuración
COPY icecast.xml /etc/icecast2/icecast.xml

# Asegurar permisos
RUN chown -R icecastuser:icecastuser /etc/icecast2

# Script de inicio que usa variable de entorno para el puerto
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Usar puerto dinámico (Render asigna automáticamente)
ENV PORT=10000
EXPOSE 10000

USER icecastuser

CMD ["/start.sh"]