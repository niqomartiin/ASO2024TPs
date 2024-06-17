#!/bin/bash


read -p "Ingrese un nombre para conocer su edad probable: " nombre


URL="https://api.agify.io/?name=${nombre}"


response=$(curl -s $URL)


if [ $? -ne 0 ]; then
  echo "Error al obtener la información de la edad probable."
  exit 1
fi


name=$(echo $response | jq -r '.name')
age=$(echo $response | jq -r '.age')
count=$(echo $response | jq -r '.count')


echo "Nombre: $name"
echo "Edad probable: $age"
echo "Número de personas con este nombre en la muestra: $count"
