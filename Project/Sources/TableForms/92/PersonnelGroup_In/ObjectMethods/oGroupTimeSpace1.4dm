If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Variable20
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Variable20"; Form event code:C388)
//SD_bo_ChangePrefs:=True
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Variable20"; $_t_oldMethodName)