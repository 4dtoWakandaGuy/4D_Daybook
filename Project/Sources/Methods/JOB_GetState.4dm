//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_GetState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/06/2010 19:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_GetState")
If ([TABLE_RECORD_STATES:90]State_Reference:4#[JOBS:26]State:9)
	If ([JOBS:26]State:9#"")
		RELATE ONE:C42([JOBS:26]State:9)
		$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
	Else 
		$0:=""
	End if 
Else 
	$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
End if 
ERR_MethodTrackerReturn("JOB_GetState"; $_t_oldMethodName)