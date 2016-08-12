#!/bin/bash

echo "Compiling server"
sh /home/quake/quake_install/server_compile.sh

echo "Installing server files"
#wget ftp://213.141.144.202/pub/Soft/4Android/quake3/baseq3/pak0.pk3 /home/quake/ioquake3/baseq3/pak0.pk3
cp /home/quake/quake_install/pak0.pk3 /home/quake/ioquake3/baseq3/
