If (False:C215)
	//object Name: [USER]Template_manager.Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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
	C_BOOLEAN:C305(DOC_bo_AutoPrint; DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_SelectedTemplate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Template_manager.Button4"; Form event code:C388)
$_l_SelectedTemplate:=Find in array:C230(DOC_al_TemplatesInclude; 1)
If ($_l_SelectedTemplate>0)
	DOC_al_TemplatesInclude:=$_l_SelectedTemplate
	DOC_bo_TemplateSelected:=True:C214
	WS_at_TemplateRefs:=$_l_SelectedTemplate
	WS_at_TemplateNames:=$_l_SelectedTemplate
	DOC_bo_AutoPrint:=False:C215
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].Template_manager.Button4"; $_t_oldMethodName)
