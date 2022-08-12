//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_alert_SD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_alert_SD")
Gen_Confirm($1; $2; $3)
$0:=OK
ERR_MethodTrackerReturn("Gen_alert_SD"; $_t_oldMethodName)