If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 12:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Variable7"; Form event code:C388)
If (Not:C34(Gen_Option))
	For ($_l_Index; 1; Size of array:C274(SD_ai_ActionCodes))
		SD_ai_ActionCodes{$_l_Index}:=0
	End for 
Else 
	For ($_l_Index; 1; Size of array:C274(SD_ai_ActionCodes))
		SD_ai_ActionCodes{$_l_Index}:=1
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Variable7"; $_t_oldMethodName)
