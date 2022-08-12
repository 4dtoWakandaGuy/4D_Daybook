If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable10
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
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable10"; Form event code:C388)
If (Not:C34(Gen_Option))
	For ($_l_Index; 1; Size of array:C274(SD_ai_ResultCodes))
		SD_ai_ResultCodes{$_l_Index}:=0
	End for 
Else 
	For ($_l_Index; 1; Size of array:C274(SD_ai_ResultCodes))
		SD_ai_ResultCodes{$_l_Index}:=1
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable10"; $_t_oldMethodName)
