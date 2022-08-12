//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetTimeZoneOffset
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:58`Method: Cal4D_Cal_GetTimeZoneOffset
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_TimeZones;0)
	C_TEXT:C284($_t_Designator; $_t_Offset; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetTimeZoneOffset")

$_t_Designator:=$1
Cal4D_Cal_GetTimezoneProcVars


$_t_Offset:=CAL_at_TimeZones{Find in array:C230(CAL_at_TimeZones; $_t_Designator+"@")}
$_t_Offset:=Substring:C12($_t_Offset; Position:C15(":"; $_t_Offset)+1)
$_t_Offset:=Substring:C12($_t_Offset; 1; Position:C15(":"; $_t_Offset)-1)


$0:=$_t_Offset
ERR_MethodTrackerReturn("Cal4D_Cal_GetTimeZoneOffset"; $_t_oldMethodName)