//%attributes = {}
If (False:C215)
	//Project Method Name:      PRJ_GetState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/06/2010 20:00
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

$_t_oldMethodName:=ERR_MethodTracker("PRJ_GetState")


If ([TABLE_RECORD_STATES:90]State_Reference:4#[PROJECTS:89]State:9)
	If ([PROJECTS:89]State:9#"")
		RELATE ONE:C42([PROJECTS:89]State:9)
		$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
	Else 
		$0:=""
	End if 
Else 
	$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
End if 
ERR_MethodTrackerReturn("PRJ_GetState"; $_t_oldMethodName)
