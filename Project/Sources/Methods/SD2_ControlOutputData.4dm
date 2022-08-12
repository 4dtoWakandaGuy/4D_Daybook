//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ControlOutputData
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
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ControlOutputData")
Trigger_setDiaryDisplayData
[DIARY:12]Display_Description:55:=Replace string:C233([DIARY:12]Display_Description:55; Char:C90(13); " ")
$0:=[DIARY:12]Display_Date_From:51
ERR_MethodTrackerReturn("SD2_ControlOutputData"; $_t_oldMethodName)
