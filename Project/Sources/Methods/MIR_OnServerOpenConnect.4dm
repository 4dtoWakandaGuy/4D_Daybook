//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_OnServerOpenConnect
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
	C_LONGINT:C283($0)
	C_TEXT:C284(<>MIR_t_ServerType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_OnServerOpenConnect")

//Doesn't allow connections into the 'Mirror' database
// Declare parameters

$0:=0  // Default everything OK
If (<>MIR_t_ServerType="Mirror")
	$0:=-17001  // Don't allow connections to the mirrored server. Data might get accidentally changed
End if 
// End of method
ERR_MethodTrackerReturn("MIR_OnServerOpenConnect"; $_t_oldMethodName)