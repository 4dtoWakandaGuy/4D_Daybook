//%attributes = {}

If (False:C215)
	//Project Method Name:      Util_DateTimeSplit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/03/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Position)
	C_POINTER:C301($_Ptr_Date; $_ptr_OutputDate; $_Ptr_OUtputTime; $2; $3)
	C_TEXT:C284($_t_DateString; $_t_DateTime; $_t_TimeString; $1)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Util_DateTimeSplit")
//TRACE
$_t_DateTime:=$1
$_ptr_OutputDate:=$2
$_Ptr_OUtputTime:=$3
$_l_Position:=Position:C15(" "; $_t_DateTime)
$_t_DateString:=Substring:C12($_t_DateTime; 1; $_l_Position-1)
$_t_TimeString:=Substring:C12($_t_DateTime; $_l_Position+1)
$_t_DateTime:=$_t_DateString+"T"+$_t_TimeString
$_d_Date:=Date:C102($_t_DateTime)
$_ti_Time:=Time:C179($_t_DateTime)
$_ptr_OutputDate->:=$_d_Date
$_Ptr_OUtputTime->:=$_ti_Time
ERR_MethodTrackerReturn("Util_DateTimeSplit"; $_t_oldMethodName)