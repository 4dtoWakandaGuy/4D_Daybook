If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oButtonExtendDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD2_but_extendDates; SD2_l_ShowDate2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oButtonExtendDates"; Form event code:C388)

OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; True:C214)
OBJECT SET VISIBLE:C603(*; "oDateToButton@"; True:C214)
OBJECT SET VISIBLE:C603(*; "oDateToLabel@"; True:C214)
OBJECT SET VISIBLE:C603(SD2_but_extendDates; False:C215)
SD2_l_ShowDate2:=1
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oButtonExtendDates"; $_t_oldMethodName)