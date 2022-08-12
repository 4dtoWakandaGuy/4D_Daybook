//%attributes = {}
If (False:C215)
	//Project Method Name:      ST_LoadFunctions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 11:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_Usage; 0)
	C_LONGINT:C283($_l_index; ST_ReadWrite)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_StatesCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ST_LoadFunctions")
$_t_StatesCode:=String:C10(Table:C252(->[TABLE_RECORD_STATES:90]))
$_t_StatesCode:=("0"*(3-Length:C16($_t_StatesCode)))+$_t_StatesCode+$1
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StatesCode)
If (Records in selection:C76([CODE_USES:91])>0)
	ARRAY INTEGER:C220($_ai_Usage; Records in selection:C76([CODE_USES:91]))
	SELECTION TO ARRAY:C260([CODE_USES:91]Use:2; $_ai_Usage)
	For ($_l_index; 1; Size of array:C274($2->))
		If (Find in array:C230($_ai_Usage; $_l_index)>0)
			$2->{$_l_index}:=1
			$3->{$_l_index}:=True:C214
		Else 
			$2->{$_l_index}:=0
			$3->{$_l_index}:=False:C215
		End if 
	End for 
Else 
	If (ST_ReadWrite=1)
		For ($_l_index; 1; Size of array:C274($2->))
			$2->{$_l_index}:=1
			$3->{$_l_index}:=True:C214
		End for 
	Else 
		For ($_l_index; 1; Size of array:C274($2->))
			$2->{$_l_index}:=0
			$3->{$_l_index}:=False:C215
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("ST_LoadFunctions"; $_t_oldMethodName)
