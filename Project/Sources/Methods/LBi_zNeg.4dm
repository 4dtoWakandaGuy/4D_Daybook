//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_zNeg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_zNeg")

//this method is a direct replacement for ALzNeg. AlzNeg does not appear to be called
$_t_oldMethodName:=ERR_MethodTracker("LBi_zNeg")
//zneg

If ($1<0)
	$0:=0
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("LBi_zNeg"; $_t_oldMethodName)