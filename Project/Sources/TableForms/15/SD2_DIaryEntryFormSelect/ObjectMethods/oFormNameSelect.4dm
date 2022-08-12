If (False:C215)
	//object Name: [USER]SD2_DIaryEntryFormSelect.oFormNameSelect
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
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_TEXT:C284($_t_oldMethodName; SD2_t_VirtualFormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DIaryEntryFormSelect.oFormNameSelect"; Form event code:C388)

If (SD2_at_FormNames>0)
	If (SD2_at_FormNames{SD2_at_FormNames}="Other...")
		//need to select the default names.
	Else 
		
		SD2_t_VirtualFormName:=SD2_at_FormNames{SD2_at_FormNames}
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DIaryEntryFormSelect.oFormNameSelect"; $_t_oldMethodName)
