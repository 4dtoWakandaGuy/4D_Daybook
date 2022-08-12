If (False:C215)
	//object Name: [USER]Template_manager.Button3
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
	C_BOOLEAN:C305(DOC_bo_TemplateSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Template_manager.Button3"; Form event code:C388)

DOC_al_TemplatesInclude:=0
DOC_bo_TemplateSelected:=False:C215
WS_at_TemplateRefs:=0
WS_at_TemplateNames:=0
//ALERT("Item is selected"+String(Num(DOC_bo_TemplateSelected))+"item number selected"

CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].Template_manager.Button3"; $_t_oldMethodName)