//%attributes = {}

If (False:C215)
	//Project Method Name:      AAJUNK_SalesCommAuto
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
$_t_oldMethodName:=ERR_MethodTracker("AAJUNK_SalesCommAuto")
ERR_MethodTrackerReturn("AAJUNK_SalesCommAuto"; $_t_oldMethodName)