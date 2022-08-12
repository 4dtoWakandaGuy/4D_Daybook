//%attributes = {}
If (False:C215)
	//Project Method Name:      UppersBetBrack
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
	C_LONGINT:C283($_l_CharPosition; $_l_CharPosition2)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UppersBetBrack")
If (Count parameters:C259>=1)
	$0:=$1
	If ($0#"")
		$_l_CharPosition:=Position:C15("("; $0)
		If ($_l_CharPosition>0)
			$_l_CharPosition2:=Position:C15(")"; $0)
			If ($_l_CharPosition2>0)
				$0:=Substring:C12($0; 1; $_l_CharPosition)+Uppercase:C13(Substring:C12($0; $_l_CharPosition+1; $_l_CharPosition2-$_l_CharPosition-1))+Substring:C12($0; $_l_CharPosition2; 32000)
			End if 
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("UppersBetBrack"; $_t_oldMethodName)
