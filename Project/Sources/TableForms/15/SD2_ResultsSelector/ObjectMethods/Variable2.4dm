If (False:C215)
	//object Name: [USER]SD2_ResultsSelector.Variable2
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
	C_LONGINT:C283(SD_l_Changes)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ResultsSelector.Variable2"; Form event code:C388)
If (SD_l_Changes>0)
	Gen_Confirm("Save Changes?"; "Yes"; "No")
	
	SD_l_Changes:=OK
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SD2_ResultsSelector.Variable2"; $_t_oldMethodName)