//%attributes = {}

If (False:C215)
	//Database Method Name:      GEN_setBit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("GEN_setBit")
$1->:=$1-> ?+ $2
ERR_MethodTrackerReturn("GEN_setBit"; $_t_oldMethodName)