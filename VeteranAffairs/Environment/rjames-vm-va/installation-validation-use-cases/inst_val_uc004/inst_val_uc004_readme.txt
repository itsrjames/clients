U.S Department of Veterans Affairs
-----------------------------------------------------
Installation Validation Use Cases
-----------------------------------------------------
Use Case: UC004
-----------------------------------------------------
Outbound from ISFG using FTPS to VA ISFG FTPS Server
-----------------------------------------------------
Assets
-----------------------------------------------------
ISFG FTPS Test Partner (Producer)			==>	inst-val-uc004-ftps-1
ISFG CD Test Partner (Consumer)				==>	inst-val-uc004-ftps-2
Virtual Root								==>	inst-val-uc004-ftps-1
												inst-val-uc004-ftps-2
Test File									==> inst_val_uc004.txt
ISFG Routing Channel Template				==>	COMRES_INST_VAL_UC004_RCT
ISFG Routing Channel						==>	COMRES_INST_VAL_UC004
-----------------------------------------------------
ISBI Resource Tag
-----------------------------------------------------
COMRES_INST_VAL_UC002.xml
-----------------------------------------------------
How to Test
-----------------------------------------------------
Notes

You will need an FTPS linux client, this test has been based on using Firefox

1.Upload via Firefox FTPS logon as user inst-val-uc004-ftps-1
2.File will be routed via FTPS to inst-val-uc004-ftps-2 mailbox
 

