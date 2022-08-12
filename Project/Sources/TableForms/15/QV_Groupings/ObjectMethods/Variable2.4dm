If (False:C215)
	//object Name: [USER]QV_Groupings.Variable2
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
	C_BOOLEAN:C305($_bo_Expanded; QV_bo_Drop)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_ItemReference; $_l_Length; $_l_ParentItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SublistID; $_l_TableNumber; $i; QV_HL_QualitiesList)
	C_LONGINT:C283(QV_l_SourceElement; QV_l_SourceProcess)
	C_POINTER:C301(QV_Ptr_SourceObject)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_ParentItemText; $_t_VariableName; QV_T_QualitiesAsText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Drag Over:K2:13)
		QV_bo_Drop:=False:C215
		_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
		RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName="QV_HL_QualitiesList")
			QV_bo_Drop:=True:C214
			
		End if 
	: ($_l_event=On Drop:K2:12)
		If (QV_bo_Drop)
			_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
			RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			GET LIST ITEM:C378(QV_HL_QualitiesList; QV_l_SourceElement; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
			$_l_SelectedItemParent:=List item parent:C633(QV_HL_QualitiesList; $_l_ItemReference)
			$_l_Length:=Length:C16(QV_T_QualitiesAsText)
			
			If ($_l_SelectedItemParent>0)
				//this is a sublist item
				
				
				SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_SelectedItemParent)
				$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
				GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ParentItemReference; $_t_ParentItemText; $_l_SublistID; $_bo_Expanded)
				If ($_l_Length=0)
					QV_T_QualitiesAsText:="["+$_t_ParentItemText+"]"+$_t_ItemText
				Else 
					If (QV_T_QualitiesAsText[[Length:C16(QV_T_QualitiesAsText)]]=",")
						QV_T_QualitiesAsText:=QV_T_QualitiesAsText+" ["+$_t_ParentItemText+"]"+$_t_ItemText
					Else 
						QV_T_QualitiesAsText:=QV_T_QualitiesAsText+", ["+$_t_ParentItemText+"]"+$_t_ItemText
					End if 
				End if 
				SELECT LIST ITEMS BY REFERENCE:C630(QV_HL_QualitiesList; $_l_ItemReference)  //added 30/08/06 -kmw (re-select user selected item as opposed to its group)
				//////_o_REDRAW LIST(QV_HL_QualitiesList)  //added 30/08/06 - kmw (fixes display problems with items incorrectly being displayed as different items until they get clicked on)
			Else 
				//this is a group
				If ($_l_Length=0)
					QV_T_QualitiesAsText:="["+$_t_ItemText+"]"
				Else 
					If (QV_T_QualitiesAsText[[Length:C16(QV_T_QualitiesAsText)]]=",")
						QV_T_QualitiesAsText:=QV_T_QualitiesAsText+" "+$_t_ItemText
					Else 
						QV_T_QualitiesAsText:=QV_T_QualitiesAsText+", ["+$_t_ItemText+"]"
					End if 
				End if 
			End if 
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable2"; $_t_oldMethodName)
