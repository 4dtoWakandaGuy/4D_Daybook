If (False:C215)
	//object Name: [SUBSCRIPTIONS]Subs_In.Variable71
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2011 10:56
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].Subs_In.Variable71"; Form event code:C388)
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].Subs_In.Variable71"; $_t_oldMethodName)