If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.oUseTemplate
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
	C_BOOLEAN:C305(DOC_bo_LetterDisplayed; DOC_bo_TemplatesDisplayed; DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_nul; $_l_ObjectBottomNew; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; cLetters; cMerged; MMCurrentTemplates; MMLetterClass)
	C_TEXT:C284($_t_oldMethodName; MMeMailCOde; MMLetterCOde; VLetterCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.oUseTemplate"; Form event code:C388)
If (WS_at_TemplateNames>0)
	DOC_bo_TemplateSelected:=True:C214
	DOC_al_TemplatesInclude:=WS_at_TemplateNames
	WS_at_TemplateRefs:=WS_at_TemplateNames
	WS_at_TemplateNames:=WS_at_TemplateNames
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	If (FORM Get current page:C276=1)
		WS_AutoscreenSize(2; 152; 560)
	Else 
		WS_AutoscreenSize(2; 285; 620)
		
		FORM GOTO PAGE:C247(2)
		$_l_ObjectBottomNew:=Gen_SetobjectPositionByname("oPrintRequirements1"; 1; 1; 260)
		$_l_nul:=0
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oPrintRequirements1"; "oInvisibleAcceptbutton"; 11; 1; 5)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oPrintRequirements1"; "oAcceptButton"; 11; 1; 5)
		
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oAcceptButton"; "oInvbisibleCancel"; 3; 4; 10)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oAcceptButton"; "oCancelButton"; 3; 4; 10)
		
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oLetterTemplatecode"; "oQualsCheckbox"; 8; 4; 15)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oQualsCheckbox"; "oNoSalutationCheckBox"; 1; 4; 2)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oNoSalutationCheckBox"; "oInvoiceAddressCheckbox"; 1; 4; 2)
		
		
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oQualsCheckbox"; "oEsqCheckbox"; 2; 4; 2)
		//Gen_SetobjectPositionRelativity (->$_l_nul;->$_l_nul;"oEsqCheckbox";"onoDearCheckBox";8;4;2)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oEsqCheckbox"; "oSeperateLetterCheckBox"; 2; 4; 2)
		
		
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oNoSalutationCheckBox"; "onoDearCheckBox"; 2; 4; 2)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "onoDearCheckBox"; "oMergedCheckBox"; 2; 4; 2)
		
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "oInvoiceAddressCheckbox"; "ousemailsortcheckbox"; 2; 4; 2)
		Gen_SetobjectPositionRelativity(->$_l_nul; ->$_l_nul; "ousemailsortcheckbox"; "oRecordinDiaryCheckBox"; 2; 4; 2)
		
	End if 
	OBJECT SET VISIBLE:C603(*; "oLetSelect"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oViewTemplate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oUseTemplate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oUseTemplate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OEMAILTEXT"; False:C215)
	OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; False:C215)
	
	
	Case of 
		: (MMCurrentTemplates=Text Email Template)
			Case of 
				: (MMLetterClass=Text Email Template) | (MMLetterClass=0) | (MMLetterClass=Text Email)
					//we have selected a different document
					VLetterCode:=WS_at_TemplateRefs{WS_at_TemplateNames}
					MMLetterClass:=Text Email Template  //note we never change this except from 0
					MMeMailCOde:=VLetterCode
				: (MMLetterClass=4D Write Letter) | (MMLetterClass=4D Write Letter Template)
					//we are sending an email merge
					//and we have selected a document to attach
					MMeMailCOde:=WS_at_TemplateRefs{WS_at_TemplateNames}
					cMerged:=0
					cLetters:=1
					
			End case 
			
		: (MMCurrentTemplates=4D Write Letter Template)
			Case of 
				: (MMLetterClass=Text Email Template) | (MMLetterClass=Text Email)  //we are printing a document and we have selected an email template
					MMLetterCOde:=WS_at_TemplateRefs{WS_at_TemplateNames}
				: (MMLetterClass=4D Write Letter) | (MMLetterClass=4D Write Letter Template) | (MMLetterClass=0)
					VLetterCode:=WS_at_TemplateRefs{WS_at_TemplateNames}
					MMLetterClass:=4D Write Letter Template  //note we never change this except from 0
					MMLetterCOde:=VLetterCode
					If (cMerged=0)
						cLetters:=1
					End if 
			End case 
	End case 
	
End if 
DOC_bo_TemplatesDisplayed:=False:C215
DOC_bo_LetterDisplayed:=False:C215
ERR_MethodTrackerReturn("OBJ:dAsk_Print,BSelectTemplate"; $_t_oldMethodName)
