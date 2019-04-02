#!/bin/bash

#
#  Archivo con el código asociado a la gestión de procesos
#
#mostrar_menu_procesos(){    

    echo -e "\n \n"
    echo "************************** MENU_DE_PROCESOS  ************************"
    echo -e "\n"
    echo -e "\t [a] --------------> Gestionar Señales"
    echo -e "\t [b] --------------> Gestionar Prioridad de los procesos"
    echo -e "\t [c] --------------> Gestionar Procesos en segundo plano"
    echo -e "\n"
    echo -e "\t [s]---------------> Salir del Menu de procesos"
    echo -e "\n"
    echo "*********************************************************************"
         echo -e "\n"
	 read opcion
#}


#informacion_inicial_procesos(){    
#	echo "----------------------------------------------------------------"    
#	echo "----------------------------------------------------------------" 	
#   echo -e " \t Ha seleccionado la opción GESTIONAR PROCESOS"
#   echo "----------------------------------------------------------------" 	 
#   echo "----------------------------------------------------------------" 
#}




#gestionar_procesos(){    
    	
	echo "Ahora se mostrara una lista de procesos"
	ps -aux

	echo "Introducir PID del proceso"
	read PID

	echo "Ha elegido el proceso: "$PID
	echo "Lista de opciones"
	kill -l

	echo "Se ha ejecutar la finalizacion del proceso "$PID
	kill -9 $PID
    
#}



#funcion_prioridad(){
	
	echo "Eliga un proceso"
	ps -la
	read proceso
	echo "Introdusca el "
#}

#funcion_segundo_plano(){

#}
