//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_HandleRollover
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 20:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_HasRollover; $_bo_MouseActive; $1)
	C_LONGINT:C283($_l_CellType; $_l_Column; $_l_ColumnDataType; $_l_ColumnLeft; $_l_ColumnRight; $_l_Difference; $_l_DisplayedTable; $_l_FieldNumber; $_l_FieldNumber2; $_l_FirstRowStarts; $_l_HeaderHeight)
	C_LONGINT:C283($_l_HorizontalScroll; $_l_Index; $_l_KeyColumn; $_l_LockedWidth; $_l_MouseButton; $_l_Mousex; $_l_MouseY; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_offset; $_l_Row; $_l_RowHeight; $_l_TableNumber2; $_l_TableRow; $_l_TotalWidths; $_l_VerticalScroll; $_l_Width; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowLeft2)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; $_l_WindowWidth; $4; $FirstColumn; $FirstRow)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_Cell; $_ptr_ColumnArray3; $_Ptr_ColumnLocks; $_Ptr_ColumnWIdths; $_ptr_ContextArray; $_ptr_Field; $_ptr_FieldsArray; $_ptr_HasRollover; $_Ptr_KeyField; $_ptr_LBTable)
	C_POINTER:C301($_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $3; $5)
	C_TEXT:C284($_t_ListboxObjectName; $_t_oldMethodName; $_t_VariableName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_HandleRollover")
If (Count parameters:C259>=1)
	
	$_bo_MouseActive:=$1
	$_t_ListboxObjectName:=$2
	$_ptr_ContextArray:=$3
	$_l_DisplayedTable:=$4
	If ($_bo_MouseActive)
		GET MOUSE:C468($_l_Mousex; $_l_MouseY; $_l_MouseButton)
		//Get the columns
		
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; $_t_ListboxObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET SCROLL POSITION:C1114(*; $_t_ListboxObjectName; $FirstRow; $FirstColumn)
		$_l_HeaderHeight:=LISTBOX Get headers height:C1144(*; $_t_ListboxObjectName)  //LISTBOX Get property(*;$_t_ListboxObjectName;_o_lk header height)
		$_l_RowHeight:=LISTBOX Get rows height:C836(*; $_t_ListboxObjectName)
		//$_l_HorizontalScroll:=LISTBOX Get property(*;$_t_ListboxObjectName;_o_lk hor scrollbar position)
		OBJECT GET SCROLL POSITION:C1114(*; $_t_ListboxObjectName; $_l_VerticalScroll; $_l_HorizontalScroll)
		$_l_FirstRowStarts:=($_l_ObjectTop)+$_l_HeaderHeight
		$_l_MouseY:=$_l_MouseY+1
		$_l_offset:=(($_l_MouseY-($_l_ObjectTop+$_l_HeaderHeight)))
		If ($_l_offset>0)
			$_l_Row:=((Int:C8($_l_offset/$_l_RowHeight)))+$FirstRow
			$_l_TableRow:=Find in array:C230($_ptr_ContextArray->; $_l_DisplayedTable)
			If ($_l_TableRow>0)  //it shoud be!
				RESOLVE POINTER:C394($5; $_t_VariableName; $_l_TableNumber2; $_l_FieldNumber2)
				If ($_t_VariableName="DB_apo_ContextPointers")
					$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_TableRow}
				Else 
					$_ptr_ListboxSetup:=$5
				End if 
				If (Not:C34(Is nil pointer:C315($_ptr_ListboxSetup)))
					If (Size of array:C274($_ptr_ListboxSetup->)>=15)
						$_Ptr_ColumnWIdths:=$_ptr_ListboxSetup->{13}
						$_Ptr_ColumnLocks:=$_ptr_ListboxSetup->{15}
						LISTBOX GET ARRAYS:C832(*; $_t_ListboxObjectName; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						$_l_TotalWidths:=0
						$_l_LockedWidth:=0
						For ($_l_Index; 1; Size of array:C274($_abo_ColumnsVisible))
							If ($_l_Index<=Size of array:C274($_Ptr_ColumnWIdths->))
								If ($_abo_ColumnsVisible{$_l_Index}=False:C215)
									$_Ptr_ColumnWIdths->{$_l_Index}:=0
								End if 
								$_l_TotalWidths:=$_l_TotalWidths+$_Ptr_ColumnWIdths->{$_l_Index}
								
								
								If ($_Ptr_ColumnLocks->{$_l_Index})
									$_l_LockedWidth:=$_l_TotalWidths
								End if 
							End if 
						End for 
						
						$_l_Column:=0
						$_l_Width:=$_l_ObjectLeft
						$_l_ColumnLeft:=0
						$_l_ColumnRight:=0
						$_l_TotalWidths:=0
						//$FirstColumn is the first displayed column after the locked columns
						If ($_l_Mousex<$_l_LockedWidth) & ($FirstColumn>1)
							For ($_l_Index; 1; Size of array:C274($_Ptr_ColumnWIdths->))
								If ($_l_Index<Size of array:C274($_Ptr_ColumnWIdths->))
									
									$_l_Width:=$_l_Width+($_Ptr_ColumnWIdths->{$_l_Index})
								Else 
									$_l_Width:=$_l_ObjectRight
								End if 
								$_l_TotalWidths:=$_l_TotalWidths-$_Ptr_ColumnWIdths->{$_l_Index}
								
								If ($_l_Width>($_l_Mousex))
									$_l_ColumnRight:=$_l_Width
									$_l_ColumnLeft:=$_l_ColumnRight-$_Ptr_ColumnWIdths->{$_l_Index}
									If ($_l_Index=Size of array:C274($_Ptr_ColumnWIdths->)) | ($_l_TotalWidths<0)
										$_l_ColumnRight:=$_l_ObjectRight
									End if 
									
									$_l_Column:=$_l_Index
									$_l_Index:=Size of array:C274($_Ptr_ColumnWIdths->)
								Else 
									$_l_ColumnLeft:=$_l_Width
								End if 
							End for 
						Else 
							If ($FirstColumn=1)
								$_l_LockedWidth:=0
							End if 
							For ($_l_Index; $FirstColumn; Size of array:C274($_Ptr_ColumnWIdths->))
								If ($_l_Index<Size of array:C274($_Ptr_ColumnWIdths->))
									
									$_l_Width:=$_l_Width+($_Ptr_ColumnWIdths->{$_l_Index})
								Else 
									$_l_Width:=$_l_ObjectRight
								End if 
								If ($_l_Index=$FirstColumn) & ($_l_LockedWidth>0)
									
									If ($_l_HorizontalScroll<$_l_LockedWidth)
										
										$_l_LockedWidth:=$_l_LockedWidth-($_l_HorizontalScroll)
									Else 
										If ($_l_Index>1)
											//if($_Ptr_ColumnWIdths»
											//The first visible column is not the first column
											//
										End if 
										//The 'first column' will no longer be the first unlocked column.
										//Part of a column may still be displayed if it is wider than the
										//If ($_Ptr_ColumnWIdths->
										$_l_Difference:=$_l_HorizontalScroll-$_l_LockedWidth
										//$_l_LockedWidth:=$_l_HorizontalScroll
										
									End if 
									
									//this
								End if 
								
								$_l_TotalWidths:=$_l_TotalWidths-$_Ptr_ColumnWIdths->{$_l_Index}
								
								If ($_l_Width>($_l_Mousex-$_l_LockedWidth))
									$_l_ColumnRight:=$_l_Width+$_l_LockedWidth
									$_l_ColumnLeft:=$_l_ColumnRight-$_Ptr_ColumnWIdths->{$_l_Index}
									If ($_l_ColumnLeft<$_l_LockedWidth)
										$_l_ColumnLeft:=$_l_LockedWidth
									End if 
									If ($_l_Index=Size of array:C274($_Ptr_ColumnWIdths->)) | ($_l_TotalWidths<0)
										$_l_ColumnRight:=$_l_ObjectRight
									End if 
									
									$_l_Column:=$_l_Index
									$_l_Index:=Size of array:C274($_Ptr_ColumnWIdths->)
								Else 
									$_l_ColumnLeft:=$_l_Width
								End if 
								
							End for 
							//$_l_ColumnLeft:=($_l_ColumnLeft-$_l_HorizontalScroll)+$_l_LockedWidth
							//$_l_ColumnRight:=($_l_ColumnRight-$_l_HorizontalScroll)+$_l_LockedWidth
						End if 
						
						If ($_l_Row>0) & ($_l_Column>0)
							If ($_l_ColumnRight>$_l_ColumnLeft)
								LISTBOX GET ARRAYS:C832(*; $_t_ListboxObjectName; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
								If (Not:C34(Is nil pointer:C315($_aptr_ColumnVariables{$_l_Column})))
									$_ptr_Cell:=$_aptr_ColumnVariables{$_l_Column}
									$_l_CellType:=Type:C295($_ptr_Cell->)
									If (Is a variable:C294($_ptr_Cell))
										
										$_ptr_FieldsArray:=$_ptr_ListboxSetup->{2}
										$_ptr_Field:=$_ptr_FieldsArray->{$_l_Column}
										
										$_ptr_LBTable:=Table:C252($_l_DisplayedTable)
										$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
										$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
										$_ptr_ColumnArray3:=$_ptr_ListboxSetup->{3}
										$_ptr_HasRollover:=$_ptr_ListboxSetup->{21}
										$_bo_HasRollover:=$_ptr_HasRollover->{$_l_Column}
										$_l_KeyColumn:=Find in array:C230($_ptr_ListboxSetup->{2}->; $_ptr_ListboxSetup->{8})
										If ($_l_KeyColumn>0)
											If ($_l_KeyColumn<=Size of array:C274($_ptr_ColumnArray3->))
												$_Ptr_ThisColumnArray:=$_ptr_ColumnArray3->{$_l_KeyColumn}
												If ($_l_Row<=(Size of array:C274($_Ptr_ThisColumnArray->)))
													//TRACE
													If ($_Ptr_KeyField->#$_Ptr_ThisColumnArray->{$_l_Row})
														QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})
													End if 
													$_l_Row:=-(Record number:C243($_ptr_LBTable->))
												Else 
													$_l_Row:=0
												End if 
											Else 
												$_l_Row:=0
											End if 
										Else 
											$_l_Row:=0
										End if 
										
										
										
										
									Else 
										$_ptr_HasRollover:=$_ptr_ListboxSetup->{21}
										$_ptr_Field:=$_aptr_ColumnVariables{$_l_Column}
										$_bo_HasRollover:=$_ptr_HasRollover->{$_l_Column}
										If ($_l_Row>Records in selection:C76(Table:C252($_l_DisplayedTable)->))
											$_l_Row:=0
										End if 
									End if 
									$_l_FieldNumber:=Field:C253($_ptr_Field)
									$_l_ColumnDataType:=Type:C295($_ptr_Field->)
									If ($_l_ColumnRight>$_l_WindowRight)
										$_l_ColumnRight:=$_l_WindowRight-10
									End if 
									If ($_l_WindowLeft<0)
										$_l_WindowLeft2:=0
										$_l_ColumnRight:=$_l_ColumnRight-$_l_WindowLeft
									Else 
										$_l_WindowLeft2:=$_l_WindowLeft
									End if 
									If (($_l_ColumnDataType=Is picture:K8:10) | ($_l_ColumnDataType=Is text:K8:3)) & ($_bo_HasRollover) & ($_l_Row#0)
										
										DB_ShowFloatingRecord(Current process:C322; ($_l_ColumnLeft+$_l_WindowLeft); ($_l_ColumnRight+$_l_WindowLeft2); ($_l_windowTop+$_l_MouseY); $_l_DisplayedTable; $_l_FieldNumber; $_l_ColumnDataType; $_l_Row)
									Else 
										DB_ShowFloatingRecord(Current process:C322; ($_l_ColumnLeft+$_l_WindowLeft); ($_l_ColumnRight+$_l_WindowLeft2); ($_l_windowTop+$_l_MouseY); $_l_DisplayedTable; $_l_FieldNumber; 0; $_l_Row)
									End if 
									
								End if 
							End if 
						Else 
							
						End if 
					End if 
				End if 
			End if 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("LBI_HandleRollover"; $_t_oldMethodName)