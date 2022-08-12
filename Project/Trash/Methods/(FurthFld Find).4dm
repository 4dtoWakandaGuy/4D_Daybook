//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFld Find
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld Find")
//FurthFld Find - Finds main records from FF selection
//Called within this cos of Windows 4D error

If (Count parameters:C259=3)
	$0:=FurthFld_Find2($1; $2; $3; $3; 0)
Else 
	$0:=FurthFld_Find2($1; $2; $3; $4; 0)
End if 
ERR_MethodTrackerReturn("FurthFld Find"; $_t_oldMethodName)