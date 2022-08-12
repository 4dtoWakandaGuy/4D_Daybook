//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str TrailSpaces
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
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str TrailSpaces")
If (Count parameters:C259>=2)
	$0:=$1+(" "*($2-Length:C16($1)))
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str TrailSpaces"; $_t_oldMethodName)