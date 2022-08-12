If (False:C215)
	//object Name: [USER]BK_DataModel.Pop-up%2FDrop-down List4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataDefaults;0)
	//ARRAY TEXT(DM_at_DataDefaults;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; DM_l_BKDataDefaults)
	C_TEXT:C284($_t_oldMethodName; DM_t_DataDefaults)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Pop-up/Drop-down List4"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_DataDefaults>0)
			DM_t_DataDefaults:=DM_at_DataDefaults{DM_at_DataDefaults}
			DM_l_BKDataDefaults:=DM_al_DataDefaults{DM_at_DataDefaults}
		End if 
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Pop-up/Drop-down List4"; $_t_oldMethodName)
