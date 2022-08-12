If (False:C215)
	//object Name: [COMPANIES]dRequest_SMSText.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282(<>iSMS_MaxMessageLength)
	C_TEXT:C284($_t_EditedText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest_SMSText.Variable2"; Form event code:C388)
If (Form event code:C388=On After Keystroke:K2:26)  // 09/05/02 pb
	//   If (Last object=->vT)
	$_t_EditedText:=Get edited text:C655
	MSG_t_CharsRemain:="Characters remaining: "+String:C10(<>iSMS_MaxMessageLength-Length:C16($_t_EditedText))+"."
	Case of 
		: (Length:C16($_t_EditedText)>=<>iSMS_MaxMessageLength)
			BEEP:C151
			vT:=Substring:C12($_t_EditedText; 1; <>iSMS_MaxMessageLength)
			MSG_t_CharsRemain:="Characters remaining: "+String:C10(<>iSMS_MaxMessageLength-Length:C16(vT))+"."
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest_SMSText.Variable2"; $_t_oldMethodName)
