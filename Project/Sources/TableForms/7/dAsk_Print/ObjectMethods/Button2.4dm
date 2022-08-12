If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Button2
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
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; MMCurrentTemplates; MMLetterClass)
	C_REAL:C285(MMLeterClass)
	C_TEXT:C284($_t_oldMethodName; MMeMailCOde; MMLetterCOde; VLetterCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Button2"; Form event code:C388)
If (WS_at_TemplateNames>0)
	DOC_bo_TemplateSelected:=True:C214
	DOC_al_TemplatesInclude:=WS_at_TemplateNames
	WS_at_TemplateRefs:=WS_at_TemplateNames
	WS_at_TemplateNames:=WS_at_TemplateNames
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+484; $_l_WindowTop+276)
	Case of 
		: (MMCurrentTemplates=Text Email Template)
			
			Case of 
				: (MMLetterClass=Text Email Template) | (MMLetterClass=0) | (MMLetterClass=Text Email)
					//we have selected a different document
					VLetterCode:=WS_at_TemplateRefs{WS_at_TemplateNames}
					MMLetterClass:=Text Email Template  //note we never change this except from 0
					MMeMailCOde:=VLetterCode
				: (MMLetterClass=4D Write Letter) | (MMLeterClass=4D Write Letter Template)
					//we are sending an email merge
					//and we have selected a document to attach
					MMeMailCOde:=WS_at_TemplateRefs{WS_at_TemplateNames}
			End case 
		: (MMCurrentTemplates=4D Write Letter Template)
			
			Case of 
				: (MMLetterClass=Text Email Template) | (MMLetterClass=Text Email)  //we are printing a document and we have selected an email template
					MMLetterCOde:=WS_at_TemplateRefs{WS_at_TemplateNames}
				: (MMLetterClass=4D Write Letter) | (MMLetterClass=4D Write Letter Template) | (MMLetterClass=0)
					VLetterCode:=WS_at_TemplateRefs{WS_at_TemplateNames}
					MMLetterClass:=4D Write Letter Template  //note we never change this except from 0
					MMLetterCOde:=VLetterCode
			End case 
	End case 
	FORM GOTO PAGE:C247(1)
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Print,BSelectTemplate2"; $_t_oldMethodName)
