#!/bin/bash

# Archivo con los dominios, uno por línea
DOMINIOS_FILE="dominios.txt"

# Leer los dominios y unirlos en una sola línea
DOMINIOS=$(tr '\n' ' ' < "$DOMINIOS_FILE")

# Ejecutar mkcert con todos los dominios
mkcert -cert-file certs/local-cert.pem -key-file certs/local-key.pem $DOMINIOS

# Reiniciar contenedor de Traefik para que cargue el nuevo certificado
docker compose restart traefik