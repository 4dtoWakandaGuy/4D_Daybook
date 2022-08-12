//%attributes = {}
If (False:C215)
	//Project Method Name:      Array_FindCaseSensitive
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoContinue)
	C_LONGINT:C283($_l_Offset; $_l_ValuePosition; $0; $3)
	C_POINTER:C301($_ptr_ArrayofValues; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ValuetoFInd; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Array_FindCaseSensitive")
// (PM) ARRAY_FindCaseSensitive
// Performs a case-sensitive find in array
// $1 = Pointer to array
// $2 = Value to find
// $3 = Start position (optional)
// $0 = Found position


$_ptr_ArrayofValues:=$1
$_t_ValuetoFInd:=$2
If (Count parameters:C259>=3)
	$_l_Offset:=$3
Else 
	$_l_Offset:=1
End if 

$_bo_AutoContinue:=True:C214
//
While ($_bo_AutoContinue)
	
	$_l_ValuePosition:=Find in array:C230($_ptr_ArrayofValues->; $_t_ValuetoFInd; $_l_Offset)
	Case of 
		: ($_l_ValuePosition=-1)
			$_bo_AutoContinue:=False:C215
		: (STR_CaseCompare($_ptr_ArrayofValues->{$_l_ValuePosition}; $_t_ValuetoFInd))
			$_bo_AutoContinue:=False:C215
		Else 
			$_l_Offset:=$_l_ValuePosition+1
	End case 
	
End while 

$0:=$_l_ValuePosition
ERR_MethodTrackerReturn("Array_FindCaseSensitive"; $_t_oldMethodName)