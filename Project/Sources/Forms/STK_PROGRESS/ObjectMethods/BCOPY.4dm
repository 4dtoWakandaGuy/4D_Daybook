
If (False:C215)
	//Object Name:      STK_PROGRESS.BCOPY
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(STK_T_AllocLog)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/STK_PROGRESS/BCOPY"; Form event code:C388)
SET TEXT TO PASTEBOARD:C523(STK_T_AllocLog)
ERR_MethodTrackerReturn("OBJ [projectForm]/STK_PROGRESS/BCOPY"; $_t_oldMethodName)