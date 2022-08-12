//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Reset Attachment Var
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1; Email_GotAttachment)
	C_LONGINT:C283(<>DOC_ServerComm)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reset Attachment Var")


//NG August 2008..removing the call to this pointless method

$_t_oldMethodName:=ERR_MethodTracker("Reset Attachment Var")
Email_GotAttachment:=$1
<>DOC_ServerComm:=0
ERR_MethodTrackerReturn("Reset Attachment Var"; $_t_oldMethodName)