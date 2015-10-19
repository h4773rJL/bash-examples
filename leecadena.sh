#!/bin/bash
voc=0
con=0
echo "Introduce una cadena"
read cadena
size=`expr length $cadena`
echo "Tamaño:  $size"
i=0
while [  $i -le $size ]; do
        c=`expr substr $cadena $i 1`
        l="$(echo $c | tr '[A-Z]' '[a-z]')"
        [ "$l" == "a" -o "$l" == "e" -o "$l" == "i" -o "$l" == "o" -o "$l" == "u" ] && (( voc++ )) || :
        [ "$l" == "b" -o "$l" == "c" -o "$l" == "d" -o "$l" == "f" -o "$l" == "g" -o "$l" == "h" -o "$l" == "j" -o "$l" == "k" -o "$l" == "l" -o "$l" == "m" -o "$l" == "n" -o "$l" == "p" -o "$l" == "q" -o "$l" == "r" -o "$l" == "s" -o "$l" == "t" -o "$l" == "v" -o "$l" == "w" -o "$l" == "x" -o  "$l" == "y" -o  "$l" == "z" ] && ((con++ )) || :
        let i=i+1 
done
echo "Vocales : $voc"
echo "consonantes : $con"

