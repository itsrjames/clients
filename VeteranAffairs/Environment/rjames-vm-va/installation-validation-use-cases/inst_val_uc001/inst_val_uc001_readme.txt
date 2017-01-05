U.S Department of Veterans Affairs
-----------------------------------------------------
Installation Validation Use Cases
-----------------------------------------------------
Use Case: inst_val_uc001
-----------------------------------------------------
sGET with sFTP from VA ISFG sFTP Server and on to 
deliver via CD to VA ISFG CD Server 
-----------------------------------------------------
Assets
-----------------------------------------------------
sFTP Server Adapter					==>	COMRES_INST_VAL_sFTPSA
sFTP Host Identity Key				==> COMRES_INST_VAL_sFTP_HOST_ID_KEY
ISFG Community						==>	COMRES_INST_VAL
ISFG sFTP Test Partner (Producer)	==>	inst-val-uc001-sftp-1
ISFG CD Test Partner (Consumer)		==>	inst-val-uc001-cd-1
sFTP Remote Profile					==>	inst-val-uc001-sftp-1
Virtual Root						==>	inst-val-uc001-sftp-1
										inst-val-uc001-cd-1
ISFG CD Server Adapter				==>	COMRES_INST_VAL_CDSA
Test File							==> inst_val_uc001.txt
ISFG Routing Channel Template		==>	COMRES_INST_VAL_UC001_RCT
ISFG Routing Channel				==>	COMRES_INST_VAL_UC001
NetMap								==>	COMRES_INST_VAL_NETMAP
CD Node								==>	CD.COMRES x
-----------------------------------------------------
ISBI Resource Tag
-----------------------------------------------------
COMRES_INST_VAL_UC001.xml
-----------------------------------------------------
How to Test
-----------------------------------------------------
1.Import resource tag
2.You will have to define a new host identity key for the customers server and
set it against the COMRES_TEST_sFTPSA before enabling the adapter and running
the test
3.Load inst-val-uc001-sftp-1 mailbox with Test File by logging onto ISBI sFTP Server Adapter
as inst-val-uc001-sftp-1 and putting file into mailbox

How To Test
-----------------------------------------------------

sftp -oPort=52639 inst-val-uc001-sftp-1@192.168.219.158


