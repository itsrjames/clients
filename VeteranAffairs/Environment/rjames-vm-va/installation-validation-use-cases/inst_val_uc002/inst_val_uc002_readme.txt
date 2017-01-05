U.S Department of Veterans Affairs
-----------------------------------------------------
Installation Validation Use Cases
-----------------------------------------------------
Use Case: UC002
-----------------------------------------------------
Collect from VA file system and sPUT with sFTP from
VA ISFG to VA ISFG sFTP Server 
-----------------------------------------------------
Assets
-----------------------------------------------------
sFTP Server Adapter							==>	COMRES_INST_VAL_sFTPSA
sFTP Host Identity Key						==> COMRES_INST_VAL_sFTP_HOST_ID_KEY
sFTP Known Host Identity Key				==> COMRES_INST_VAL_sFTP_KNOWN_HOST_ID_KEY
ISFG Community								==>	COMRES_INST_VAL
ISFG File System Test Partner (Producer)	==>	inst-val-uc002-fs-1
ISFG sFTP Test Partner (Consumer)			==>	inst-val-uc002-sftp-1
sFTP Remote Profile							==>	inst-val-uc002-sftp-1
Virtual Root								==>	inst-val-uc002-sftp-1
Test File									==> inst_val_uc002.txt
ISFG Routing Channel Template				==>	COMRES_INST_VAL_UC002_RCT
ISFG Routing Channel						==>	COMRES_INST_VAL_UC002
ISFG File System Adapter					==>	COMRES_INST_VAL_FSA
File System Collect Business Process		==>	COMRES_INST_VAL_UC002_MAILBOX_ADD
ISFG Mailbox Add Service					==> COMRES_INST_VAL_MAILBOX_ADD
-----------------------------------------------------
ISBI Resource Tag
-----------------------------------------------------
COMRES_INST_VAL_UC002.xml
-----------------------------------------------------
How to Test
-----------------------------------------------------
Notes

You will have to define a new host identity key for the customers server and
set it against the COMRES_TEST_sFTPSA before enabling the adapter and running
the test

You will have to change the collection folder on the file system adapter in order
to pick up a file from the customers machine.

1.Drop a the test file into the file system adapter collection folder
2.File will be collected added to a mailbox and then sFTP to the ISFG
Server Adapter and placed within the consumer partner mailbox

