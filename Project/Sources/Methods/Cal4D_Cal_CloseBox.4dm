//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_CloseBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:59`Method: Cal4D_Cal_CloseBox
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

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_CloseBox")

CANCEL:C270
ERR_MethodTrackerReturn("Cal4D_Cal_CloseBox"; $_t_oldMethodName)