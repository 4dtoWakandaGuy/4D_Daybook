//%attributes = {}

If (False:C215)
	//Project Method Name:      EventTracker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Seconds; $1)
End if 
//Code Starts Here
//log show --last 2s
$_l_Seconds:=$1
