If (False:C215)
	//object Method Name: Object Name:      [USER].File_StatesManager.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 10:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY LONGINT(ST_al_2DStateOrders;0)
	//ARRAY LONGINT(ST_al_2DStatePositions;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY LONGINT(ST_al_PipelineStates;0)
	//ARRAY LONGINT(STATE_al_ClassIDs;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(ST_at_2DStateRefs;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_ClassNames;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_BOOLEAN:C305($_bo_DragExpanded; $_bo_DropExpanded; $_bo_Expanded)
	C_LONGINT:C283($_l_ClassRow; $_l_DragdItemParent; $_l_DragitemPos; $_l_DragitemRef; $_l_DragParentPosition; $_l_DragSublistiD; $_l_DropdItemParent; $_l_DropItemPosition; $_l_DropItemRef; $_l_DropSublistiD; $_l_event)
	C_LONGINT:C283($_l_ParentElementRow; $_l_SelectedItemParent; $_l_SelectedItemRef; $_l_SelectedListItem2; $_l_SourceObjectField; $_l_SourceObjectProcess; $_l_SourceObjectTable; $_l_StatesRow; $_l_SublistiD; ST_HL_Tables; ST_l_SourceObjectElement)
	C_LONGINT:C283(ST_l_StateClass; ST_l_StateRef; State_l_PipelineStatus; STATE_l_RelateTableID)
	C_POINTER:C301(ST_Ptr_SourceObject)
	C_TEXT:C284($_t_DragItemText; $_t_DropItemText; $_t_oldMethodName; $_t_SelectedItemText; $_t_StateRefCode; ST_srcObjectName; State_t_AbbrevEntryName; STATE_t_ClassName; STATE_t_Code; State_t_EntryName; State_t_ListName)
	C_TEXT:C284(State_t_PipeLineStatus; STATE_t_SelectedStateRef; State_t_TableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Variable12"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Drag Over:K2:13)
		
		_O_DRAG AND DROP PROPERTIES:C607(ST_Ptr_SourceObject; ST_l_SourceObjectElement; $_l_SourceObjectProcess)
		
	: ($_l_event=On Drop:K2:12)
		
		$_l_DropItemPosition:=Drop position:C608
		RESOLVE POINTER:C394(ST_Ptr_SourceObject; ST_srcObjectName; $_l_SourceObjectTable; $_l_SourceObjectField)
		$_l_DragitemPos:=ST_l_SourceObjectElement
		If (ST_srcObjectName="ST_HL_Tables")
			GET LIST ITEM:C378(ST_HL_Tables; $_l_DragitemPos; $_l_DragitemRef; $_t_DragItemText; $_l_DragSublistiD; $_bo_DragExpanded)
			$_l_DragdItemParent:=List item parent:C633(ST_HL_Tables; $_l_DragitemRef)
			GET LIST ITEM:C378(ST_HL_Tables; $_l_DropItemPosition; $_l_DropItemRef; $_t_DropItemText; $_l_DropSublistiD; $_bo_DropExpanded)
			$_l_DropdItemParent:=List item parent:C633(ST_HL_Tables; $_l_DropItemRef)
			If ($_l_DropdItemParent=$_l_DragdItemParent)
				
				DELETE FROM LIST:C624(ST_HL_Tables; $_l_DragitemRef)
				INSERT IN LIST:C625(ST_HL_Tables; $_l_DropItemRef; $_t_DragItemText; $_l_DragitemRef; $_l_DragSublistiD; $_bo_DragExpanded)
				SELECT LIST ITEMS BY POSITION:C381(ST_HL_Tables; $_l_DropItemPosition)
				//////_o_REDRAW LIST(ST_HL_Tables)
				$_l_DragParentPosition:=Find in array:C230(STATE_al_RelatedTables; $_l_DragdItemParent)
				If ($_l_DragParentPosition>0)
					//ST_at_2DStateCodes{$ref}{0}:="MOD"
					ST_al_2DStateOrders{$_l_DragParentPosition}{0}:=-1
				End if 
				
			End if 
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		
		//first Save any existing
		$_l_SelectedListItem2:=Selected list items:C379(ST_HL_Tables)
		ST_SaveState(ST_l_StateRef)
		If ($_l_SelectedListItem2>0)
			GET LIST ITEM:C378(ST_HL_Tables; $_l_SelectedListItem2; $_l_SelectedItemRef; $_t_SelectedItemText; $_l_SublistiD; $_bo_Expanded)
			If ($_l_SublistiD=0)  //it should be unless its a parent item
				$_l_SelectedItemParent:=List item parent:C633(ST_HL_Tables; $_l_SelectedItemRef)
				If ($_l_SelectedItemParent>0)
					$_l_ParentElementRow:=Find in array:C230(STATE_al_RelatedTables; $_l_SelectedItemParent)
					ST_l_StateRef:=Find in array:C230(ST_al_2DStatePositions{$_l_ParentElementRow}; $_l_SelectedItemRef)
					//$sub:=($_l_SelectedItemRef-256)-$_l_SelectedItemParent
					$_t_StateRefCode:=ST_at_2DStateRefs{$_l_ParentElementRow}{ST_l_StateRef}
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$_t_StateRefCode)
					STATE_t_SelectedStateRef:=$_t_StateRefCode
					
					STATE_t_Code:=[TABLE_RECORD_STATES:90]State_Code:1
					State_t_ListName:=[TABLE_RECORD_STATES:90]Listing_Name:2
					State_t_EntryName:=[TABLE_RECORD_STATES:90]Entry_Name:5
					State_t_AbbrevEntryName:=[TABLE_RECORD_STATES:90]Abbreviated_Name:6
					STATE_l_RelateTableID:=[TABLE_RECORD_STATES:90]Table_number:3
					ST_l_StateClass:=[TABLE_RECORD_STATES:90]xStateClass:8
					$_l_ClassRow:=Find in array:C230(STATE_al_ClassIDs; ST_l_StateClass)
					If ($_l_ClassRow>0)
						STATE_t_ClassName:=STATE_at_ClassNames{$_l_ClassRow}
					Else 
						STATE_t_ClassName:=""
					End if 
					If ([TABLE_RECORD_STATES:90]Table_number:3>0)
						If (Is table number valid:C999([TABLE_RECORD_STATES:90]Table_number:3))
							State_t_TableName:=Table name:C256([TABLE_RECORD_STATES:90]Table_number:3)
						Else 
							State_t_TableName:="Deleted"+String:C10([TABLE_RECORD_STATES:90]Table_number:3)
						End if 
					Else 
						State_t_TableName:=""
					End if 
					State_l_PipelineStatus:=[TABLE_RECORD_STATES:90]xPipeStateID:7
					State_t_PipeLineStatus:=""
					If ([TABLE_RECORD_STATES:90]xPipeStateID:7>0)
						$_l_StatesRow:=Find in array:C230(ST_al_PipelineStates; [TABLE_RECORD_STATES:90]xPipeStateID:7)
						If ($_l_StatesRow>0)
							State_t_PipeLineStatus:=ST_at_PipelineState{Find in array:C230(ST_al_PipelineStates; [TABLE_RECORD_STATES:90]xPipeStateID:7)}
						Else 
							[TABLE_RECORD_STATES:90]xPipeStateID:7:=0
						End if 
					End if 
					ST_LoadFunctions(STATE_t_SelectedStateRef; ->ST_al_CodeUsed; ->ST_abo_CodeUsed)
					OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; False:C215)
					OBJECT SET VISIBLE:C603(ST_at_PipelineState; True:C214)
					
					OBJECT SET ENTERABLE:C238(State_t_ListName; True:C214)
					OBJECT SET ENTERABLE:C238(State_t_EntryName; True:C214)
					OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; True:C214)
					If ([TABLE_RECORD_STATES:90]Table_number:3=Table:C252(->[PURCHASE_ORDERS:57])) | ([TABLE_RECORD_STATES:90]Table_number:3=Table:C252(->[SERVICE_CALLS:20]))
						OBJECT SET VISIBLE:C603(*; "oFunctions@"; False:C215)
						//OBJECT SET VISIBLE(ST_al_CodeUsed;False)
						//OBJECT SET VISIBLE(ST_at_CodeUseName;False)
					Else 
						OBJECT SET VISIBLE:C603(*; "oFunctions@"; True:C214)
						//OBJECT SET VISIBLE(ST_al_CodeUsed;True)
						//OBJECT SET VISIBLE(ST_at_CodeUseName;True)
					End if 
					
					
				End if 
				
			Else 
				//parent item selected
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Variable12"; $_t_oldMethodName)
