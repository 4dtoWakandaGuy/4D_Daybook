//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SEQUENCESsetNextAction
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SEQUENCESsetNextAction")
//this method will get the next sequenced action
//and set it as the action code
If (Count parameters:C259>=1)
	If ($1#"")
		If ([WORKFLOW_CONTROL:51]WFControl_Code:10#$1)
			QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10=$1)
		End if 
		[DIARY:12]Action_Code:9:=[WORKFLOW_CONTROL:51]Next_Action:3
		Diary_InLPX(->[DIARY:12]Action_Code:9)
	End if 
End if 
ERR_MethodTrackerReturn("SD_SEQUENCESsetNextAction"; $_t_oldMethodName)
