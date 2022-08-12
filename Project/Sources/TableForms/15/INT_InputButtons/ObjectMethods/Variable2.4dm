If (False:C215)
	//object Name: [USER]INT_InputButtons.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].INT_InputButtons.Variable2"; Form event code:C388)
//ADD SUBRECORD

//this one button replaces all the existing buttons on forms which is used to add a subrecord
//this simply sets the button press and calls the method
If (DB_l_ButtonClickedFunction=0)
	
	
	DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
	POST OUTSIDE CALL:C329(Current process:C322)
End if 
ERR_MethodTrackerReturn("OBJ:INT_InputButtons,xReport"; $_t_oldMethodName)
