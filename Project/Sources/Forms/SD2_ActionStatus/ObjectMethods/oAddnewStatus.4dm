If (False:C215)
	//object Name: Object Name:      SD2_ActionStatus.oAddnewStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_StatusApplied;0)
	//ARRAY BOOLEAN(SD2_lb_StatusSettings;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY TEXT(SD2_at_WorkflowStatus;0)
	C_BOOLEAN:C305(SD2_ab_EditedSettings)
	C_LONGINT:C283($_l_ListitemID; $_l_SizeofArray; SD2_l_ActionStatusList)
	C_TEXT:C284($_t_oldMethodName; $_t_Status)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_ActionStatus.oAddnewStatus"; Form event code:C388)
$_t_Status:=Gen_Request("Name of new status"; "")
If ($_t_Status#"")
	//SD2_l_ActionStatusList is set in the form load method
	
	$_l_ListitemID:=AA_ListAddItembyID(SD2_l_ActionStatusList; $_t_Status)
	SD2_l_ActionStatusList:=AA_LoadListByName("Action Status"; ->SD2_at_WorkflowStatus; ->SD2_al_WorkflowStatus)
	$_l_SizeofArray:=Size of array:C274(SD2_abo_StatusApplied)
	
	LISTBOX INSERT ROWS:C913(SD2_lb_StatusSettings; $_l_SizeofArray+1)
	SD2_al_WorkflowStatus{$_l_SizeofArray+1}:=$_l_ListitemID
	SD2_abo_StatusApplied{$_l_SizeofArray+1}:=True:C214
	SD2_at_WorkflowStatus{$_l_SizeofArray+1}:=$_t_Status
	SD2_ab_EditedSettings:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ SD2_ActionStatus.oAddnewStatus"; $_t_oldMethodName)
