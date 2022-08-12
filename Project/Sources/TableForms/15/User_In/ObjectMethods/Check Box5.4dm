If (False:C215)
	//object Name: [USER]User_In.Check Box5
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
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box5"; Form event code:C388)
SD_bo_ChangePrefs:=True:C214
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box5"; $_t_oldMethodName)