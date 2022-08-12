If (False:C215)
	//object Name: [USER]BK_DataModel.Pop-up%2FDrop-down List2
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
	//ARRAY LONGINT(BK_al_ItemDataModelID;0)
	//ARRAY TEXT(BK_at_ItemDataModelName;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; BK_l_ITEMDataModelID)
	C_TEXT:C284($_t_oldMethodName; BK_t_ItemDataModelName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Pop-up/Drop-down List2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (BK_at_ItemDataModelName>0)
			BK_t_ItemDataModelName:=BK_at_ItemDataModelName{BK_at_ItemDataModelName}
			BK_l_ITEMDataModelID:=BK_al_ItemDataModelID{BK_at_ItemDataModelName}
		End if 
		
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Pop-up/Drop-down List2"; $_t_oldMethodName)
