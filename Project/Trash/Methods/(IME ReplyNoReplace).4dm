//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_ReplyNoReplace
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
	C_BLOB:C604(IME_blb_Result)
	C_BOOLEAN:C305(IME_bo_ReplyBLOBAllowed)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $1; IME_t_Result)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_ReplyNoReplace")

//IME_ReplyNoReplace

$_t_Text:=$1

//$Text:=IME_Replace ($1)
//NL_AppendReply (viReqID;$1)

IME_t_Result:=IME_t_Result+$_t_Text

//a variable that allows for the use of IME_ReplyText2 etc
//without the need for the pages to actually be built
//apart from into to now still useful IME_t_Result var
If ((IME_bo_ReplyBLOBAllowed) & ($_t_Text#""))  //Rollo 9/30/99 - crashed if blank!!!!
	TEXT TO BLOB:C554($_t_Text; IME_blb_Result; Mac text without length:K22:10; *)
End if 

//vSVField3Ex:=vSVField3Ex+$1
ERR_MethodTrackerReturn("IME_ReplyNoReplace"; $_t_oldMethodName)