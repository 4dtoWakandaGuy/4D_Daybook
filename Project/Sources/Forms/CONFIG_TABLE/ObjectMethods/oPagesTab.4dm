If (False:C215)
	//object Method Name: Object Name:      CONFIG_TABLE.oPagesTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 15:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(TAB_ab_FieldData;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY LONGINT(TAB_AL_HighlightedSelection;0)
	//ARRAY LONGINT(TAB_al_RecordsSelection;0)
	//ARRAY POINTER(DB_aptr_ConfigPtrs;0)
	//ARRAY TEXT(TAB_at_PagingTabs;0)
	C_LONGINT:C283($_l_ArraySize; $_l_ColumnsIndex; $_l_Element; $_l_Event; $_l_Index; $_l_LineIndex; $_l_LineRow; $_l_Record; $_l_Ref; DB_l_DisplayTable; TAB_l_CurrentSelected)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/CONFIG_TABLE/oPagesTab"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (TAB_l_CurrentSelected#TAB_at_PagingTabs)
			//$_l_Ref:=Find in array(TAB_ab_FieldData;True)
			$_l_Ref:=0
			If ($_l_Ref>0)
				ARRAY LONGINT:C221($_al_Lines; 0)
				LB_GetSelect(->TAB_ab_FieldData; ->$_al_Lines)
				$_l_ArraySize:=Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected})
				If ($_l_ArraySize>0)
					DELETE FROM ARRAY:C228(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}; 1; $_l_ArraySize)
				End if 
				//note TAB_l_CurrentSelected is the previous not the one you just selected.
				If (Size of array:C274($_al_Lines)>0)
					For ($_l_LineIndex; 1; Size of array:C274($_al_Lines))
						$_l_Element:=$_al_Lines{$_l_LineIndex}
						APPEND TO ARRAY:C911(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}; TAB_al_RecordsSelection{TAB_l_CurrentSelected}{$_l_Element})
					End for 
					
				End if 
			End if 
			TAB_l_CurrentSelected:=TAB_at_PagingTabs
			$_ptr_Table:=Table:C252(DB_l_DisplayTable)
			CREATE SET FROM ARRAY:C641($_ptr_Table->; TAB_al_RecordsSelection{TAB_l_CurrentSelected}; "TempSet")
			
			
			USE SET:C118("TempSet")
			//TRACE
			$_ptr_ArrayFieldPointers:=DB_aptr_ConfigPtrs{2}
			$_l_ArraySize:=Size of array:C274($_ptr_ArrayFieldPointers->)
			$_ptr_ArrayofArrayPointers:=DB_aptr_ConfigPtrs{3}
			For ($_l_ColumnsIndex; 1; $_l_ArraySize)
				If (Size of array:C274(($_ptr_ArrayofArrayPointers->{$_l_ColumnsIndex})->)>0)
					$_l_ArraySize:=Size of array:C274(($_ptr_ArrayofArrayPointers->{$_l_ColumnsIndex})->)
					DELETE FROM ARRAY:C228(($_ptr_ArrayofArrayPointers->{$_l_ColumnsIndex})->; 1; $_l_ArraySize)
				End if 
			End for 
			LBi_LoadArrays(DB_aptr_ConfigPtrs{2}; DB_aptr_ConfigPtrs{3}; True:C214; $_ptr_Table)
			//LBi_LoadFmul (»DB_aptr_ConfigPtrs)
			ARRAY LONGINT:C221($_al_Lines; 0)
			LB_SetSelect(->TAB_ab_FieldData; ->$_al_Lines)
			If (Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected})>0)
				For ($_l_Index; 1; Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}))
					$_l_Record:=TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}{$_l_Index}
					$_l_LineRow:=Find in array:C230(TAB_al_RecordsSelection{TAB_l_CurrentSelected}; $_l_Record)
					If ($_l_LineRow>0)  //it should be
						APPEND TO ARRAY:C911($_al_Lines; $_l_LineRow)
					End if 
					
				End for 
				If (Size of array:C274($_al_Lines)>0)
				End if 
				LB_SetSelect(->TAB_ab_FieldData; ->$_al_Lines)
			End if 
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_TABLE.oPagesTab"; $_t_oldMethodName)
