If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable49
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
	//ARRAY LONGINT(SD2_al_AutoActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_AutoActions;0)
	//ARRAY TEXT(SD2_at_AutoResultCodes;0)
	//ARRAY TEXT(SD2_at_AutoResultNames;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	C_LONGINT:C283($_l_AutoResultField; $_l_ResultsIndex; SD2_l_AutoActionCode)
	C_TEXT:C284($_t_oldMethodName; SD2_t_AutoAction; SD2_t_AutoResult)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable49"; Form event code:C388)
If (SD2_at_AutoActions>0)
	SD2_t_AutoAction:=SD2_at_AutoActions{SD2_at_AutoActions}
	SD2_l_AutoActionCode:=SD2_al_AutoActionCodes{SD2_at_AutoActions}
	If (SD2_t_AutoAction="Auto complete")
		If (Size of array:C274(SD2_at_ResultCodes)=0)
			ARRAY TEXT:C222(SD2_at_AutoResultNames; Size of array:C274(SD2_at_AllResultCodes))
			ARRAY TEXT:C222(SD2_at_AutoResultCodes; Size of array:C274(SD2_at_AllResultCodes))
			For ($_l_ResultsIndex; 1; Size of array:C274(SD2_at_AllResultCodes))
				SD2_at_AutoResultCodes{$_l_ResultsIndex}:=SD2_at_AllResultCodes{$_l_ResultsIndex}
				SD2_at_AutoResultNames{$_l_ResultsIndex}:=SD2_at_AllresultNames{$_l_ResultsIndex}
			End for 
		Else 
			ARRAY TEXT:C222(SD2_at_AutoResultNames; Size of array:C274(SD2_at_ResultCodes))
			ARRAY TEXT:C222(SD2_at_AutoResultCodes; Size of array:C274(SD2_at_ResultCodes))
			
			For ($_l_ResultsIndex; 1; Size of array:C274(SD2_at_AutoResultCodes))
				SD2_at_AutoResultCodes{$_l_ResultsIndex}:=SD2_at_ResultCodes{$_l_ResultsIndex}
				SD2_at_AutoResultNames{$_l_ResultsIndex}:=SD2_at_ResultNames{$_l_ResultsIndex}
			End for 
			
		End if 
		$_l_AutoResultField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")
		If ($_l_AutoResultField>0)
			SD2_t_AutoResult:=SD2_at_ActionVirtFieldDataTXT{$_l_AutoResultField}
		End if 
		OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; True:C214)
		OBJECT SET ENTERABLE:C238(SD2_t_AutoResult; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; False:C215)
		OBJECT SET ENTERABLE:C238(SD2_t_AutoResult; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; False:C215)
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable49"; $_t_oldMethodName)
