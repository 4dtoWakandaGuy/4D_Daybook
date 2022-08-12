//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetSelectedDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:53`Method: Cal4D_Cal_GetSelectedDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0)
	C_LONGINT:C283(Cal_l_SelectedDate)
	C_TEXT:C284($_t_oldMethodName; $_t_RefID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetSelectedDate")
$_d_Date:=!00-00-00!

If (Cal_l_SelectedDate#-1)
	$_d_Date:=SD_ORDINtoDate(Cal_l_SelectedDate)
End if 

$0:=$_d_Date
ERR_MethodTrackerReturn("Cal4D_Cal_GetSelectedDate"; $_t_oldMethodName)