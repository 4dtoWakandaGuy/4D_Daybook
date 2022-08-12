//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_FontFS_ByPointer
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
	C_LONGINT:C283($_l_CountParameters; $_l_FontSIze; $_l_Index; $2)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_FontFS_ByPointer")
If (Count parameters:C259>=3)
	$_l_FontSIze:=$2
	$_l_CountParameters:=Count parameters:C259
	For ($_l_Index; 3; $_l_CountParameters)
		$_ptr_Variable:=${$_l_Index}
		If (Not:C34(Is nil pointer:C315($_ptr_Variable)))
			OBJECT SET FONT:C164($_ptr_Variable->; $1)
			If ($_l_FontSIze>0)
				OBJECT SET FONT SIZE:C165($_ptr_Variable->; $_l_FontSIze)
			End if 
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("Set_FontFS_ByPointer"; $_t_oldMethodName)
