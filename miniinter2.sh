#!/bin/bash
#h4774r
trap "echo ¿salir? solo escribe salir" SIGINT SIGTERM
BANDERA=4
ISCMD=0
CMD1='busqueda'
MSG1="use: \e[2mbusqueda objeto modificador lugar\e[22m por ejemplo: "
MSG11="\e[2mbusqueda a.a nombre\e[22m busca en el directorio actual el archivo \e[2ma.a\e[22m"
MSG12="\e[2mbusqueda a.a nombre secretos \e[22m busca en el directorio \e[2msecretos\e[22m el archivo \e[2ma.a\e[22m"
MSG13="modificador: nombre|tamano|usuario|permisos|fecha"
MSG14="use: \e[2mbusqueda a.a permisos\e[22m 755 \e[2msecretos\e[22m"
CMD2='comprime'
MSG2="use: \e[2mcomprime crea|extrae archivo |tar.bz|tar.gz|zip|rar| archivo\e[22m "
MSG21="\e[2mcomprime crea archivo tar.bz receta.txt\e[22m comprime receta.txt y crea archivo.tar.bz"
MSG22="\e[2mcomprime extrae archivo zip\e[22m extrae el contenido de archivo.zip"
CMD3="directorio"
MSG3="use: \e[2mdirectorio\e[22m para ver el contenido actual o \e[2mdirectorio
 carpeta\e[22m para ver el contenido de dicha carpeta"
CMD4="carpeta"
MSG4="use: \e[2mcarpeta subdirectorio\e[22m para cambiar de directorio"
CMD5="tripas"
MSG5="use: \e[2mtripas archivo\e[22m para ver el contenido del archivo"
CMD6="limpia"
CMD7="yay"
CMD8="salir"
MSG="escriba yay para saber que comandos usar..."
ERRD="¡no es un directorio!"
MSGNF="No existe el achivo "

function Salir(){
exit
    }

function Ayuda(){
	clear
	echo -e "\e[32mLlego la Ayuda...\e[0m"
	echo -e "use \e[1mbusqueda|comprime|directorio|carpeta|tripas|limpia|salir|yay\e[21m"
	echo
	echo -e "limpia, salir y yay no requieren parametros"
	echo -e "busqueda, comprime, directorio, carpeta y tripas \e[1mllevan parametros\e[21m"
	echo
	echo -e $MSG1
	echo -e $MSG11
	echo -e $MSG12
	echo -e $MSG13
	echo
	echo -e $MSG2 
	echo -e $MSG21
	echo -e $MSG22
	echo
	echo -e $MSG3
	echo
	echo -e $MSG4
	echo
	echo -e $MSG5
	echo
	echo -e "\e[32mfin de la vasta ayuda\e[0m"
    }

function Tripas(){
	if [ $1 ]; then
	   if [ -d $1 ]; then
	      echo $1 'es un Directorio'
	    else
	    cat $1 | more
	    fi
	else
	  echo -e "\e[33m" $MSG5  "\e[0m" 
	fi
	}

function Carpeta(){
	if [ $1 ]; then
	   if [ -d $1 ]; then
	    echo 'cambiando a directorio ' $1
	    cd $1  
	   else
	    echo $1 $ERRD	     
	   fi
	else
	  echo -e "\e[33m" $MSG4 "\e[0m" 
	fi
    }

function Directorio (){
	alias ls='ls --color'
    LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
    export LS_COLORS
	if [ $1 ]; then
	   if [ -d $1 ]; then
	    echo 'El contenido de ' $1
	    ls $1  
	   else
	    echo $1 $ERRD	     
	   fi
	else
	  ls  
	fi
    }
 
function Crea(){
	if [ $1 ]; then
	C_FILE=$1"."$2
	   case $2 in
	      "tar.bz")
	      echo crear $1 con formato $2 desde $3
	      tar -jcvf $C_FILE $3
	      ;;
	      "tar.gz")
	      echo crear $1 con formato $2 desde $3
	      tar -zcvf $C_FILE $3
	      ;;
	      "zip")
	      echo zip de $3
	       zip -r $C_FILE $3
	      ;;
	      "rar")
	      echo rar de $3
	      echo "UNRAR 5.30 beta 4 freeware      Copyright (c) 1993-2015 Alexander Roshal"
	      echo "Solo nos permite descomprimir archivos :( Lo siento Mucho"
	      ;;
	      *)
	      echo -e "No existe el formato, \e[33m"  $MSG2  "\e[0m"
	      ;;
	   esac  
	else
	  echo -e "\e[33m"  $MSG2  "\e[0m" 
	fi
	
}


