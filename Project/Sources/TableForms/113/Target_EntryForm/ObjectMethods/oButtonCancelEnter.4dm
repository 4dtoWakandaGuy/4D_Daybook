If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable26
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
	C_LONGINT:C283(SP_l_Save)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable26"; Form event code:C388)
If ([SALES_PROJECTION:113]Title:21#"")
	SP_l_Save:=1
	ACCEPT:C269
Else 
	// ALERT("You must enter a Title for this Pipeline Order")
	Gen_Alert("You must enter a Title for this Pipeline Order.")
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable26"; $_t_oldMethodName)
