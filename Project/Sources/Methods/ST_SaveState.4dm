//%attributes = {}
If (False:C215)
	//Project Method Name:      ST_SaveState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ST_al_2DStateClasses;0)
	//ARRAY LONGINT(ST_al_2DStateOrders;0)
	//ARRAY LONGINT(ST_al_2DStatePositions;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(ST_at_2DStateCodes;0)
	//ARRAY TEXT(ST_at_2DStateNames;0)
	//ARRAY TEXT(ST_at_2DStateRefs;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_ItemParentReference; $_l_ParentListPosition; $_l_ParentRow; $_l_SublistID; ST_HL_Tables; ST_l_AnyMods; ST_l_Modified; ST_l_StateClass; ST_l_StateRef; State_l_PipelineStatus; STATE_l_RelateTableID)
	C_REAL:C285($1)
	C_TEXT:C284($_t_ItemParentName; $_t_oldMethodName; State_t_AbbrevEntryName; STATE_t_Code; State_t_EntryName; State_t_ListName; State_t_PipeLineStatus; STATE_t_SelectedStateRef; State_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ST_SaveState")
//this method will save a file state from within the file states manager
If ($1#0)
	If (ST_l_Modified=1)
		ST_l_AnyMods:=ST_l_AnyMods+1
		// the record is modified
		If (STATE_l_RelateTableID>0)
			READ WRITE:C146([TABLE_RECORD_STATES:90])
			If (STATE_t_SelectedStateRef#"")
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=STATE_t_SelectedStateRef)
			Else 
				CREATE RECORD:C68([TABLE_RECORD_STATES:90])
				[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10(STATE_l_RelateTableID))))+String:C10(STATE_l_RelateTableID)+STATE_t_Code
			End if 
			[TABLE_RECORD_STATES:90]State_Code:1:=STATE_t_Code
			[TABLE_RECORD_STATES:90]Listing_Name:2:=State_t_ListName
			[TABLE_RECORD_STATES:90]Table_number:3:=STATE_l_RelateTableID
			[TABLE_RECORD_STATES:90]Entry_Name:5:=State_t_EntryName
			[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=State_t_AbbrevEntryName
			[TABLE_RECORD_STATES:90]xPipeStateID:7:=State_l_PipelineStatus
			[TABLE_RECORD_STATES:90]xStateClass:8:=ST_l_StateClass
			//Note the sort order gets set when closing the window
			DB_SaveRecord(->[TABLE_RECORD_STATES:90])
			ST_SaveCodeUses([TABLE_RECORD_STATES:90]State_Reference:4)
			//Update the HL list here
			$_l_ParentRow:=Find in array:C230(STATE_al_RelatedTables; STATE_l_RelateTableID)
			If ($1>0)
				$_l_ParentListPosition:=List item position:C629(ST_HL_Tables; STATE_l_RelateTableID)
				GET LIST ITEM:C378(ST_HL_Tables; $_l_ParentListPosition; $_l_ItemParentReference; $_t_ItemParentName; $_l_SublistID; $_bo_Expanded)
				If (Not:C34($_bo_Expanded))
					SET LIST ITEM:C385(ST_HL_Tables; $_l_ItemParentReference; $_t_ItemParentName; $_l_ItemParentReference; $_l_SublistID; True:C214)
				End if 
				ST_at_2DStateRefs{$_l_ParentRow}{$1}:=[TABLE_RECORD_STATES:90]State_Reference:4  //STATE_t_Code
				ST_at_2DStateCodes{$_l_ParentRow}{$1}:=STATE_t_Code
				ST_at_2DStateNames{$_l_ParentRow}{$1}:=State_t_ListName
				ST_al_2DStateClasses{$_l_ParentRow}{$1}:=ST_l_StateClass
				SET LIST ITEM:C385(ST_HL_Tables; ST_al_2DStatePositions{$_l_ParentRow}{$1}; State_t_ListName; ST_al_2DStatePositions{$_l_ParentRow}{$1}; 0; True:C214)
			Else 
				INSERT IN ARRAY:C227(ST_at_2DStateRefs{$_l_ParentRow}; Size of array:C274(ST_at_2DStateRefs{$_l_ParentRow})+1; 1)
				INSERT IN ARRAY:C227(ST_at_2DStateNames{$_l_ParentRow}; Size of array:C274(ST_at_2DStateNames{$_l_ParentRow})+1; 1)
				INSERT IN ARRAY:C227(ST_at_2DStateCodes{$_l_ParentRow}; Size of array:C274(ST_at_2DStateCodes{$_l_ParentRow})+1; 1)
				INSERT IN ARRAY:C227(ST_al_2DStatePositions{$_l_ParentRow}; Size of array:C274(ST_al_2DStatePositions{$_l_ParentRow})+1; 1)
				INSERT IN ARRAY:C227(ST_al_2DStateClasses{$_l_ParentRow}; Size of array:C274(ST_al_2DStateClasses{$_l_ParentRow})+1; 1)
				INSERT IN ARRAY:C227(ST_al_2DStateOrders{$_l_ParentRow}; Size of array:C274(ST_al_2DStateOrders{$_l_ParentRow})+1; 1)
				
				ST_at_2DStateRefs{$_l_ParentRow}{Size of array:C274(ST_at_2DStateRefs{$_l_ParentRow})}:=[TABLE_RECORD_STATES:90]State_Reference:4
				ST_at_2DStateCodes{$_l_ParentRow}{Size of array:C274(ST_at_2DStateCodes{$_l_ParentRow})}:=STATE_t_Code
				ST_at_2DStateNames{$_l_ParentRow}{Size of array:C274(ST_at_2DStateRefs{$_l_ParentRow})}:=State_t_ListName
				ST_al_2DStatePositions{$_l_ParentRow}{Size of array:C274(ST_al_2DStatePositions{$_l_ParentRow})}:=256+STATE_l_RelateTableID+Size of array:C274(ST_al_2DStatePositions{$_l_ParentRow})
				//new item
				ST_al_2DStateClasses{$_l_ParentRow}{Size of array:C274(ST_al_2DStateClasses{$_l_ParentRow})}:=ST_l_StateClass
				$_l_ParentListPosition:=List item position:C629(ST_HL_Tables; STATE_l_RelateTableID)
				GET LIST ITEM:C378(ST_HL_Tables; $_l_ParentListPosition; $_l_ItemParentReference; $_t_ItemParentName; $_l_SublistID; $_bo_Expanded)
				If (Not:C34($_bo_Expanded))
					SET LIST ITEM:C385(ST_HL_Tables; $_l_ItemParentReference; $_t_ItemParentName; $_l_ItemParentReference; $_l_SublistID; True:C214)
				End if 
				
				APPEND TO LIST:C376($_l_SublistID; State_t_ListName; ST_al_2DStatePositions{$_l_ParentRow}{Size of array:C274(ST_al_2DStatePositions{$_l_ParentRow})}; 0; True:C214)
				SET LIST ITEM:C385(ST_HL_Tables; $_l_ItemParentReference; $_t_ItemParentName; $_l_ItemParentReference; $_l_SublistID; True:C214)
				
			End if 
			
			//////////_o_REDRAW LIST(ST_HL_Tables)
			//``
			STATE_t_Code:=""
			State_t_ListName:=""
			State_t_EntryName:=""
			State_t_AbbrevEntryName:=""
			STATE_l_RelateTableID:=0
			STATE_t_SelectedStateRef:=""
			State_t_PipeLineStatus:=""
			State_t_TableName:=""
			ST_l_Modified:=0
			ST_l_StateRef:=0
			ST_al_2DStateClasses:=0
			ST_l_StateClass:=0
			OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; False:C215)
			OBJECT SET VISIBLE:C603(ST_at_PipelineState; False:C215)
			OBJECT SET ENTERABLE:C238(STATE_t_Code; False:C215)
			OBJECT SET ENTERABLE:C238(State_t_ListName; False:C215)
			OBJECT SET ENTERABLE:C238(State_t_EntryName; False:C215)
			OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; False:C215)
		Else 
			//no table
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ST_SaveState"; $_t_oldMethodName)
