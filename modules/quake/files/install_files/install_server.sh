#!/bin/bash

echo "Compiling server"
#sh /home/quake/quake_install/server_compile.sh
wget http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run ioquake_install.run

wget http://ioquake3.org/files/1.36/data/ioquake3-q3a-1.32-9.run ioquake_patch.run

sh ioquake_install.run
sh ioquake_patch.run

#echo "Installing server files"
#wget http://files.anitalink.com/gamecache/quake3/baseq3/pak0.pk3 /home/quake/ioquake3/baseq3/pak0.pk3
#wget ftp://213.141.144.202/pub/Soft/4Android/quake3/baseq3/pak0.pk3 /home/quake/ioquake3/baseq3/pak0.pk3
#cp /home/quake/quake_install/pak0.pk3 /home/quake/ioquake3/baseq3/
