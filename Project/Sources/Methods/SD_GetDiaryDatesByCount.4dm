//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetDiaryDatesByCount
	//------------------ Method Notes ------------------
	//Pass this method a start date in S1 and a number of Days
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 20:44`Method: SD_GetDiaryDatesByCount
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $1)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetDiaryDatesByCount")
If (Count parameters:C259=2)
	$_d_StartDate:=$1
	$_d_EndDate:=$1+$2
	$0:=SD_GetDiaryDateRange($_d_StartDate; $_d_EndDate)
	
End if 
ERR_MethodTrackerReturn("SD_GetDiaryDatesByCount"; $_t_oldMethodName)
