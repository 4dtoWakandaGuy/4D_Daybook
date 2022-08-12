//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetPositionByObject
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_Cal_SetPositionByObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>CAL_t_PositionObjectName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetPositionByObject")


<>CAL_t_PositionObjectName:=$1
ERR_MethodTrackerReturn("Cal4D_Cal_SetPositionByObject"; $_t_oldMethodName)