If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.oLBdiaries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2014 12:03
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ACC_PreferencesSetup.oLBdiaries"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ ACC_PreferencesSetup.oLBdiaries"; $_t_oldMethodName)