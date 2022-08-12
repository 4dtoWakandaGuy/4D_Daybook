If (False:C215)
	//object Name: [USER]SD2_DIaryEntryFormSelect.oSaveButton
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
	C_TEXT:C284($_t_oldMethodName; SD2_t_VirtualFormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DIaryEntryFormSelect.oSaveButton"; Form event code:C388)

If (SD2_t_VirtualFormName#"")
	ACCEPT:C269
Else 
	Gen_Confirm("You did not select a form to use"; "Continue"; "Stop")
	If (OK=1)
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DIaryEntryFormSelect.oSaveButton"; $_t_oldMethodName)
