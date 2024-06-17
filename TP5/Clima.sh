#!/bin/bash


read -p "Ingrese el nombre de una ciudad para conocer su clima actual: " ciudad

API_KEY="tu_clave_de_api_aqui"

URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${ciudad}"

response=$(curl -s $URL)

if [ $? -ne 0 ]; then
  echo "Error al obtener la información del clima."
  exit 1
fi

location=$(echo $response | jq -r '.location.name')
region=$(echo $response | jq -r '.location.region')
country=$(echo $response | jq -r '.location.country')
temp_c=$(echo $response | jq -r '.current.temp_c')
condition=$(echo $response | jq -r '.current.condition.text')

echo "Ciudad: $location, $region, $country"
echo "Temperatura actual: $temp_c°C"
echo "Condición: $condition"
