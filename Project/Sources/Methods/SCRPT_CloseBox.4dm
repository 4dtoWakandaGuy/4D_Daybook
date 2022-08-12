//%attributes = {}
If (False:C215)
	//Project Method Name:      SCRPT_CloseBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2012 19:28
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

$_t_oldMethodName:=ERR_MethodTracker("SCRPT_CloseBox")
HIDE PROCESS:C324(Current process:C322)
//TRACE
//CANCEL
ERR_MethodTrackerReturn("SCRPT_CloseBox"; $_t_oldMethodName)