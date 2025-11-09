#!/bin/bash

# Usar puerto de Render o default 8000
PORT=${PORT:-8000}

echo "Iniciando Icecast en puerto: $PORT"

# Actualizar configuración con puerto dinámico
sed -i "s/<port>8000<\/port>/<port>${PORT}<\/port>/" /etc/icecast2/icecast.xml

# Iniciar Icecast
exec icecast2 -c /etc/icecast2/icecast.xml