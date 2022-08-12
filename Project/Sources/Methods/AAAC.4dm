//%attributes = {}
If (False:C215)
	//Project Method Name:      AAAC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
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

$_t_oldMethodName:=ERR_MethodTracker("AAAC")  //I have decided that the way we have the data packed into the blobs in the list properties is just 2 slow
If (Not:C34(Is compiled mode:C492))
	Compiler_Variables_Inter
	Compiler_Arrays_Inter
	COMPILER_MIR
End if 
ERR_MethodTrackerReturn("AAAC"; $_t_oldMethodName)
