//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_ClearSelectedEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:58`Method: Cal4D_Cal_ClearSelectedEvent
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_ClearSelectedEvent")

Cal_t_SelectedEventUID:=""
Cal_t_SelectedEventRef:=""
ERR_MethodTrackerReturn("Cal4D_Cal_ClearSelectedEvent"; $_t_oldMethodName)