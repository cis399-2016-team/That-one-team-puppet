# // ********************** START OF SHELLSCRIPT TO START THE SERVER **********************
# // FILENAME : start-osp-server.sh
# // choose a port > 1024. ports in the range 27960 - 27963 are recommended because servers using these ports are listed in the quake in-game server browser. 

#!/bin/sh
ip="ip_of_your_server"
port="port_of_your_server"
name="q3a-osp"

echo running server $name on $ip : $port

screen -A -m -d -S $name /usr/local/games/quake3/q3ded +set sv_punkbuster 1 +set fs_basepath /usr/local/games/quake3/ +set fs_game osp +set dedicated 1 +set com_hunkMegs 32 +set net_ip $ip +set net_port $port +set g_log $name.log +exec q3ded-osp-ffa.cfg


# // ********************** END OF SHELLSCRIPT TO START THE SERVER **********************
