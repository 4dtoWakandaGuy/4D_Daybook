//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BK_at_DataDefaults;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Pop-up/Drop-down List1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (BK_at_DataDefaults>0)
			//bsw 25/09/03 NG will deal with this later
			//BK_S55_DataDefaults:=BK_at_DataDefaults{BK_at_DataDefaults}
			// DM_l_BKDataDefaults:=DM_al_DataDefaults{BK_at_DataDefaults}
		End if 
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Pop-up/Drop-down List1"; $_t_oldMethodName)
