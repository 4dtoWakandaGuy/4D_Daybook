//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_Declare
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
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

$_t_oldMethodName:=ERR_MethodTracker("CAC_Declare")
// CAC_Declare

Compiler_CAC_IV
Compiler_CAC_IA
Compiler_CAC_PV

// End CAC_Declare
ERR_MethodTrackerReturn("CAC_Declare"; $_t_oldMethodName)
