//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_DocNormalize
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
	C_BOOLEAN:C305($_bo_Go)
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; <>STR_s_Sep; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_DocNormalize")
//LOG_SetMethod ("IWS_DocNormalize")
// IWS_DocNormalize
// normalize the filename
// $0 -> new filename
// $1 -> old filename


// check for correct filename spelling
$0:=Replace string:C233($1; <>STR_t_CR; "")  // remove carriage returns
$0:=Replace string:C233($0; <>STR_t_LF; "")  // remove linefeeds
$0:=Replace string:C233($0; "/"; Folder separator:K24:12)  // change UNIX seperators
Repeat 
	$_bo_Go:=True:C214
	If (Position:C15(Folder separator:K24:12+Folder separator:K24:12; $0)>0)  // do we have doubled separators ?
		$_bo_Go:=False:C215  // if so, check again !
		$0:=Replace string:C233($0; Folder separator:K24:12+Folder separator:K24:12; Folder separator:K24:12)  // replace seperators
	End if 
Until ($_bo_Go)

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_DocNormalize"; $_t_oldMethodName)