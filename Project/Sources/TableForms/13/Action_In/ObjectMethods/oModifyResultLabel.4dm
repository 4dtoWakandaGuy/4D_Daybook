If (False:C215)
	//object Name: [ACTIONS]Action_In.oModifyResultLabel
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
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_AutoResultCodes;0)
	//ARRAY TEXT(SD2_at_AutoResultNames;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	C_LONGINT:C283($_l_event; $_l_ResultsFieldRow; $_l_ResultsIndex; $_l_ResultsRow)
	C_TEXT:C284($_t_oldMethodName; SD2_t_AutoAction; SD2_t_AutoResult)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable39"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD2_ModifyResults(->SD2_at_ResultCodes)
		
		SORT ARRAY:C229(SD2_at_ResultCodes; >)
		ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ResultCodes))
		For ($_l_ResultsIndex; 1; Size of array:C274(SD2_at_ResultCodes))
			If (SD2_at_ResultCodes{$_l_ResultsIndex}#"")  //it should be but just in case
				$_l_ResultsRow:=Find in array:C230(SD2_at_AllResultCodes; SD2_at_ResultCodes{$_l_ResultsIndex})
				If ($_l_ResultsRow>0)
					SD2_at_ResultNames{$_l_ResultsIndex}:=SD2_at_AllresultNames{$_l_ResultsRow}
				End if 
			End if 
			
		End for 
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
			$_l_ResultsFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")
			If ($_l_ResultsFieldRow>0)
				SD2_t_AutoResult:=SD2_at_ActionVirtFieldDataTXT{$_l_ResultsFieldRow}
			End if 
			OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; True:C214)
			OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; False:C215)
			OBJECT SET ENTERABLE:C238(SD2_t_AutoResult; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable39"; $_t_oldMethodName)
