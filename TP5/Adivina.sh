#!/bin/bash

Adivina_Numero=$(( RANDOM % 100 + 1 ))

echo " Hola, Estoy aburrido, Quiero jugar. "
echo "Estoy pensando en  un número entre 1 y 100. ¿Puedes adivinar cuál es?"

while true; do
  read -p "Introduce tu intento: " intento

  if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
    echo "Por favor, introduce un número válido."
    continue
  fi

  intento=$((intento))

  if (( intento < Adivina_Numero )); then
    echo "Demasiado bajo. Intenta de nuevo."
  elif (( intento > Adivina_Numero )); then
    echo "Demasiado alto. Intenta de nuevo."
  else
    echo "¡Felicidades! Has adivinado el número."
    break
  fi
done
