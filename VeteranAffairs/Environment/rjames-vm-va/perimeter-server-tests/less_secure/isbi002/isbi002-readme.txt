ISBI Perimeter Server Tests
------------------------------------------
Less Secure
------------------------------------------
Simulates DMZ with two VM's:

- rjames-vm-va.lan => 192.168.219.158 => ISBI
- sFTP Server Adapter => Port 52639
- rjames-vm-pem.lan => 192.168.219.153 => isbi002 PS => firewall open on port 52839 only

isbi002 SI PS Configuration
------------------------------------------
far end config host => 192.168.219.153
far end config port => 52839

near end config interface or IP => 192.168.219.158
near end config local port => 0

see isbi002-remote_perimeter.properties

How To Test
------------------------------------------
from rjames-vm-pem.lan box

1.Make sure isbi002 PS is running, if not start with:

cd /home/rjames/IBM/perimetersrv/isbi002
./startupPs.sh

2.Make sure the sFTP Server Adapter COMRES_INST_VAL_sFTPSA_isbi002 is started

sftp -oPort=52639 inst-val-uc002-sftp-1@rjames-vm-pem.lan
