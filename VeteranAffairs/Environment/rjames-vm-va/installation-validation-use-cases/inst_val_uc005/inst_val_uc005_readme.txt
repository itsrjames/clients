U.S Department of Veterans Affairs
-----------------------------------------------------
Installation Validation Use Cases
-----------------------------------------------------
Use Case: UC005
-----------------------------------------------------
Inbound to VA ISFG using HTTPS and deposit file into myFileGateway
and deliver to VA ISFG CD Server
-----------------------------------------------------
Assets
-----------------------------------------------------
ISFG FTPS Test Partner (Producer)			==>	inst-val-uc005-https-1
ISFG CD Test Partner (Consumer)				==>	inst-val-uc005-cd-1
Virtual Root								==>	inst-val-uc005-https-1
												inst-val-uc005-cd-1
Test File									==> inst_val_uc005.txt
ISFG Routing Channel Template				==>	COMRES_INST_VAL_UC005_RCT
ISFG Routing Channel						==>	COMRES_INST_VAL_UC005
-----------------------------------------------------
ISBI Resource Tag
-----------------------------------------------------
COMRES_INST_VAL_UC002.xml
-----------------------------------------------------
How to Test
-----------------------------------------------------
Notes

You will need to enable HTTPS on the base port.
1.Shutdown SI
2.Navigate to properties
3.Edit sandbox.cfg

Change

WEBAPP_PROTOCOL=https
WEBAPP_LIST_PORT=<base port +1>

4.Navigate to bin
5.setupfiles.sh
6.deployer.sh


To Run Test

1.Logon to myFileGateway with user inst-val-uc005-https-1
2.Upload test file
3.File will be routed to partner inst-val-uc005-cd-1 via CD

