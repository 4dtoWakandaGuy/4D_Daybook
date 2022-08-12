//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Long
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; SCTP_l_LongintResult; VMResultLongint)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Long")


SCTP_l_LongintResult:=0
If (Count parameters:C259=1)
	Macro($1; ""; "SCTP_l_LongintResult")
Else 
	Macro($1; $2; "SCTP_l_LongintResult")
End if 
$0:=SCTP_l_LongintResult
ERR_MethodTrackerReturn("Macro_Result_Long"; $_t_oldMethodName)