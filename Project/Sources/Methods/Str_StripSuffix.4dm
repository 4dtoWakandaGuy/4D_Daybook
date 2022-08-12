//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_StripSuffix
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
	C_LONGINT:C283($l)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_StripSuffix")
//Str_StripSuffix - removes .txt etc from the document name
If (Count parameters:C259>1)
	$l:=Length:C16($1)
	If ($l>4)
		If (Substring:C12($1; $l-3; 1)=".")
			$0:=Substring:C12($1; 1; $l-4)
		Else 
			$0:=$1
		End if 
	Else 
		$0:=$1
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_StripSuffix"; $_t_oldMethodName)