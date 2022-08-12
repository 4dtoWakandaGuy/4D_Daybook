If (False:C215)
	//object Name: Object Name:      ACC_SetupImportoptions.oRBAllRemplates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2013 12:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_ab_TemplateSelected;0)
	//ARRAY TEXT(ACC_at_On_ScreenTemplates;0)
	//ARRAY TEXT(ACC_at_TemplateNames;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_TemplateName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_SetupImportoptions.oRBAllRemplates"; Form event code:C388)

ARRAY TEXT:C222(ACC_at_On_ScreenTemplates; 0)
For ($_l_Index; 1; Size of array:C274(ACC_at_TemplateNames))
	$_t_TemplateName:=ACC_at_TemplateNames{$_l_Index}
	If ($_t_TemplateName="ACCOUNTS") | ($_t_TemplateName="HEADINGS")
		$_t_TemplateName:="DEFAULTS"
	End if 
	
	If (Find in array:C230(ACC_at_On_ScreenTemplates; $_t_TemplateName)<0)
		APPEND TO ARRAY:C911(ACC_at_On_ScreenTemplates; $_t_TemplateName)
	End if 
	
End for 
ARRAY BOOLEAN:C223(ACC_ab_TemplateSelected; 0)
ARRAY BOOLEAN:C223(ACC_ab_TemplateSelected; Size of array:C274(ACC_at_On_ScreenTemplates))
ERR_MethodTrackerReturn("OBJ ACC_SetupImportoptions.oRBAllRemplates"; $_t_oldMethodName)
