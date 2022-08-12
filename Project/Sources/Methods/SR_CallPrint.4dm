//%attributes = {}
If (False:C215)
	//Project Method Name:      
	SR_Print
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
	C_LONGINT:C283($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR Print")
//SR Print - see also SR_Print_Result
If (Count parameters:C259=2)
	SR_Print2($1; $2)
Else 
	SR_Print2($1; $2; $3)
End if 
ERR_MethodTrackerReturn("SR Print"; $_t_oldMethodName)
