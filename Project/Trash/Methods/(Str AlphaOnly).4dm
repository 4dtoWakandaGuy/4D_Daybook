//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str AlphaOnly
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

$_t_oldMethodName:=ERR_MethodTracker("Str AlphaOnly")
//strips every character apart from Alpha Letters
If (Count parameters:C259>=1)
	$0:=Str_AlphaOnly2($1)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str AlphaOnly"; $_t_oldMethodName)