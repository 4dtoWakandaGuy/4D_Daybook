//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_IsaLeapyear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsLeapYear; $0)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Year)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_IsaLeapyear")

$_l_Year:=Year of:C25($1)


$_bo_IsLeapYear:=($_l_Year%4)=0
If ($_bo_IsLeapYear & (($_l_Year%100)=0))
	$_bo_IsLeapYear:=($_l_Year%400)=0
End if 

$0:=$_bo_IsLeapYear
ERR_MethodTrackerReturn("SD_IsaLeapyear"; $_t_oldMethodName)
