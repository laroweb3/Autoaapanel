#!/bin/bash

# Actualizar el sistema
sudo apt-get update && sudo apt-get upgrade -y

# Instalar curl y wget
sudo apt-get install -y curl wget

# Descargar el script de instalación de aaPanel
URL=https://www.aapanel.com/script/install_7.0_en.sh
if [ -f /usr/bin/curl ]; then
    curl -ksSO "$URL"
else
    wget --no-check-certificate -O install_7.0_en.sh "$URL"
fi

# Dar permisos de ejecución al script
chmod +x install_7.0_en.sh

# Ejecutar el script de instalación de aaPanel
# Se utiliza 'yes' para responder 'Y' automáticamente
yes | sudo bash install_7.0_en.sh aapanel

# Obtener la IP del servidor
IP=$(hostname -I | awk '{print $1}')

# Mostrar información de acceso
echo "=================================================================="
echo "aaPanel se ha instalado con éxito!"
echo "=================================================================="
echo "Dirección IP de acceso: $IP"
echo "Usuario: admin"
echo "Contraseña: $(cat /www/server/panel/default.pl)"
echo "=================================================================="