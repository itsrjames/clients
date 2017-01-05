ISBI Perimeter Server Tests
------------------------------------------
More Secure
------------------------------------------
PS installed on same VM as ISBI:

- rjames-vm-va.lan => 192.168.219.158 => ISBI => firewall open on port 52739 only
- sFTP Server Adapter => Port 52639

isbi001 SI PS Configuration
------------------------------------------
far end config host => Blank
far end config port => 0

near end config interface or IP => rjames-vm-va.lan
near end config local port => 52739

see isbi001-remote_perimeter.properties

How To Test
------------------------------------------
from rjames-vm-va.lan box

1.Make sure isbi001 PS is running, if not start with:

cd /home/rjames/IBM/perimetersrv/isbi001
./startupPs.sh

2.Make sure the sFTP Server Adapter COMRES_INST_VAL_sFTPSA_isbi001 is started

sftp -oPort=52639 inst-val-uc002-sftp-1@rjames-vm-va.lan
