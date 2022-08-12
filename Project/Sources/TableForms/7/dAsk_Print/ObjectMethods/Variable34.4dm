If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Variable34
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
	C_TEXT:C284($_t_oldMethodName; $From; $FromBef; vFrom; vFromPos)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Variable34"; Form event code:C388)
If (vFrom="!@")
	vFrom:=Substring:C12(vFrom; 2; 256)
Else 
	$FromBef:=vFrom
	$From:=vFrom+"@"
	MESSAGES OFF:C175
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$From; *)
	QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=$From)
	MESSAGES ON:C181
	If (Records in selection:C76([PERSONNEL:11])>0)
		Check_MinorNC(->vFrom; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
		If ((OK=1) & ([PERSONNEL:11]Name:2#""))
			vFrom:=[PERSONNEL:11]Name:2
			vFromPos:=[PERSONNEL:11]Job_Title:35
		Else 
			vFrom:=$FromBef
			vFrom:=Uppers2(vFrom)
		End if 
	Else 
		vFrom:=Uppers2(vFrom)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Print.Variable34"; $_t_oldMethodName)
