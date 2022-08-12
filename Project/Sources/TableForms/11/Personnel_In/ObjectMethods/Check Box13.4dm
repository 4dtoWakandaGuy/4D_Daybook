If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Check Box13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Check Box13"; Form event code:C388)
SD_bo_ChangePrefs:=True:C214
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Check Box13"; $_t_oldMethodName)