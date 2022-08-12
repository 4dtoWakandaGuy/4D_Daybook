If (False:C215)
	//object Name: [X_LISTS]Display_list_Dialogue.oCancel
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [X_LISTS].Display_list_Dialogue.bCancel1"; Form event code:C388)
Gen_Confirm("No data changes will be saved!!"; "I know"; "Stop")
If (OK=1)
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [X_LISTS].Display_list_Dialogue.bCancel1"; $_t_oldMethodName)
