//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetDiaryActionRangeByCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 21:07`Method: SD_GetDiaryActionRangeByCode
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionsRange;0)
	C_BOOLEAN:C305(SD2_bo_ActionsInited)
	C_LONGINT:C283($_l_actionRow; $_l_ParameterIndex)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetDiaryActionRangeByCode")

ARRAY TEXT:C222(SD2_at_ActionsRange; 0)
If (Not:C34(SD2_bo_ActionsInited))
	ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
	ARRAY TEXT:C222(SD2_at_ActionNames; 0)
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
	SD2_bo_ActionsInited:=True:C214
End if 

If (Count parameters:C259>=1)
	For ($_l_ParameterIndex; 1; Count parameters:C259)
		$_l_actionRow:=Find in array:C230(SD2_at_ActionCodes; ${$_l_ParameterIndex})
		If ($_l_actionRow>0)
			APPEND TO ARRAY:C911(SD2_at_ActionsRange; ${$_l_ParameterIndex})
			
		End if 
	End for 
End if 
$0:=->SD2_at_ActionsRange
ERR_MethodTrackerReturn("SD_GetDiaryActionRangeByCode"; $_t_oldMethodName)
