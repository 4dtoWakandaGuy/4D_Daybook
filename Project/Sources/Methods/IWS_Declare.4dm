//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Declare
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Declare")
// IWS_Declare

Compiler_IWS_IV
Compiler_IWS_IA

// End IWS_Declare
ERR_MethodTrackerReturn("IWS_Declare"; $_t_oldMethodName)