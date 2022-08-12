If (False:C215)
	//object Method Name: Object Name:      ACC_SetupImportoptions.oACCTemplatesChoice
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
	//ARRAY BOOLEAN(ACC_lb_ChartTemplates;0)
	C_BOOLEAN:C305(ACC_CB_ImportTab; ACC_CB_ImportXLS)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Index; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_SetupImportoptions.oACCTemplatesChoice"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(ACC_lb_ChartTemplates; $_l_Column; $_l_Row)
		If ($_l_Column=2)
			For ($_l_Index; 1; Size of array:C274(ACC_ab_TemplateSelected))
				If (ACC_ab_TemplateSelected{$_l_Index}) & ($_l_Row#$_l_Index)
					ACC_ab_TemplateSelected{$_l_Index}:=False:C215
				End if 
			End for 
			ACC_CB_ImportTab:=False:C215
			ACC_CB_ImportXLS:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_SetupImportoptions.oACCTemplatesChoice"; $_t_oldMethodName)
