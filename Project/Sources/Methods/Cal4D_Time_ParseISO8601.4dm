//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Time_ParseISO8601
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WithTimeZone; $2)
	C_TEXT:C284($_t_Day; $_t_Format; $_t_Hour; $_t_ISO; $_t_MethodName; $_t_Minute; $_t_Month; $_t_oldMethodName; $_t_Year; $_t_Zone; $0)
	C_TEXT:C284($1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Time_ParseISO8601")


$_t_ISO:=$1
$_bo_WithTimeZone:=$2

// //  20090330T15:21:00
$_t_Year:=Substring:C12($_t_ISO; 1; 4)
$_t_Month:=Substring:C12($_t_ISO; 5; 2)
$_t_Day:=Substring:C12($_t_ISO; 7; 2)
$_t_Hour:=Substring:C12($_t_ISO; 10; 2)
$_t_Minute:=Substring:C12($_t_ISO; 13; 2)

//========================    Method Actions    ==================================

If ($_bo_WithTimeZone)
	$_t_Zone:=Cal4D_iCal_GetTimezoneOffset
Else 
	$_t_Zone:="+0000"  //make it a UTC time
End if 

//========================    Clean up and Exit    =================================

$_t_Format:=$_t_Year+"/"+$_t_Month+"/"+$_t_Day+"T"+$_t_Hour+":"+$_t_Minute+"UTC"+$_t_Zone

$0:=$_t_Format
ERR_MethodTrackerReturn("Cal4D_Time_ParseISO8601"; $_t_oldMethodName)