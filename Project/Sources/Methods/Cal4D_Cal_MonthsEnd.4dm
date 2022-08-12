//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_MonthsEnd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 20:05`Method: Cal4D_Cal_MonthsEnd
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $_d_MonthsEnd; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_MonthsEnd")

$_d_Date:=$1


$_d_MonthsEnd:=Add to date:C393($_d_Date; 0; 1; 0)
$_d_MonthsEnd:=$_d_MonthsEnd-Day of:C23($_d_MonthsEnd)


$0:=$_d_MonthsEnd
ERR_MethodTrackerReturn("Cal4D_Cal_MonthsEnd"; $_t_oldMethodName)