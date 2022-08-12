//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_Title
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_Title")
//Jobs_Title
If ([JOBS:26]State:9#[TABLE_RECORD_STATES:90]State_Reference:4)
	RELATE ONE:C42([JOBS:26]State:9)
End if 
ERR_MethodTrackerReturn("Jobs_Title"; $_t_oldMethodName)