//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_Declare
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

$_t_oldMethodName:=ERR_MethodTracker("BDL_Declare")
Compiler_BDL_IV
ERR_MethodTrackerReturn("BDL_Declare"; $_t_oldMethodName)
