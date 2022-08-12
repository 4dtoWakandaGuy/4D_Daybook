//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CULPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/03/2010 12:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_CodesUses; 0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	ARRAY TEXT:C222($_at_Codes; 0)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_SizeofArray)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CULPA")
//Gen_CULPA


$_t_UniqueCode:=String:C10(Table:C252($1))
$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+$1->
$_l_SizeofArray:=Size of array:C274($_ai_CodesUses)
ARRAY TEXT:C222($_at_Codes; 0)
ARRAY INTEGER:C220($_ai_CodesUses; 0)
$_l_CurrentRow:=0
For ($_l_Index; 1; $_l_SizeofArray)
	//If (CU_ai_CodeUsed{$_l_Index}=1)
	//INSERT IN ARRAY($_at_Codes;$_l_SizeofArray;1)
	//INSERT IN ARRAY($_ai_CodesUses;$_l_SizeofArray;1)
	//$_l_CurrentRow:=$_l_CurrentRow+1
	//$_at_Codes{$_l_CurrentRow}:=$_t_UniqueCode
	//$_ai_CodesUses{$_l_CurrentRow}:=CU_ai_CodeNo{$_l_Index}
	//End if
	//CU_abo_CodeUsed 
	If (CU_abo_CodeUsed{$_l_Index})
		INSERT IN ARRAY:C227($_at_Codes; $_l_SizeofArray; 1)
		INSERT IN ARRAY:C227($_ai_CodesUses; $_l_SizeofArray; 1)
		$_l_CurrentRow:=$_l_CurrentRow+1
		$_at_Codes{$_l_CurrentRow}:=$_t_UniqueCode
		$_ai_CodesUses{$_l_CurrentRow}:=CU_ai_CodeNo{$_l_Index}
	End if 
End for 
$_t_UniqueCode:=String:C10(Table:C252($1))
$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+Old:C35($1->)
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UniqueCode)
READ WRITE:C146([CODE_USES:91])
If ($_l_CurrentRow>0)
	If ($_l_CurrentRow<Records in selection:C76([CODE_USES:91]))
		DELETE SELECTION:C66([CODE_USES:91])
	End if 
	ARRAY TO SELECTION:C261($_at_Codes; [CODE_USES:91]Code:1; $_ai_CodesUses; [CODE_USES:91]Use:2)
Else 
	DELETE SELECTION:C66([CODE_USES:91])
End if 
READ ONLY:C145([CODE_USES:91])
UNLOAD RECORD:C212([CODE_USES:91])
ERR_MethodTrackerReturn("Gen_CULPA"; $_t_oldMethodName)
