//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Text
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; SCPT_t_TextResult; VMResultText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Text")


SCPT_t_TextResult:=""
If (Count parameters:C259=1)
	Macro($1; ""; "SCPT_t_TextResult")
Else 
	Macro($1; $2; "SCPT_t_TextResult")
End if 
$0:=SCPT_t_TextResult
ERR_MethodTrackerReturn("Macro_Result_Text"; $_t_oldMethodName)