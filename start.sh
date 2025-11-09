#!/bin/bash

# Crear directorio de logs si no existe
mkdir -p /var/log/icecast2

# Ajustar permisos
chown -R icecast2:icecast2 /var/log/icecast2
chown -R icecast2:icecast2 /etc/icecast2

# Iniciar Icecast
echo "Iniciando Icecast en Render.com..."
exec icecast2 -c /etc/icecast2/icecast.xml