If (False:C215)
	//object Name: [USER]BK_StoreSetup.Variable3
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
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_StoreSetup.Variable3"; Form event code:C388)
DM_Bo_BKedit:=True:C214
ERR_MethodTrackerReturn("OBJ [USER].BK_StoreSetup.Variable3"; $_t_oldMethodName)