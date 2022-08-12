If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Tab Control3
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
	//Array Text(SD_at_ActionResultTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Tab Control3"; Form event code:C388)

FORM GOTO PAGE:C247(SD_at_ActionResultTab+2)
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Tab Control3"; $_t_oldMethodName)