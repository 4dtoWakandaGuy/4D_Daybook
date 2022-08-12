//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_AtSign
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_AtSign")
If (Count parameters:C259>=1)
	If ($1#"")
		$0:=Check_QM($1)
		If (Character code:C91(Substring:C12($0; Length:C16($0); 1))#64)
			$0:=$0+"@"
		End if 
	Else 
		$0:=$1
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Sel_AtSign"; $_t_oldMethodName)