//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExAppCre
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_Text; vFld; vRec; vText)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExAppCre")
OK:=1
ON ERR CALL:C155("Remote_Err")
vDoc:=DB_OpenDocument($1)
If (OK=1)
	RECEIVE PACKET:C104(vDoc; vText; 8)
	If (vText="*START*…")
		vFld:=Char:C90(200)
		vRec:=Char:C90(201)
	Else 
		vFld:=Char:C90(198)
		vRec:=Char:C90(183)
	End if 
Else 
	vFld:=Char:C90(198)
	vRec:=Char:C90(183)
End if 
Close_DocUMENT(vDoc)
vDoc:=Append document:C265($1)
If (OK=1)
	$_t_Text:="Adding to"
Else 
	vDoc:=DB_CreateDocument($1)
	$_t_Text:="Creating"
End if 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("Remote ExAppCre"; $_t_oldMethodName)