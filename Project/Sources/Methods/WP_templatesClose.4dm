//%attributes = {}
If (False:C215)
	//Project Method Name:      WP_templatesClose
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(DOC_al_TemplatesInclude;0)
	//Array TEXT(WS_at_TemplateNames;0)
	//Array TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_TemplateSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WP_templatesClose"; Form event code:C388)

DOC_al_TemplatesInclude:=0
DOC_bo_TemplateSelected:=False:C215
WS_at_TemplateRefs:=0
WS_at_TemplateNames:=0

CANCEL:C270
ERR_MethodTrackerReturn("WP_templatesClose"; $_t_oldMethodName)