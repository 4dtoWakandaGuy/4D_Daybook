//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPChkSt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 17:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_Stati; 0)
	C_BOOLEAN:C305(<>StatesLoaded; $0)
	C_LONGINT:C283($_l_CountRecords; $_l_CurrentRecord; $_l_StatusCodeColumn; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; $_t_StatusCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PPChkSt")
//Gen PPCheckState
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$0:=True:C214
$_l_TableNumber:=Table:C252($1)
$_ptr_Table:=Table:C252($_l_TableNumber)
$_l_CountRecords:=Records in selection:C76($_ptr_Table->)
ARRAY TEXT:C222($_at_Stati; $_l_CountRecords)
SELECTION TO ARRAY:C260($1->; $_at_Stati)
SORT ARRAY:C229($_at_Stati; >)
If ($_l_CountRecords>0)
	$_t_Status:=""
	$_l_CurrentRecord:=1
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	While (($_l_CurrentRecord<=$_l_CountRecords) & ($0))
		IDLE:C311  // 03/04/03 pb
		If ($_t_Status#$_at_Stati{$_l_CurrentRecord})
			$_t_Status:=$_at_Stati{$_l_CurrentRecord}
			$_t_StatusCode:="090"+$_t_Status
			QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatusCode; *)
			QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$2)
			If (Records in selection:C76([CODE_USES:91])=0)
				$_l_StatusCodeColumn:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; Substring:C12($_t_Status; 4; Length:C16($_t_Status)))
				If ($_l_StatusCodeColumn>0)
					Gen_Alert("The record State '"+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusCodeColumn}+"' does not allow this Function"+" to be used"; "Cancel")
				Else 
					If ($_l_CountRecords>1)
						Gen_Alert("One or more of these records have States that do not allow this Function"+" to be used"; "Cancel")
					Else 
						Gen_Alert("This record has a State that does not allow this Function"+" to be used"; "Cancel")
					End if 
				End if 
				$0:=False:C215
			End if 
		End if 
		$_l_CurrentRecord:=$_l_CurrentRecord+1
	End while 
End if 
ERR_MethodTrackerReturn("Gen_PPChkSt"; $_t_oldMethodName)