//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_GetState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/06/2010 07:36
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

$_t_oldMethodName:=ERR_MethodTracker("ORD_GetState")
If ([TABLE_RECORD_STATES:90]State_Reference:4#[ORDERS:24]State:15)
	If ([ORDERS:24]State:15#"")
		RELATE ONE:C42([ORDERS:24]State:15)
		$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
	Else 
		$0:=""
	End if 
Else 
	$0:=[TABLE_RECORD_STATES:90]Entry_Name:5
End if 
ERR_MethodTrackerReturn("ORD_GetState"; $_t_oldMethodName)
