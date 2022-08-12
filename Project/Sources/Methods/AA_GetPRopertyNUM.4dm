//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Position; $_l_PropertyNum; $0; $1)
	C_TEXT:C284($_t_attribute; $_t_OldMethodName; $_t_Value; $2; $3)
End if 
//Code Starts Here


$_t_OldMethodName:=ERR_MethodTracker("AA_GetPRopertyNUM")

$0:=0
If (Count parameters:C259>=2)
	$_l_PropertyNum:=$1
	$_t_attribute:=$2
	$_l_Position:=Position:C15(String:C10($_l_PropertyNum)+","; $_t_attribute)
	If ($_l_Position>0)
		$_t_Value:=Substring:C12($_t_attribute; $_l_Position+Length:C16(String:C10($_l_PropertyNum)+","); Length:C16($_t_attribute))
		$_l_Position:=Position:C15(";"; $_t_Value)
		If ($_l_Position>0)
			$_t_Value:=Substring:C12($_t_Value; 1; $_l_Position-1)
		End if 
		$0:=Num:C11($_t_Value)
	Else 
		$0:=0
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_GetPRopertyNUM"; $_t_OldMethodName)
