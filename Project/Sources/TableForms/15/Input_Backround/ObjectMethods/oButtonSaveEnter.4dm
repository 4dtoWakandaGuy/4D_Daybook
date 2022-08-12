If (False:C215)
	//object Name: [USER]Input_Backround.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2012 14:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Input_Backround.Variable6"; Form event code:C388)
//Save Record

//this one button replaces all the existing buttons on forms which is used to Save the record
//this simply sets the button press and calls the method
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DB_l_ButtonClickedFunction=0)
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
			
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:Input_Backround,isaveEnter"; $_t_oldMethodName)
