//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetDiaryDateRange
	//------------------ Method Notes ------------------
	// This method will return a pointer to an array of dates. This will be a contiguous range so pass TWO paramters in.start and end
	// if you pass one date in then it is assumed you want just that date.
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 20:36`Method: SD_GetDiaryDateRange
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD2_ad_DateRange;0)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $1; $2)
	C_LONGINT:C283($_l_Difference; $_l_index)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetDiaryDateRange")
ARRAY DATE:C224(SD2_ad_DateRange; 0)
Case of 
	: (Count parameters:C259=1)
		APPEND TO ARRAY:C911(SD2_ad_DateRange; $1)
		
	: (Count parameters:C259=2)
		$_d_StartDate:=$1
		$_d_EndDate:=$2
		$_l_Difference:=$_d_EndDate-$_d_StartDate
		For ($_l_index; 1; $_l_Difference)
			APPEND TO ARRAY:C911(SD2_ad_DateRange; $_d_StartDate+($_l_index-1))
		End for 
		
End case 
ERR_MethodTrackerReturn("SD_GetDiaryDateRange"; $_t_oldMethodName)
