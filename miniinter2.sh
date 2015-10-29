#!/bin/bash
BANDERA=2
ISCMD=0
CMD1='busqueda'
CMD2='comprime'
CMD3='directorio'
CMD4='tripas'
CMD5='cls'
CMD6='n4m'

echo "Comando: use yay para saber que comandos usar..."
while [  $BANDERA -ne 0 ]; do
             echo "Comando: "
             read COMANDO
             #cmd_arr=$(echo $COMANDO | tr " " "\n")
             #cmd_arr=(one two three)
             #echo ${cmd_arr[*]}
             #echo $cmd_arr[*]
             
             
             OIFS=$IFS
             IFS=' '
             cmd_arr=$COMANDO
             
             echo {$cmd_arr[0]}
             echo ${cmd_arr[1]}
             echo ${cmd_arr[2]}
             echo ${cmd_arr[3]}
             echo '---'
             
             for x in $cmd_arr
             do
               if [ $ISCMD -eq 0 ]; then
                 echo $ISCMD
                 ISCMD=1
                 if [ ${x} = $CMD5 ];
                 then
                   clear
                 fi
              fi 
                     
               echo "> $x"
               
             done
             ISCMD=0              
             let BANDERA=BANDERA-1 
done


