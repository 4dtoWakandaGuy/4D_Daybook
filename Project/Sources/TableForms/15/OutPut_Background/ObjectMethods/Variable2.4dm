If (False:C215)
	//object Name: [USER]OutPut_Background.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 08:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].OutPut_Background.Variable2"; Form event code:C388)
DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
POST OUTSIDE CALL:C329(Current process:C322)
ERR_MethodTrackerReturn("OBJ:OutPut_Background,Bok"; $_t_oldMethodName)