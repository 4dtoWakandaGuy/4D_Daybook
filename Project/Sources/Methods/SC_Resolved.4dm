//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_Resolved
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
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_Resolved")
If ([SERVICE_CALLS:20]Resolved:9)
	$0:="Resolved"
Else 
	$0:="Unresolved"
End if 
ERR_MethodTrackerReturn("SC_Resolved"; $_t_oldMethodName)
