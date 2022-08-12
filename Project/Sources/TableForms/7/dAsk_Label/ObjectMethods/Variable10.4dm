If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Label.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName; Vt5Document)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Label.Variable10"; Form event code:C388)
$_l_OK:=0
If (Vt5Document#"")
	Gen_Confirm("Do you wish to change the selected document")
	If (OK=1)
		$_l_OK:=1
	End if 
Else 
	$_l_OK:=1
End if 
If ($_l_OK=1)
	$_ti_DocumentRef:=DB_OpenDocument(""; "")
	If ($_ti_DocumentRef#?00:00:00?)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		vT5Document:=Document
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Label,Vt5Choose"; $_t_oldMethodName)
