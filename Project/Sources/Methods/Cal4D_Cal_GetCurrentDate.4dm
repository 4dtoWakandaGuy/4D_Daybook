//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetCurrentDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:29`Method: Cal4D_Cal_GetCurrentDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0)
	C_LONGINT:C283(Cal_l_DateToday)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetCurrentDate")



$0:=SD_ORDINtoDate(Cal_l_DateToday)
ERR_MethodTrackerReturn("Cal4D_Cal_GetCurrentDate"; $_t_oldMethodName)