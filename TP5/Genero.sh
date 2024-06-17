#!/bin/bash


read -p "Ingrese un nombre para conocer su género: " nombre


URL="https://api.genderize.io?name=${nombre}"


response=$(curl -s $URL)


if [ $? -ne 0 ]; then
  echo "Error al obtener la información del género."
  exit 1
fi



name=$(echo $response | jq -r '.name')
gender=$(echo $response | jq -r '.gender')
probability=$(echo $response | jq -r '.probability')


if [ "$gender" = "male" ]; then
  gender="Masculino"
elif [ "$gender" = "female" ]; then
  gender="Femenino"
else
  gender="Desconocido"
fi

probability=$(echo "$probability * 100" | bc)  # Convertir la probabilidad a porcentaje

echo "Nombre: $name"
echo "Género: $gender"
echo "Probabilidad: ${probability}%"
