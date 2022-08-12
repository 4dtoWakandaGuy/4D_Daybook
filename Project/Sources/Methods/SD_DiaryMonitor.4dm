//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryMonitor
	//------------------ Method Notes ------------------
	//This method will update diary records where the action requires auto notification by email and where the action should auto complete
	//this runs server side
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 08:40`Method: SD_DiaryMonitor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_AutoComplete;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ResultCode;0)
	C_BOOLEAN:C305(<>DB_bo_Exit)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryMonitor")
ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
ARRAY TEXT:C222(SD2_at_ActionNames; 0)
ALL RECORDS:C47([ACTIONS:13])
SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_ActionNames)
ARRAY BOOLEAN:C223(SD2_abo_AutoComplete; 0)
ARRAY TEXT:C222(SD2_at_ResultCode; 0)
FIRST RECORD:C50([ACTIONS:13])
//For ($i;1;Records in selection([ACTIONS]))

//End for 
Repeat 
	
Until (<>DB_bo_Exit)
ERR_MethodTrackerReturn("SD_DiaryMonitor"; $_t_oldMethodName)
