//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Get
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2011 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Get")
//FurthFld_Get - Gets Value from a Field
//Called within this cos of Windows 4D error


If (Count parameters:C259=2)
	$0:=FurthFld_Get2($1; $2)
Else 
	$0:=FurthFld_Get2($1; $2; $3)
End if 
ERR_MethodTrackerReturn("FurthFld_Get"; $_t_oldMethodName)