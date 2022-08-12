If (False:C215)
	//object Name: Object Name:      PROMANAGER.oSetSelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRO_abo_DataChanged;0)
	//ARRAY BOOLEAN(PRO_lb_Production;0)
	ARRAY LONGINT:C221($_al_SelectedRows; 0)
	//ARRAY TEXT(PRO_at_AllStageCodes;0)
	//ARRAY TEXT(PRO_at_AllStageNames;0)
	//ARRAY TEXT(PRO_at_StageNames;0)
	//ARRAY TEXT(PRO_at_Stages;0)
	C_LONGINT:C283($_l_ItemIndex; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName; $_t_StageCode; $_t_StageName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oSetSelected"; Form event code:C388)
If (PRO_at_AllStageNames>0)
	ARRAY LONGINT:C221($_al_SelectedRows; 0)
	
	LB_GetSelect(->PRO_lb_Production; ->$_al_SelectedRows)
	If (Size of array:C274($_al_SelectedRows)>0)
		$_t_StageCode:=PRO_at_AllStageCodes{PRO_at_AllStageNames}
		$_t_StageName:=PRO_at_AllStageNames{PRO_at_AllStageNames}
		For ($_l_ItemIndex; 1; Size of array:C274(PRO_at_Stages))
			$_l_SelectedRow:=Find in array:C230($_al_SelectedRows; $_l_ItemIndex)
			If ($_l_SelectedRow>0)
				PRO_at_Stages{$_l_ItemIndex}:=$_t_StageCode
				PRO_at_StageNames{$_l_ItemIndex}:=$_t_StageName
				PRO_abo_DataChanged{$_l_ItemIndex}:=True:C214
			End if 
		End for 
		
		
	Else 
		Gen_Alert("Sorry you must select at least one row to use this")
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oSetSelected"; $_t_oldMethodName)
