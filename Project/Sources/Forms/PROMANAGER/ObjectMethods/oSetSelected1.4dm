If (False:C215)
	//object Name: Object Name:      PROMANAGER.oSetSelected1
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
	//ARRAY TEXT(PRO_at_Descriptions;0)
	//ARRAY TEXT(PRO_at_Stages;0)
	C_LONGINT:C283($_l_ItemIndex; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName; PRO_t_NewComment)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oSetSelected1"; Form event code:C388)
If (PRO_t_NewComment#"")
	ARRAY LONGINT:C221($_al_SelectedRows; 0)
	
	LB_GetSelect(->PRO_lb_Production; ->$_al_SelectedRows)
	If (Size of array:C274($_al_SelectedRows)>0)
		For ($_l_ItemIndex; 1; Size of array:C274(PRO_at_Stages))
			$_l_SelectedRow:=Find in array:C230($_al_SelectedRows; $_l_ItemIndex)
			If ($_l_SelectedRow>0)
				PRO_at_Descriptions{$_l_ItemIndex}:=PRO_t_NewComment
				PRO_abo_DataChanged{$_l_ItemIndex}:=True:C214
			End if 
		End for 
		
		
	Else 
		Gen_Alert("You must select at lest one row before you can use this function")
		
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oSetSelected1"; $_t_oldMethodName)
