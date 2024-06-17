#!/bin/bash

mostrar_menu() {
    echo "Elige una opción:"
    echo "1. Piedra"
    echo "2. Papel"
    echo "3. Tijeras"
}
eleccion_usuario() {
    read -p "Introduce el número de tu elección (1- Piedra, 2- Papel, 3- Tijeras): " eleccion_usuario
    while [[ ! "$eleccion_usuario" =~ ^[1-3]$ ]]; do
        echo "Opción inválida. Por favor, elige 1, 2 o 3."
        read -p "Introduce el número de tu elección " eleccion_usuario
    done
}

eleccion_computadora() {
    eleccion_computadora=$(( RANDOM % 3 + 1 ))
}

convertir_a_texto() {
    case $1 in
        1) echo "Piedra" ;;
        2) echo "Papel" ;;
        3) echo "Tijeras" ;;
    esac
}

determinar_ganador() {
    if [[ $eleccion_usuario -eq $eleccion_computadora ]]; then
        echo "Es un empate."
    elif [[ $eleccion_usuario -eq 1 && $eleccion_computadora -eq 3 ]] || \
         [[ $eleccion_usuario -eq 2 && $eleccion_computadora -eq 1 ]] || \
         [[ $eleccion_usuario -eq 3 && $eleccion_computadora -eq 2 ]]; then
        echo "¡Tú ganas!"
    else
        echo "La computadora gana."
    fi
}

# Inicio del juego
echo "¡Bienvenido al juego de Piedra, Papel o Tijeras!"

mostrar_menu
eleccion_usuario
eleccion_computadora

echo "Tú elegiste: $(convertir_a_texto $eleccion_usuario)"
echo "La computadora eligió: $(convertir_a_texto $eleccion_computadora)"

determinar_ganador
