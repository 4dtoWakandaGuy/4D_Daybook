//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Real
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0; SCPT_r_NumericResult; VMResultREAL)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Real")


SCPT_r_NumericResult:=0
If (Count parameters:C259=1)
	Macro($1; ""; "SCPT_r_NumericResult")
Else 
	Macro($1; $2; "SCPT_r_NumericResult")
End if 
$0:=SCPT_r_NumericResult
ERR_MethodTrackerReturn("Macro_Result_Real"; $_t_oldMethodName)