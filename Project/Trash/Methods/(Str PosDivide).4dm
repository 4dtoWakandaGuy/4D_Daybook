//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str PosDivide
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
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str PosDivide")
If (Count parameters:C259>=1)
	$0:=Position:C15("/"; $1)
	If ($0=0)
		$0:=Position:C15("-"; $1)
		If ($0=0)
			$0:=Position:C15("."; $1)
			If ($0=0)
				$0:=Position:C15(":"; $1)
			End if 
		End if 
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("Str PosDivide"; $_t_oldMethodName)