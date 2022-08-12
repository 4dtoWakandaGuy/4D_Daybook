//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_errorSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; vPDF995_errorText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_errorSet")

vPDF995_errorText:=$1

ERR_MethodTrackerReturn("PDF995_errorSet"; $_t_oldMethodName)
