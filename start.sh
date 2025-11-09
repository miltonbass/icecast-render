#!/bin/bash

# Asegurar que los directorios existen con permisos correctos
mkdir -p /var/log/icecast2
chown -R icecast2:icecast2 /var/log/icecast2
chown -R icecast2:icecast2 /etc/icecast2

# Iniciar Icecast como usuario icecast2
echo "Iniciando Icecast en Render.com..."
exec su - icecast2 -c "icecast2 -c /etc/icecast2/icecast.xml"