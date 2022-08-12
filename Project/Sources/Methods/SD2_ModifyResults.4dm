//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ModifyResults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_ai_SelectedResults;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ResultIndex; $_l_ResultRow; SD_l_Changes; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ModifyResults")
ARRAY INTEGER:C220(SD2_ai_SelectedResults; 0)

ARRAY INTEGER:C220(SD2_ai_SelectedResults; Size of array:C274(SD2_at_AllResultCodes))
For ($_l_ResultIndex; 1; Size of array:C274($1->))
	$_l_ResultRow:=Find in array:C230(SD2_at_AllResultCodes; $1->{$_l_ResultIndex})
	If ($_l_ResultRow>0)  //it should be
		SD2_ai_SelectedResults{$_l_ResultRow}:=1
	End if 
End for 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1984; "Select Results")
DIALOG:C40([USER:15]; "SD2_ResultsSelector")

If (SD_l_Changes>0)
	For ($_l_ResultIndex; Size of array:C274($1->); 1; -1)
		$_l_ResultRow:=Find in array:C230(SD2_at_AllResultCodes; $1->{$_l_ResultIndex})
		If ($_l_ResultRow>0)  //it should be
			If (SD2_ai_SelectedResults{$_l_ResultRow}=0)
				DELETE FROM ARRAY:C228($1->; $_l_ResultIndex)
			End if 
		End if 
	End for 
	For ($_l_ResultIndex; 1; Size of array:C274(SD2_ai_SelectedResults))
		If (SD2_ai_SelectedResults{$_l_ResultIndex}=1)
			$_l_ResultRow:=Find in array:C230($1->; SD2_at_AllResultCodes{$_l_ResultIndex})
			If ($_l_ResultRow<0)
				INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
				$1->{Size of array:C274($1->)}:=SD2_at_AllResultCodes{$_l_ResultIndex}
				
			End if 
			
		End if 
		
	End for 
	
End if 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("SD2_ModifyResults"; $_t_oldMethodName)
