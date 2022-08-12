//%attributes = {}
If (False:C215)
	//Project Method Name:      Email_sendQuitely
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_EmailAttachPaths; 0)
	C_BOOLEAN:C305($_bo_DebugDialog; $6)
	C_LONGINT:C283(bSend)
	C_POINTER:C301($_ptr_AttachementsArray; $5)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; $_t_EmailBody; $_t_EmailFrom; $_t_EmailSentTo; $_t_EmailSubject; $_t_EmailTo; $_t_EmailToName; $_t_oldMethodName; $1; $2; $3)
	C_TEXT:C284($4; $7; EMAIL_t_SendCalledFrom; t_emailSubjectText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Email_sendQuitely")

$_t_EmailFrom:=$1
$_t_EmailTo:=$2
$_t_EmailSubject:=$3
$_t_EmailBody:=$4
//
If (Count parameters:C259>4)
	$_ptr_AttachementsArray:=$5
Else 
	$_ptr_AttachementsArray:=$_ptr_AttachementsArray
End if 
//
If (Count parameters:C259>5)
	$_bo_DebugDialog:=$6
Else 
	$_bo_DebugDialog:=True:C214
End if 
If (Count parameters:C259>6)
	$_t_EmailToName:=$7
Else 
	$_t_EmailToName:=$_t_EmailTo
End if 

ARRAY TEXT:C222($_at_EmailAttachPaths; 0)

If (Not:C34(Is nil pointer:C315($_ptr_AttachementsArray)))
	COPY ARRAY:C226($_ptr_AttachementsArray->; $_at_EmailAttachPaths)
End if 

If ($_bo_DebugDialog)
	bSend:=1
Else 
	//$iWin:=Open form window([DIARY];"Email_quickSend")
	//DIALOG([DIARY];"Email_quickSend")
	//CLOSE WINDOW($iWin)
End if 

If (bSend=1)
	$_t_EmailSentTo:="To"
	EMAIL_t_SendCalledFrom:="EMail_SendQuitely"
	Email_Send(->$_t_EmailSentTo; ->$_t_EmailToName; ->$_t_EmailTo; $_t_EmailFrom; $_t_EmailFrom; <>EMAIL_t_DefaultReplyToAddress; $_t_EmailSubject; ->$_at_EmailAttachPaths; ->$_t_EmailBody; False:C215)
End if 
ERR_MethodTrackerReturn("Email_sendQuitely"; $_t_oldMethodName)