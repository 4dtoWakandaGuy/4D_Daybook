//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macro Result
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
	C_REAL:C285($0; SCTP_r_NumericResult; vmResult)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro Result")

SCTP_r_NumericResult:=0
If (Count parameters:C259=1)
	Macro($1; ""; "SCTP_r_NumericResult")
Else 
	Macro($1; $2; "SCTP_r_NumericResult")
End if 
$0:=SCTP_r_NumericResult
ERR_MethodTrackerReturn("Macro Result"; $_t_oldMethodName)