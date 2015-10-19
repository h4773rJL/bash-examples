#!/bin/bash
FILE=$1
if [ -f $FILE ]; then
   if [ -x $FILE ]; then
      echo el archivo $FILE existe y es ejecutable
      ls $FILE -la
   else
      echo el archivo $FILE existe, pero no se puede ejecutar
      ls $FILE -la
      echo cambiando permisos...
      chmod u+x,g+x $FILE
      echo ya es ejecutable para el grupo y para el usuario.
      ls $FILE -la
   fi   
else
   echo archivo no encontrado
fi
