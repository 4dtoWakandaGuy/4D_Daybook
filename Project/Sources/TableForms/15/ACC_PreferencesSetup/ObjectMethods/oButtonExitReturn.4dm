If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_DataChange)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable15"; Form event code:C388)
If (ACC_bo_DataChange)
	Gen_Confirm("Save Changes to Preferences?"; "Yes"; "No")
	If (OK=1)
		ACC_UpdateReportingPrefs
		CANCEL:C270
	Else 
		CANCEL:C270
		
	End if 
	
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable15"; $_t_oldMethodName)
