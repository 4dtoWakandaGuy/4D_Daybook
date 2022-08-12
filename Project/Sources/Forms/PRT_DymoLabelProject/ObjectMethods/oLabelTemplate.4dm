If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oLabelTemplate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 15:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRT_at_LabelTemplate;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRT_t_LabelTemplate)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oLabelTemplate"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PRT_at_LabelTemplate>0)
			PRT_t_LabelTemplate:=PRT_at_LabelTemplate{PRT_at_LabelTemplate}
		End if 
End case 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oLabelTemplate"; $_t_oldMethodName)
