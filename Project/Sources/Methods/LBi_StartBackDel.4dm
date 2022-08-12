//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_StartBackDel
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
	C_LONGINT:C283($2; $3)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBackDel")

//This method is a direct Replacement for ALStartBackDel

$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBackDel")
//ALStartBackDel - used to delete columns that cannot be show cos they exceed max
$0:=$1
ERR_MethodTrackerReturn("LBi_StartBackDel"; $_t_oldMethodName)