function Extrae(){
	if [ $1 ]; then
	   C_FILE=$1"."$2
	   case $2 in
	      "tar.bz")
	      echo extrae $1 con formato $2
	      tar -jxvf $C_FILE
	      ;;
	      "tar.gz")
	      echo extrae $1 con formato $2
	      tar -zxvf $C_FILE
	      ;;
	      "zip")
	      echo unzip de $1
	      unzip $C_FILE
	      ;;
	      "rar")
	      echo unrar de $1
	      unrar e $C_FILE
	      ;;
	      *)
	      echo -e "No existe el formato, \e[33m"  $MSG2  "\e[0m"
	      ;;
	   esac  
	else
	  echo -e "\e[33m"  $MSG2  "\e[0m" 
	fi
}

function Comprime(){
	if [ $1 ]; then
	   case $1 in
	      "crea")
	      if [ -f $4 ]; then
	        Crea $2 $3 $4
	      else
	        echo -e "\e[33m¡no existe: " $4 " !\e[0m"
	      fi    
	      ;;
	      "extrae")
	      fl=$2"."$3
	      if [ -f $fl ]; then
	         Extrae $2 $3
	      else
	         echo -e "\e[33m¡no existe: " $fl " !\e[0m"
	      fi      
	      ;;
	      *)
	      echo -e "\e[33m"  $MSG2  "\e[0m"
	      ;;
	   esac  
	else
	  echo -e "\e[33m"  $MSG2  "\e[0m" 
	fi
	
	
}

function Busqueda(){
	
	
	if [ $2 ]; then	
	   case $2 in
	      "nombre")
	      echo buscar $1 con modificador $2 desde $3
	      if [ -d $3 ]; then
	         find $3 -name $1
	      else
	         echo $3 no es un directorio, se buscara en el actual..
	         find ./ -name $1
	      fi      
	      ;;
	      "tamano")
	      echo buscar $1 con $2 $3 desde $4
	      if [ $4 ]; then 
	         if [ -d $4 ]; then
	            f_cmd=$4"/"$1
	            f_z=$3"k"
	            find $f_cmd -size $f_z
	         fi   
   	      else
	         echo $4 no es un directorio, se buscara en el actual..
	         find $1 -size $f_z	      
	      fi    
	      ;;
	      "usuario")
	      echo buscar $1 con $2 $3 desde $4
	      if [ $4 ]; then 
	          if [ -d $4 ]; then
	             f_cmd=$4"/"$1
	             find $f_cmd -user $3
	          fi   
	      else
	          echo $4 no es un directorio, se buscara en el actual..
	          find $1 -user $3	          
	      fi    
	      ;;
	      "permisos")
	      echo buscar $1 con $2 - $3 desde $4
	      if [ $4 ]; then 
	          if [ -d $4 ]; then
	             f_cmd=$4"/"$1
	             find $f_cmd -perm $3
	            
	          else
	          echo $4 no es un directorio, se buscara en el actual..
	          find . -perm $3
	          fi
	      else
	        echo -e $MSG14    	          
	      fi    
	      ;;
	      
	      "fecha")
	      echo buscar $1 con $2 desde $3
	      if [ $3 ]; then 
	          if [ -d $3 ]; then
	             f_cmd=$3"/"$1
	             find $f_cmd -mtime 0
	             
	          else
	          echo $3 no es un directorio, se buscara en el actual..
	          find . $1 -mtime 0 
	          fi         
	      fi    
	      ;;
	      *)
	      echo -e "No existe el modificador, \e[33m"  $MSG1  "\e[0m"
	      ;;
	   esac  
	else
	  echo -e "\e[33m"  $MSG1  "\e[0m" 
	fi
	
	}

    
clear
echo    
echo $MSG
while :
do
     echo -n "Comando: "
     read COMANDO     
     cmdarr=$(echo $COMANDO | tr ' ' "\n")             
     for x in $cmdarr
     do
       cmd_arr[ISCMD]=$x;                     
       let ISCMD=ISCMD+1
     done
     ISCMD=0
     INCMD=${cmd_arr[0]} 
     
     if [ -z $INCMD ]; then
        echo $MSG
     elif [ $INCMD = $CMD8 ]; then 
        Salir
     elif [ $INCMD = $CMD7 ]; then 
        Ayuda
     elif [ $INCMD = $CMD6 ]; then
        clear
     elif [ $INCMD = $CMD5 ]; then
        Tripas ${cmd_arr[1]}
     elif [ $INCMD = $CMD4 ]; then
        Carpeta ${cmd_arr[1]}
     elif [ $INCMD = $CMD3 ]; then
        Directorio ${cmd_arr[1]}
     elif [ $INCMD = $CMD2 ]; then
        Comprime ${cmd_arr[1]} ${cmd_arr[2]} ${cmd_arr[3]} ${cmd_arr[4]} ${cmd_arr[4]}     
     elif [ $INCMD = $CMD1 ]; then
        Busqueda ${cmd_arr[1]} ${cmd_arr[2]} ${cmd_arr[3]} ${cmd_arr[4]} ${cmd_arr[5]}     
     
     else
        echo $MSG   
     fi
     unset cmd_arr
     echo              
     
     
done
