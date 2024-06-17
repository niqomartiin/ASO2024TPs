#!/bin/bash

if [ -z "$1" ]; then
echo "Uso: $0 archivo.txt"
exit 1
fi


if [ ! -f "$1" ]; then
echo "El archivo $1 no existe."
exit 1
fi

num_lineas=$(wc -l < "$1")
num_palabras=$(wc -w < "$1")
num_caracteres=$(wc -m < "$1")

echo "Número de líneas: $num_lineas"
echo "Número de palabras: $num_palabras"
echo "Número de caracteres: $num_caracteres"
