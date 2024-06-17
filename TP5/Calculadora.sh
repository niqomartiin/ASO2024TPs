#!/bin/bash

mostrar_menu() {
echo "Seleccione la operación:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"
read -p "Ingrese el número de la operación que desea realizar (1-4): " operacion
}

realizar_operacion() {
case $operacion in
1)
resultado=$(echo "$num1 + $num2" | bc)
echo "Resultado: $num1 + $num2 = $resultado"
;;
2)
resultado=$(echo "$num1 - $num2" | bc)
echo "Resultado: $num1 - $num2 = $resultado"
;;
3)
resultado=$(echo "$num1 * $num2" | bc)
echo "Resultado: $num1 * $num2 = $resultado"
;;
4)
if [ "$num2" -eq 0 ]; then
echo "Error: División por cero"
else
resultado=$(echo "scale=2; $num1 / $num2" | bc)
echo "Resultado: $num1 / $num2 = $resultado"
fi
;;
*)
echo "Operación no válida"
;;
esac
}

read -p "Ingrese el primer número: " num1
read -p "Ingrese el segundo número: " num2

mostrar_menu
realizar_operacion
