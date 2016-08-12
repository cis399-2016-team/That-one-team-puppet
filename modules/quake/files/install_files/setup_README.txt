make quake3 user with puppet
username: quake3

install quake3
./linuxq3apoint-1.32b-3.x86.run

ENSURE FILE pak0.pk3 /usr/local/games/quake3/baseq3/
in ~/quake3
mkdir -p .q3a/baseq3/
ENSURE FILE osp-Quake3-1.03a_full.zip ~/.q3a/
cd ~/.q3a/
unzip osp-Quake3-1.03a_full.zip


ENSURE q3ded-osp.cfg
maprotation-osp.cfg IN /home/quake3/.q3a/baseq3/

ENSURE start-osp-server.sh IN /home/quake3

STOP SERVER
ps aux | grep screen | grep servername
kill pid
