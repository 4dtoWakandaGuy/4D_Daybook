//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_LeadZeros
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
	C_LONGINT:C283($2; $iZeros)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $tText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_LeadZeros")
//******************************************************************************
//
//Method: STR_LeadZeros
//Modified: 19990525 - RC
//******************************************************************************
//LOG_SetMethod ("STR_LeadZeros")

If (Count parameters:C259>=2)
	$tText:=$1
	$iZeros:=$2
	
	$tText:=("0"*($iZeros-Length:C16($tText)))+$tText
End if 
$0:=$tText

//LOG_ResetMethod
ERR_MethodTrackerReturn("STR_LeadZeros"; $_t_oldMethodName)