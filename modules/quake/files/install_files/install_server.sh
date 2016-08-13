#!/bin/bash

wget http://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run -O ioquake_install.run

wget http://ioquake3.org/files/1.36/data/ioquake3-q3a-1.32-9.run -O ioquake_patch.run

sh ioquake_install.run
sh ioquake_patch.run
