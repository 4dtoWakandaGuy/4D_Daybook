If (False:C215)
	//object Name: [USER]Qualities_Pallette.oExpandAll
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
	C_LONGINT:C283($_l_CountListItems; $_l_ItemReference; $_l_ListIDReference; $_l_ListItemIndex; $_l_SublistID; QV_HL_QualitiesList)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.oExpandAll"; Form event code:C388)
If (Is a list:C621(QV_HL_QualitiesList))
	$_l_ListIDReference:=QV_HL_QualitiesList
	
	$_l_CountListItems:=Count list items:C380($_l_ListIDReference)
	For ($_l_ListItemIndex; $_l_CountListItems; 1; -1)
		GET LIST ITEM:C378($_l_ListIDReference; $_l_ListItemIndex; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
		If ($_l_SublistID>0)
			SET LIST ITEM:C385($_l_ListIDReference; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
		End if 
	End for 
	//////_o_REDRAW LIST(QV_HL_QUalitiesList)
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.oExpandAll"; $_t_oldMethodName)
