If (False:C215)
	//object Name: [USER]QV_Groupings.Variable1
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
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_CountListItems; $_l_ItemReference; $_l_ListItemIndex; $_l_parentitemRef; $_l_SublistID; QV_HL_QualitiesList)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_ParentitemText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable1"; Form event code:C388)
If (Is a list:C621(QV_HL_QualitiesList))
	$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
	For ($_l_ListItemIndex; $_l_CountListItems; 1; -1)
		GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_ListItemIndex; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		If ($_l_SublistID>0)
			SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
		End if 
	End for 
	//////_o_REDRAW LIST(QV_HL_QualitiesList)
End if 
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable1"; $_t_oldMethodName)
