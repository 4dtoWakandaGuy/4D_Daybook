//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Project SelCU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CodeUsesCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	C_LONGINT:C283($_l_RecordsInSelection; $_l_use; $i)
	C_POINTER:C301($_Ptr_CodeFIeld; $_ptr_CodeTable; $1; $2)
	C_TEXT:C284($_at_UseCode; $_l_CodeTable; $_t_CodeTable; $_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Project SelCU")
If (Count parameters:C259>=3)
	$_ptr_CodeTable:=$1
	$_Ptr_CodeFIeld:=$2
	$_l_use:=Num:C11($3)  //Change to read lots of ors if the parameter contains more than one
	$_t_CodeTable:=String:C10(Table:C252($_ptr_CodeTable))
	$_t_CodeTable:=("0"*(3-Length:C16($_t_CodeTable)))+$_t_CodeTable
	$_l_RecordsInSelection:=Records in selection:C76($_ptr_CodeTable->)
	
	If ($_l_RecordsInSelection>1)
		If ($_l_RecordsInSelection<256) | (True:C214)
			ARRAY TEXT:C222($_at_RecordCodes; 0)
			SELECTION TO ARRAY:C260($_Ptr_CodeFIeld->; $_at_RecordCodes)
			ARRAY TEXT:C222($_at_CodeUsesCodes; 0)
			ARRAY TEXT:C222($_at_CodeUsesCodes; Size of array:C274($_at_RecordCodes))
			For ($i; 1; Size of array:C274($_at_RecordCodes))
				$_at_CodeUsesCodes{$i}:=$_l_CodeTable+$_at_RecordCodes{$i}
			End for 
			QUERY WITH ARRAY:C644([CODE_USES:91]Code:1; $_at_CodeUsesCodes)
			If (False:C215)
				$_at_UseCode:=$_l_CodeTable+$_at_RecordCodes{1}
				QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_at_UseCode; *)
				$i:=2
				While ($i<Size of array:C274($_at_RecordCodes))
					$_at_UseCode:=$_l_CodeTable+$_at_RecordCodes{$i}
					QUERY:C277([CODE_USES:91];  | ; [CODE_USES:91]Code:1=$_at_UseCode; *)
					$i:=$i+1
				End while 
				$_at_UseCode:=$_l_CodeTable+$_at_RecordCodes{$i}
				QUERY:C277([CODE_USES:91];  | ; [CODE_USES:91]Code:1=$_at_UseCode)
			End if 
			QUERY SELECTION:C341([CODE_USES:91]; [CODE_USES:91]Use:2=$_l_use)
		Else 
			CREATE SET:C116([CODE_USES:91]; "Use")
			FIRST RECORD:C50($_ptr_CodeTable->)
			While (Not:C34(End selection:C36($_ptr_CodeTable->)))
				$_at_UseCode:=$_l_CodeTable+$_Ptr_CodeFIeld->
				QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_at_UseCode; *)
				QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_l_use)
				ADD TO SET:C119([CODE_USES:91]; "Use")
				NEXT RECORD:C51($_ptr_CodeTable->)
			End while 
			USE SET:C118("Use")
			CLEAR SET:C117("Use")
		End if 
	Else 
		$_at_UseCode:=$_l_CodeTable+$_Ptr_CodeFIeld->
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_at_UseCode; *)
		QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_l_use)
	End if 
End if 
ERR_MethodTrackerReturn("Project SelCU"; $_t_oldMethodName)
