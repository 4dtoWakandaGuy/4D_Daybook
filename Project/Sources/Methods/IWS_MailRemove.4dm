//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_MailRemove
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
	C_TEXT:C284(<>STR_t_CR; <>STR_t_LF; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_MailRemove")
// IWS_MailRemove
// remove unwanted characters from an email
// $0 -> new string
// $1 -> old string


$0:=Replace string:C233($1; <>STR_t_CR; "")
$0:=Replace string:C233($0; <>STR_t_LF; "")
ERR_MethodTrackerReturn("IWS_MailRemove"; $_t_oldMethodName)