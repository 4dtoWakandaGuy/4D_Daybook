//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartProcess
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

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartProcess")
Compiler_IME_PA
Compiler_IWS_PA
Compiler_IWS_PV
BDL_ProcessDeclare
ERR_MethodTrackerReturn("IWS_StartProcess"; $_t_oldMethodName)