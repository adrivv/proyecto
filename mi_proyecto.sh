#!/bin/bash

# includes asociados a mis scripts
source mi_adri.sh
source mi_proceso.sh
source mi_usuario.sh
source mi_extra.sh


# Validaciones previas para poder ejecutar el script
usuario=`whoami` 

# Validación del usuario root
if [ $usuario != "root" ]
then
	echo El script tiene que ejecutarse con usuario root
	exit 1
fi



while !([ "$opcion" = 's' ])
do

	mostrar_menu	
 
	case $opcion in
      			u) 
				informacion_inicial_usuarios
				gestionar_usuarios
				read fin_usuario
			;;	
	
			d) 
				informacion_inicial_discos
				gestionar_discos

				read fin_disco
			;;
	
			p) 	mostrar_menu_procesos
				#informacion_inicial_procesos
				#gestionar_procesos
				#gestionar_señales
				#gestionar_segun_plano

				read fin_proceso
			;;

			s) 
				informacion_final_salir
				read fin_salir		
				clear	
				
			;;
	
			*) 
				echo "Opción incorrecta"		
				read fin_incorrecto
				clear
			;;
			esac
done








