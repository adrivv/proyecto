#!/bin/bash

informacion_inicial_discos()
{    

   clear
        echo "----------------------------------------------------------------"$
        echo "----------------------------------------------------------------"$
   echo -e " \t Ha seleccionado la opción GESTIONAR DISCOS"
   echo "----------------------------------------------------------------"     $
   echo "----------------------------------------------------------------" 
    
}

# Comprobamos si el usuario es root
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
usuario=`who | tr -s " " | cut -d " " -f 1`
if [ $usuario != "root" ]; then
   echo El script se intenta ejecutar como usuario: $usuario
   echo El script tiene que ejecutarse con usuario root
   exit 1 
fi
# comprobar que el disco existe
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
disco=$(fdisk -l | grep -c /dev/sdb)
> /dev/null 2>&1
if [ $disco -lt 1 ]; then
   echo No existe el dispositivo a montar
   exit 2
else
echo El disco esta montado y tiene $disco particiones
fi
# que el tamaño del disco no sea inferior a 5G
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
size=`fdisk -l | grep "/dev/sdb" | tr " " "-" | cut -d "-" -f 3`
if [ $size -lt 5 ]; 
then
   echo El disco debe ser mayor que 5G
   exit 3
else   
   echo esta correcto y tiene este tamaño $size
fi
# Desmontamos la primera y segunda partición por si previamente existen
# Redirigimos la salida de error a /dev/null para que no nos muestre un error
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
i=1
for i in $num
do
parted /dev/sdb mktable msdos
done
echo Ya esta limpio el disco 
#----------------------------------------------------------------------------------
parted /dev/sdb mkpart primary ext4 0G 5G
parted /dev/sdb mkpart primary ext4 5G 10G
#----------------------------------------------------------------------------------
mkfs.ext4 /dev/sdb1
mkfs.ext4 /dev/sdb2
# Cuando creamos la carpeta de montaje es recomendable redirigir la salida
#----------------------------------------------------------------------------------
mkdir /mnt/sdb_1 2 > /dev/null
mkdir /mnt/sdb_2 2 > /dev/null

# Añadimos los nuevos discos duros a /etc/fstab.
cat >>/etc/fstab <<EOF

/dev/sdb1   /mnt/sdb_1     ext4      defaults    0    1
/dev/sdb2   /mnt/sdb_2     ext4      defaults    0    1
EOF
#mount -t ext4 /dev/sdb1
#mount -t ext4 /dev/sdc1

# La variable $actual almacena el primer usuario logueado en el sistema.
actual=`who | tr ' ' '-'| cut -d '-' -f1`

# Copiar el directorio personal del usuario a la carpeta donde está montada la primera partición del disco
cp -r /home/$actual /mnt/sdb_1

