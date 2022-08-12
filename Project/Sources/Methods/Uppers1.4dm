//%attributes = {}
If (False:C215)
	//Project Method Name:      Uppers1
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

$_t_oldMethodName:=ERR_MethodTracker("Uppers1")
If (Count parameters:C259>=1)
	$0:=Uppercase:C13(Substring:C12($1; 1; 1))+Substring:C12($1; 2; 32000)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Uppers1"; $_t_oldMethodName)