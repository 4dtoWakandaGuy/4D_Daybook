//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str StripDel
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

$_t_oldMethodName:=ERR_MethodTracker("Str StripDel")
If (Count parameters:C259>=1)
	$0:=Replace string:C233($1; Char:C90(127); "")
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str StripDel"; $_t_oldMethodName)
