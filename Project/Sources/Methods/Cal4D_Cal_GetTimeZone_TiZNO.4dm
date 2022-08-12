//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetTimeZone_TiZNO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:57`Method: Cal4D_Cal_GetTimeZone_TiZNO
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowReference; CAL_l_SetDST)
	C_TEXT:C284($_t_oldMethodName; $_t_Timezone; $_t_WeekStart; $_t_Zone; $1; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetTimeZone_TiZNO")

$_t_Timezone:=$1
$_t_WeekStart:=DB_GetIndexedString(32000; 1)
CAL_l_SetDST:=0

//========================    Method Actions    ==================================

$_l_WindowReference:=Open form window:C675("Cal4D_TiZNO_Picker_d"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("Cal4D_TiZNO_Picker_d")
CLOSE WINDOW:C154($_l_WindowReference)

If (OK=1)
	Cal4D_TimeZone_SaveToDisk(Cal4D_User_Name)
	
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_GetTimeZone_TiZNO"; $_t_oldMethodName)