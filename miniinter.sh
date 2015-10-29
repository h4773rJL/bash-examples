#!/bin/bash
BANDERA=10;
echo Comando: use yay para saber que comandos usar...
while [  $BANDERA -ne 0 ]; do
             echo Comando: 
             read COMANDO
             case $COMANDO in
                         yay)
                           echo busqueda
                           echo comprime
                           echo directoriocolor
                           echo cambiopcarpeta
                           echo tripas
                           echo cls
                           echo n4m
                           ;;
                           
                         cls)
                           clear
                           ;;
                           
                         trip)  
                           
									
                           
             esac              
             let BANDERA=BANDERA-1 
done


