If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Variable32
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
	//ARRAY BOOLEAN(DIA_lb_Documents;0)
	C_BOOLEAN:C305(DOC_bo_NoChangeLetter)
	C_LONGINT:C283(Bd1; Bd4; BSelectTemplate; Bview; cLetters; cMerged; MMLetterClass; r1; WS_l_bd5; WS_l_bd6; xSearch)
	C_TEXT:C284($_t_oldMethodName; MMEmailcode; MMLetterCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Variable32"; Form event code:C388)
WS_l_bd6:=0
If (Bd4=1)
	WS_l_bd5:=1  //bcc by default
	If (Current user:C182="Designer")
		//this is so i can test a big mailing to myself
		OBJECT SET VISIBLE:C603(WS_l_bd6; True:C214)
		OBJECT SET ENABLED:C1123(WS_l_bd6; True:C214)
		OBJECT SET ENABLED:C1123(r1; True:C214)
	End if 
	OBJECT SET VISIBLE:C603(*; "oEmailTemplateLabel"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oLetterTemplateLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLetterTemplatecode"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oEmailTemplatecode"; True:C214)
	
	Bd1:=0
	OBJECT SET VISIBLE:C603(WS_l_Bd5; True:C214)
	If (MMLetterCode#"")
		cLetters:=1
		cMerged:=0
	End if 
	OBJECT SET ENABLED:C1123(cMerged; False:C215)
	If (MMLetterClass=0)
		MMLetterClass:=Text Email Template
	Else 
		If (MMLetterClass<0)
			
			OBJECT SET VISIBLE:C603(xSearch; False:C215)
			OBJECT SET VISIBLE:C603(DIA_lb_Documents; False:C215)
			OBJECT SET VISIBLE:C603(Bview; False:C215)
			OBJECT SET VISIBLE:C603(BSelectTemplate; False:C215)
			
		Else 
			OBJECT SET VISIBLE:C603(xSearch; True:C214)
			OBJECT SET VISIBLE:C603(DIA_lb_Documents; True:C214)
			OBJECT SET VISIBLE:C603(Bview; True:C214)
			OBJECT SET VISIBLE:C603(BSelectTemplate; True:C214)
			
			DOC_bo_NoChangeLetter:=True:C214
		End if 
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "oEmailTemplateLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oLetterTemplateLabel"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oLetterTemplatecode"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oEmailTemplatecode"; False:C215)
	
	WS_l_Bd5:=0
	
	If (MMLetterClass=Text Email Template)
		MMLetterClass:=0
	End if 
	MMEmailcode:=""
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Print,bd4"; $_t_oldMethodName)
