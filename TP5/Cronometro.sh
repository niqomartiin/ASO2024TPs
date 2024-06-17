#!/bin/sh


inicio=0
fin=0
tiempo_transcurrido=0
en_marcha=0

mostrar_menu() {
echo "Cronómetro"
echo "1. Iniciar"
echo "2. Detener"
echo "3. Reiniciar"
echo "4. Salir"
}


iniciar() {
if [ $en_marcha -eq 1 ]; then
echo "El cronómetro ya está en marcha."
else
inicio=$(date +%s)
en_marcha=1
echo "Cronómetro iniciado."
fi
}
detener() {
if [ $en_marcha -eq 0 ]; then
echo "El cronómetro no está en marcha."
else
fin=$(date +%s)
tiempo_transcurrido=$((fin - inicio))
en_marcha=0
echo "Cronómetro detenido. Tiempo transcurrido: ${tiempo_transcurrido} segundos."
fi
}

reiniciar() {
inicio=0
fin=0
tiempo_transcurrido=0
en_marcha=0
echo "Cronómetro reiniciado."
}


while true; do
mostrar_menu
read -p "Seleccione una opción: " opcion
case $opcion in
1) iniciar ;;
2) detener ;;
3) reiniciar ;;
4) echo "Saliendo..." ; exit 0 ;;
*) echo "Opción no válida." ;;
esac
done
