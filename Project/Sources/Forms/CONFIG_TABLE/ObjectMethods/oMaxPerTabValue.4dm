If (False:C215)
	//object Method Name: Object Name:      CONFIG_TABLE.oMaxPerTabValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(TAB_ab_FieldData;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_HightlightedRecords; 0)
	//ARRAY LONGINT(TAB_AL_HighlightedSelection;0)
	//ARRAY LONGINT(TAB_al_RecordsSelection;0)
	//ARRAY POINTER(DB_aptr_ConfigPtrs;0)
	//ARRAY TEXT(TAB_at_PagingTabs;0)
	C_LONGINT:C283($_l_ArraySize; $_l_ColumnsIndex; $_l_CountTabs; $_l_Element; $_l_Event; $_l_Index; $_l_Index2; $_l_Jump; $_l_MaxPerTab; $_l_MaxRecords; $_l_Record)
	C_LONGINT:C283($_l_RecordRow; $_l_Ref; $_l_SelectedSize; $_l_SelectionIndex; $_l_Start; DB_l_DisplayTable; TAB_l_CurrentSelected; TAB_l_MaxPerTab)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_Table)
	C_REAL:C285($_r_CountTabs)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/CONFIG_TABLE/oMaxPerTabValue"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Data Change:K2:15)
		//get the highlighted of the current tab
		//$Ref:=Find in array(TAB_ab_FieldData;True)
		$_l_Ref:=0
		If ($_l_Ref>0)
			ARRAY LONGINT:C221($_al_Lines; 0)
			LB_GetSelect(->TAB_ab_FieldData; ->$_al_Lines)
			$_l_SelectedSize:=Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected})
			If ($_l_SelectedSize>0)
				DELETE FROM ARRAY:C228(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}; 1; $_l_SelectedSize)
			End if 
			//note TAB_l_CurrentSelected is the previous not the one you just selected.
			If (Size of array:C274($_al_Lines)>0)
				For ($_l_Index; 1; Size of array:C274($_al_Lines))
					$_l_Element:=$_al_Lines{$_l_Index}
					APPEND TO ARRAY:C911(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}; TAB_al_RecordsSelection{TAB_l_CurrentSelected}{$_l_Element})
				End for 
				
			End if 
		End if 
		//First Remember the highlighted records
		//
		$_ptr_Table:=Table:C252(DB_l_DisplayTable)
		
		CREATE EMPTY SET:C140($_ptr_Table->; "$Temp2")
		ARRAY LONGINT:C221($_al_HightlightedRecords; 0)
		For ($_l_Index; 1; Size of array:C274(TAB_at_PagingTabs))
			If (Size of array:C274(TAB_AL_HighlightedSelection{$_l_Index})>0)
				For ($_l_SelectionIndex; 1; Size of array:C274(TAB_AL_HighlightedSelection{$_l_Index}))
					APPEND TO ARRAY:C911($_al_HightlightedRecords; TAB_AL_HighlightedSelection{$_l_Index}{$_l_SelectionIndex})
				End for 
			End if 
			CREATE SET FROM ARRAY:C641($_ptr_Table->; TAB_al_RecordsSelection{$_l_Index}; "$TempSet")
			UNION:C120("$TempSet"; "$Temp2"; "$Temp2")
			
			
		End for 
		USE SET:C118("$Temp2")
		
		//Now rebuild the arrays using the new max per page
		ARRAY TEXT:C222(TAB_at_PagingTabs; 0)
		ARRAY LONGINT:C221(TAB_al_RecordsSelection; 0; 0)
		ARRAY LONGINT:C221(TAB_AL_HighlightedSelection; 0; 0)
		$_ptr_Table:=Table:C252(DB_l_DisplayTable)
		
		$_l_CountTabs:=Int:C8(Records in selection:C76(Table:C252(DB_l_DisplayTable)->)/TAB_l_MaxPerTab)
		$_r_CountTabs:=(Records in selection:C76(Table:C252(DB_l_DisplayTable)->)/TAB_l_MaxPerTab)
		If ($_r_CountTabs>$_l_CountTabs)
			$_l_CountTabs:=$_l_CountTabs+1
		End if 
		ARRAY TEXT:C222(TAB_at_PagingTabs; $_l_CountTabs)
		ARRAY LONGINT:C221(TAB_al_RecordsSelection; $_l_CountTabs; 0)
		ARRAY LONGINT:C221(TAB_AL_HighlightedSelection; $_l_CountTabs; 0)
		$_l_Start:=1
		$_l_MaxRecords:=Records in selection:C76($_ptr_Table->)
		
		$_l_MaxPerTab:=TAB_l_MaxPerTab
		$_l_Jump:=TAB_l_MaxPerTab-1
		For ($_l_Index; 1; Size of array:C274(TAB_at_PagingTabs))
			If (($_l_Start+$_l_Jump)>$_l_MaxRecords)
				If ($_l_Start>1)
					TAB_at_PagingTabs{$_l_Index}:=String:C10($_l_Start+1)+"-"+String:C10($_l_MaxRecords)
				Else 
					TAB_at_PagingTabs{$_l_Index}:=String:C10($_l_Start)+"-"+String:C10($_l_MaxRecords)
				End if 
				USE SET:C118("$Temp2")
				CREATE SET:C116($_ptr_Table->; "$Temp")
				If ($_l_Start>1)
					USE SET:C118("$Temp")
					REDUCE SELECTION:C351($_ptr_Table->; $_l_Start-1)
					CREATE SET:C116($_ptr_Table->; "$Temp3")
					DIFFERENCE:C122("$Temp"; "$Temp3"; "$Temp")
					USE SET:C118("$Temp")
				End if 
				LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; TAB_al_RecordsSelection{$_l_Index})
			Else 
				If ($_l_Start>1)
					TAB_at_PagingTabs{$_l_Index}:=String:C10($_l_Start)+"-"+String:C10($_l_Start+$_l_Jump)
				Else 
					TAB_at_PagingTabs{$_l_Index}:=String:C10($_l_Start)+"-"+String:C10($_l_Start+$_l_Jump)
				End if 
				USE SET:C118("$Temp2")
				REDUCE SELECTION:C351($_ptr_Table->; $_l_Start+$_l_Jump)
				CREATE SET:C116($_ptr_Table->; "$Temp")
				If ($_l_Start>1)
					USE SET:C118("$Temp")
					REDUCE SELECTION:C351($_ptr_Table->; $_l_Start-1)
					CREATE SET:C116($_ptr_Table->; "$Temp3")
					DIFFERENCE:C122("$Temp"; "$Temp3"; "$Temp")
					
					USE SET:C118("$Temp")
				End if 
				LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; TAB_al_RecordsSelection{$_l_Index})
			End if 
			$_l_Start:=$_l_Start+$_l_Jump+1
		End for 
		TAB_l_CurrentSelected:=1
		//NOW PUT THE HIGHLIGHTS BACK
		ARRAY TEXT:C222(TAB_at_PagingTabs; $_l_CountTabs)
		
		ARRAY LONGINT:C221(TAB_AL_HighlightedSelection; $_l_CountTabs; 0)
		
		For ($_l_Index; 1; Size of array:C274(TAB_at_PagingTabs))
			If (Size of array:C274($_al_HightlightedRecords)>0)
				For ($_l_Index2; Size of array:C274($_al_HightlightedRecords); 1; -1)
					$_l_RecordRow:=Find in array:C230(TAB_al_RecordsSelection{$_l_Index}; $_al_HightlightedRecords{$_l_Index2})
					If ($_l_RecordRow>0)
						APPEND TO ARRAY:C911(TAB_AL_HighlightedSelection{$_l_Index}; $_al_HightlightedRecords{$_l_Index2})
						DELETE FROM ARRAY:C228($_al_HightlightedRecords; $_l_Index2; 1)
					End if 
				End for 
			Else 
				$_l_Index:=Size of array:C274(TAB_at_PagingTabs)
			End if 
		End for 
		//now reload the array
		TAB_at_PagingTabs:=1
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
				$_l_SelectedSize:=Size of array:C274(($_ptr_ArrayofArrayPointers->{$_l_ColumnsIndex})->)
				DELETE FROM ARRAY:C228(($_ptr_ArrayofArrayPointers->{$_l_ColumnsIndex})->; 1; $_l_SelectedSize)
			End if 
		End for 
		LBi_LoadArrays(DB_aptr_ConfigPtrs{2}; DB_aptr_ConfigPtrs{3}; True:C214; $_ptr_Table)
		//LBi_LoadFmul (»DB_aptr_ConfigPtrs)
		ARRAY LONGINT:C221($_al_Lines; 0)
		LB_SetSelect(->TAB_ab_FieldData; ->$_al_Lines)
		If (Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected})>0)
			For ($_l_Index; 1; Size of array:C274(TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}))
				$_l_Record:=TAB_AL_HighlightedSelection{TAB_l_CurrentSelected}{$_l_Index}
				$_l_RecordRow:=Find in array:C230(TAB_al_RecordsSelection{TAB_l_CurrentSelected}; $_l_Record)
				If ($_l_RecordRow>0)  //it should be
					APPEND TO ARRAY:C911($_al_Lines; $_l_RecordRow)
				End if 
				
			End for 
			If (Size of array:C274($_al_Lines)>0)
			End if 
			LB_SetSelect(->TAB_ab_FieldData; ->$_al_Lines)
		End if 
		
		
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_TABLE.oMaxPerTabValue"; $_t_oldMethodName)
