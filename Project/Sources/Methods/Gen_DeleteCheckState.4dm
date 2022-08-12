//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DeleteCheckState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 18:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_Stati; 0)
	C_BOOLEAN:C305(<>StatesLoaded; $0)
	C_LONGINT:C283($_l_CountRecords; $_l_CurrentStatus; $_l_StatusColumn; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; $_t_UsageCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DeleteCheckState")
//Gen PPCheckState

If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$0:=True:C214
$_l_TableNumber:=Table:C252($1)
If (Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})>0)
	$_ptr_Table:=Table:C252($_l_TableNumber)
	$_l_CountRecords:=Records in selection:C76($_ptr_Table->)
	ARRAY TEXT:C222($_at_Stati; $_l_CountRecords)
	SELECTION TO ARRAY:C260($1->; $_at_Stati)
	SORT ARRAY:C229($_at_Stati; >)
	If ($_l_CountRecords>0)
		$_t_Status:=""
		$_l_CurrentStatus:=1
		While (($_l_CurrentStatus<=$_l_CountRecords) & ($0))
			IDLE:C311  // 03/04/03 pb
			If ($_t_Status#$_at_Stati{$_l_CurrentStatus})
				$_t_Status:=$_at_Stati{$_l_CurrentStatus}
				$_l_StatusColumn:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; Substring:C12($_t_Status; 4; Length:C16($_t_Status)))
				If ($_l_StatusColumn>0)
					$_t_UsageCode:="090"+$_t_Status
					QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UsageCode; *)
					QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=10)
					If (Records in selection:C76([CODE_USES:91])>0)
						Gen_Alert("The Record State '"+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusColumn}+"' does not allow Deletions"; "Cancel")
						$0:=False:C215
					Else 
						If ((((<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusColumn}\2)%2)=1) | (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusColumn}\4)%2)=1))
							Gen_Alert("You do not have access rights to Delete records with record State '"+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusColumn}+"'"; "Cancel")
							$0:=False:C215
						End if 
					End if 
				End if 
			End if 
			$_l_CurrentStatus:=$_l_CurrentStatus+1
		End while 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_DeleteCheckState"; $_t_oldMethodName)