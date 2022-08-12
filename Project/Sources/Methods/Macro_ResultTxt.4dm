//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ResultTxt
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; SCTP_t_TextResult; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_ResultTxt")

//ORD_t_Fault:=$MacroName
SCTP_t_TextResult:=""
If (Count parameters:C259=1)
	Macro($1; ""; "SCTP_t_TextResult")
Else 
	Macro($1; $2; "SCTP_t_TextResult")
End if 
$0:=SCTP_t_TextResult
//ORD_t_Fault:=(Vtext)
ERR_MethodTrackerReturn("Macro_ResultTxt"; $_t_oldMethodName)