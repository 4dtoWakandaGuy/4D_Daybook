If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable4"; Form event code:C388)

//NG March 2004..well we better save the preferences here
If (ACC_bo_DataChange)
	Gen_Confirm("Save Changes to Preferences first?"; "Yes"; "No")
	If (OK=1)
		ACC_UpdateReportingPrefs
	Else 
	End if 
	
Else 
	
End if 
Gen_Confirm("Run a Check on transactions from this machine. "+"This takes a long time"; "Yes"; "No")
If (OK=1)
	ACC_FullValidation
	Gen_Alert("You may now exit this screen and continue working. However if you quit, the valid"+"a"+"tion will stop")
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable4"; $_t_oldMethodName)
