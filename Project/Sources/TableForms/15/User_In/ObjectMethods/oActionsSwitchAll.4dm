If (False:C215)
	//object Name: [USER]User_In.Variable84
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 12:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	C_LONGINT:C283($_l_ActionsIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable84"; Form event code:C388)
If (Not:C34(Gen_Option))
	For ($_l_ActionsIndex; 1; Size of array:C274(SD_ai_ActionCodes))
		SD_ai_ActionCodes{$_l_ActionsIndex}:=0
	End for 
Else 
	For ($_l_ActionsIndex; 1; Size of array:C274(SD_ai_ActionCodes))
		SD_ai_ActionCodes{$_l_ActionsIndex}:=1
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable84"; $_t_oldMethodName)
