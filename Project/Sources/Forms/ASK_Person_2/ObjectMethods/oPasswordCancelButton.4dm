If (False:C215)
	//object Name: Object Name:      ASK_Person_2.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 12:13
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ ASK_Person_2.Variable6"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ ASK_Person_2.Variable6"; $_t_oldMethodName)