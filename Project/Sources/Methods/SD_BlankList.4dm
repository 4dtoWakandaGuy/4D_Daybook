//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_BlankList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountListItems; SD_l_HLDayTime)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_BlankList")
$_l_CountListItems:=Count list items:C380(SD_l_HLDayTime)
If ($_l_CountListItems<1)
	$_l_CountListItems:=$_l_CountListItems+1
	APPEND TO LIST:C376(SD_l_HLDayTime; "No Appointments..."; $_l_CountListItems; 0; False:C215)
	SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Plain:K14:1+Italic:K14:3; 0)
Else 
	SET LIST ITEM PROPERTIES:C386(SD_l_HLDayTime; 0; False:C215; Bold:K14:2; 0)
End if 
ERR_MethodTrackerReturn("SD_BlankList"; $_t_oldMethodName)
