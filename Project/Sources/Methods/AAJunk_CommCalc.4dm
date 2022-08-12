//%attributes = {}

If (False:C215)
	//Project Method Name:      AAJunk_CommCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AAJunk_CommCalc")
ERR_MethodTrackerReturn("AAJunk_CommCalc"; $_t_oldMethodName)