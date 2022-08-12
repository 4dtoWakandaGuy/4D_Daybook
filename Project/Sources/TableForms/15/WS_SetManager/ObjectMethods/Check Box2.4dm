If (False:C215)
	//object Name: [USER]WS_SetManager.Check Box2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2011 09:02
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Check Box2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Check Box2"; $_t_oldMethodName)