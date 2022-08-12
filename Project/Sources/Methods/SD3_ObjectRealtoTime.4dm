//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_ObjectRealtoTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Seconds; $1)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($0)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_ObjectRealtoTime")
If (Count parameters:C259>=1)
	
	$0:=Time:C179($1)
End if 
ERR_MethodTrackerReturn("SD3_ObjectRealtoTime"; $_t_oldMethodName)
