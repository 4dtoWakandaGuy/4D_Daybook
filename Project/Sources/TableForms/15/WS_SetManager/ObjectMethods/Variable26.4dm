If (False:C215)
	//object Name: [USER]WS_SetManager.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable26"; Form event code:C388)
Record_Bar_s2
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable26"; $_t_oldMethodName)
