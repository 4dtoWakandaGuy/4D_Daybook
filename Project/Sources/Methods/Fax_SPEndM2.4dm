//%attributes = {}
If (False:C215)
	//Project Method Name:      Fax_SPEndM2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FaxPicker; <>FaxSingle)
	C_LONGINT:C283(FAX_Return)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_l_DocumentName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPEndM2")
//Fax_SPEndM2 see alsp Fax_SPEnd

$_l_DocumentName:=Substring:C12(Replace string:C233(Time string:C180(Current time:C178); ":"; "/")+$1+<>PER_t_CurrentUserInitials; 1; 31)

PLUGCALL_FAX("EndMessage"; 2; $_l_DocumentName; -><>FaxSingle; -><>FaxPicker; ->FAX_Return)
//If ($e#0)
//Gen_Alert ("4-Sight Fax Error: the fax to "+$1+" could not be sent")
//End if
ERR_MethodTrackerReturn("Fax_SPEndM2"; $_t_oldMethodName)