U.S Department of Veterans Affairs
-----------------------------------------------------
Installation Validation Use Cases
-----------------------------------------------------
Use Case: UC003
-----------------------------------------------------
Inbound to VA ISFG using FTPS then deliver to VA ISFG
CD Server 
-----------------------------------------------------
Assets
-----------------------------------------------------
ISFG FTPS Test Partner (Producer)			==>	inst-val-uc003-ftps-1
ISFG CD Test Partner (Consumer)				==>	inst-val-uc003-cd-1
Virtual Root								==>	inst-val-uc003-ftps-1
Test File									==> inst_val_uc003.txt
ISFG Routing Channel Template				==>	COMRES_INST_VAL_UC003_RCT
ISFG Routing Channel						==>	COMRES_INST_VAL_UC003
ISFG FTPS Server Adapter					==>	COMRES_INST_VAL_FTPS_SA
-----------------------------------------------------
How to Test
-----------------------------------------------------
Notes

You will need an FTPS linux client, this test has been based on using Firefox

1.Upload test file via Firefox FTPS as inst-val-uc003-ftps-1
2.File will be routed to consumer via CD


