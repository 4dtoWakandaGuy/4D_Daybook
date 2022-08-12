If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable8
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable8"; Form event code:C388)
ACC_bo_DataChange:=True:C214
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable8"; $_t_oldMethodName)