//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Time
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
	C_TIME:C306($0; SCPT_ti_TimeResult; VMResultTIME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Time")


SCPT_ti_TimeResult:=?00:00:00?

If (Count parameters:C259=1)
	Macro($1; ""; "SCPT_ti_TimeResult")
Else 
	Macro($1; $2; "SCPT_ti_TimeResult")
End if 
$0:=SCPT_ti_TimeResult
ERR_MethodTrackerReturn("Macro_Result_Time"; $_t_oldMethodName)