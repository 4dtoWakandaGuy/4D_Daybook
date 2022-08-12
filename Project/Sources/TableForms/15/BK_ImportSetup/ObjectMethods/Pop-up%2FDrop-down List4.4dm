If (False:C215)
	//object Name: [USER]BK_ImportSetup.Pop-up%2FDrop-down List4
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
	//ARRAY TEXT(BK_at_Postaction;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283(DM_l_BKPostAction)
	C_TEXT:C284($_t_oldMethodName; BK_t_BKpostAction)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List4"; Form event code:C388)
If (BK_at_Postaction>0)
	BK_t_BKpostAction:=BK_at_Postaction{BK_at_Postaction}
	DM_l_BKPostAction:=BK_at_Postaction
	BK_at_Postaction:=0
	DM_bo_CModified:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List4"; $_t_oldMethodName)
