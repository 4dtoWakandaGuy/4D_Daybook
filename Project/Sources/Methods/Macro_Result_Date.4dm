//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Date
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; SCTP_d_DateResult; VMResultDate)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Date")



SCTP_d_DateResult:=!00-00-00!

If (Count parameters:C259=1)
	Macro($1; ""; "SCTP_d_DateResult")
Else 
	Macro($1; $2; "SCTP_d_DateResult")
End if 
$0:=SCTP_d_DateResult
ERR_MethodTrackerReturn("Macro_Result_Date"; $_t_oldMethodName)