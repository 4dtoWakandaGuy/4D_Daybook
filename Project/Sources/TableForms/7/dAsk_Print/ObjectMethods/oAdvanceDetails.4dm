If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.oAdvanceDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	C_BOOLEAN:C305(DOC_bo_LetterDisplayed; DOC_bo_TemplatesDisplayed)
	C_LONGINT:C283($_l_Nul; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WIndowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WIndowRIght; $_l_WIndowTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.oAdvanceDetails"; Form event code:C388)

WS_AutoscreenSize(2; 285; 620)

FORM GOTO PAGE:C247(2)
$_l_ObjectBottom:=Gen_SetobjectPositionByname("oPrintRequirements1"; 1; 1; 260)

Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oInvisibleAcceptbutton"; 11; 1; 5)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oAcceptButton"; 11; 1; 5)

Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oAcceptButton"; "oInvbisibleCancel"; 3; 4; 10)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oAcceptButton"; "oCancelButton"; 3; 4; 10)

Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetterTemplatecode"; "oQualsCheckbox"; 8; 4; 15)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oQualsCheckbox"; "oNoSalutationCheckBox"; 1; 4; 2)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oNoSalutationCheckBox"; "oInvoiceAddressCheckbox"; 1; 4; 2)


Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oQualsCheckbox"; "oEsqCheckbox"; 2; 4; 2)
//Gen_SetobjectPositionRelativity (->$_l_Nul;->$_l_Nul;"oEsqCheckbox";"onoDearCheckBox";8;4;2)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oEsqCheckbox"; "oSeperateLetterCheckBox"; 2; 4; 2)


Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oNoSalutationCheckBox"; "onoDearCheckBox"; 2; 4; 2)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "onoDearCheckBox"; "oMergedCheckBox"; 2; 4; 2)

Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvoiceAddressCheckbox"; "ousemailsortcheckbox"; 2; 4; 2)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "ousemailsortcheckbox"; "oRecordinDiaryCheckBox"; 2; 4; 2)
If (DOC_bo_TemplatesDisplayed)
	$_l_WindowHeight:=221+(Size of array:C274(DOC_al_TemplatesInclude)*12)-25
	If ($_l_WindowHeight>Screen height:C188)
		$_l_WindowHeight:=Screen height:C188-25
	End if 
	
	WS_AutoscreenSize(2; $_l_WindowHeight; 590)
	Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oPrintRequirements1"; "oLetSelect"; 2; 8; 10; 32)
End if 

Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
If (DOC_bo_LetterDisplayed)
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WIndowRIght; $_l_WIndowBottom)
	$_l_Nul:=0
	//TRACE
	
	
	OBJECT GET COORDINATES:C663(*; "oLetSelect"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	Gen_SetobjectPositionByname("oLetSelect"; $_l_ObjectTop; 0; $_l_ObjectTop+100; ($_l_WIndowRIght-$_l_WindowLeft)-20)
	
	Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oViewTemplate"; 8; 1; 5)
	Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oLetSelect"; "oUseTemplate"; 8; 1; 5)
	
	OBJECT SET VISIBLE:C603(*; "o4DwriteArea"; True:C214)
	Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oViewTemplate"; "o4DwriteArea"; 8; 8; 5)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Print.oAdvanceDetails"; $_t_oldMethodName)
