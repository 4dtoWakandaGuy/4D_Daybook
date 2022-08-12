//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Result_Boolean
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 14:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; SCTP_bo_BooleanResult; VMResultBOOLEAN)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Result_Boolean")


SCTP_bo_BooleanResult:=False:C215
If (Count parameters:C259=1)
	Macro($1; ""; "SCTP_bo_BooleanResult")
Else 
	Macro($1; $2; "SCTP_bo_BooleanResult")
End if 
$0:=SCTP_bo_BooleanResult
ERR_MethodTrackerReturn("Macro_Result_Boolean"; $_t_oldMethodName)