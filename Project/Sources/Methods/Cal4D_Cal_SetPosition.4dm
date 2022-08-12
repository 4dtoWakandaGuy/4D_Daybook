//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetPosition
	//------------------ Method Notes ------------------
	
	//Parameter
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:35`Method: Cal4D_Cal_SetPosition
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CalendarBottom; <>CAL_l_CalendarRight; <>CAL_l_CalendarTop; <>CAL_l_CalendarLeft; $1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetPosition")



<>CAL_l_CalendarLeft:=$1
<>CAL_l_CalendarTop:=$2
<>CAL_l_CalendarRight:=$3
<>CAL_l_CalendarBottom:=$4
ERR_MethodTrackerReturn("Cal4D_Cal_SetPosition"; $_t_oldMethodName)