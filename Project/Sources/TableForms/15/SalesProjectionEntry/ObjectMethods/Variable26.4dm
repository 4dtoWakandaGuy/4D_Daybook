If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SP_l_Save)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesProjectionTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable26"; Form event code:C388)
If (SP_t_SalesProjectionTitle#"")
	SP_l_Save:=1
	CANCEL:C270
Else 
	// ALERT("You must enter a Title for this Pipeline Order")
	Gen_Alert("You must enter a Title for this Pipeline Order.")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable26"; $_t_oldMethodName)
