//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_AreaScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/02/2010 08:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($6)
	//C_UNKNOWN($7)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>LBI_al_DragProcess;0)
	//ARRAY LONGINT(<>LBI_al_DropProcess;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	//ARRAY TEXT(<>LBI_at_DragArea;0)
	//ARRAY TEXT(<>LBI_at_DragPair;0)
	//ARRAY TEXT(<>LBI_at_DropArea;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; <>LBI_bo_DrgArrays; <>PER_bo_LbDefinitiionsInited; $_bo_BooleanValue; $_bo_Changed; $_bo_Command; $_bo_Initialized; $_bo_NewProcess; $_bo_NoEdit; $_bo_NoExecute; $_bo_noTab)
	C_BOOLEAN:C305($_bo_OK; $_bo_OpeninNewProcess; $_bo_OptionKey; $_bo_ProcessVisible; $_bo_ReadOnly; $_bo_Reject; $_bo_RowChange; $_bo_Set; $_bo_shift; $_bo_Silent; $_bo_ValidDrop)
	C_BOOLEAN:C305(LBI_bo_ColumnMod; LBI_bo_NoEdit; ORD_bo_IsRevision; <>FS_bo_FSettingsLoaded; <>LBI_bo_DrgArrays; <>PER_bo_LbDefinitiionsInited; $_bo_BooleanValue; $_bo_Changed; $_bo_Command; $_bo_Initialized; $_bo_NewProcess)
	C_BOOLEAN:C305($_bo_NoEdit; $_bo_NoExecute; $_bo_noTab; $_bo_OK; $_bo_OpeninNewProcess; $_bo_OptionKey; $_bo_ProcessVisible; $_bo_ReadOnly; $_bo_Reject; $_bo_RowChange; $_bo_Set)
	C_BOOLEAN:C305($_bo_shift; $_bo_Silent; $_bo_ValidDrop; LB_bo_AddLine; LBI_bo_NoEdit; ORD_bo_IsRevision)
	C_DATE:C307($_d_ValueDate)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_ColumnNumber; $_l_ColumnWidth; $_l_DataType; $_l_DropRow; $_l_EditableMode; $_l_Element; $_l_Event; $_l_FieldNumber; $_l_FormReferenceRow)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_IndexColumnWidths; $_l_IndexgnoreColumns; $_l_LayoutColumnNumber; $_l_ProcessState; $_l_ProcessTime; $_l_Row; $_l_SizeofArray; $_l_SortDirection; $_l_SortFieldNumber)
	C_LONGINT:C283($_l_SourceProcess; $_l_SourceRow; $_l_TableNumber; $_l_UniqueProcessID; $2; $8; DB_l_ButtonClickedFunction; LB_l_LastRow; STOCK_l_Context; vColumn; Vrow)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_ColumnNumber; $_l_ColumnWidth; $_l_DataType; $_l_DropRow; $_l_EditableMode; $_l_Element; $_l_Event; $_l_FieldNumber; $_l_FormReferenceRow)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_IndexColumnWidths; $_l_IndexgnoreColumns; $_l_LayoutColumnNumber; $_l_ProcessState; $_l_ProcessTime; $_l_Row; $_l_SizeofArray; $_l_SortDirection; $_l_SortFieldNumber)
	C_LONGINT:C283($_l_SourceProcess; $_l_SourceRow; $_l_TableNumber; $_l_UniqueProcessID; $8; DB_l_ButtonClickedFunction; LB_l_LastRow; STOCK_l_Context)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumnFormats; $_ptr_ArrayOfColumnFormulas; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_FieldNumbersRef; $_Ptr_KeyField)
	C_POINTER:C301($_ptr_LBTable; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_ptr_SourceObject; $_ptr_TableNumberPointer; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1; $4; $_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers)
	C_POINTER:C301($_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumnFormats; $_ptr_ArrayOfColumnFormulas; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_FieldNumbersRef; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBoxArea)
	C_POINTER:C301($_ptr_ListboxSetup; $_ptr_SourceObject; $_ptr_TableNumberPointer; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1)
	C_REAL:C285($_r_ValueReal; $5; $_r_ValueReal)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName; $_t_DestinationName; $_t_oldMethodName; $_t_ParentRecordCode; $_t_processName; $_t_SourceName; $_t_ValueString; $3; $6)
	C_TEXT:C284($7; <>PER_t_CurrentUserInitials; $_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName; $_t_DestinationName; $_t_oldMethodName; $_t_ParentRecordCode; $_t_processName; $_t_SourceName; $_t_ValueString; $3)
	C_TEXT:C284($9)
	C_TIME:C306($_ti_TimeValue)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_AreaScript"; Form event code:C388)

//NG 20/7/06 This method is a replacement for ALAreaScript




//ALAreaScript - the script of the Included Areas
// $_ptr_ListboxSetup = pointer to the array of arrays
// $2 = 0 or 1: 1 = open in new process
// $3 = current record key field
//$4 = pointer to the selectable mode
// $5 = row number
// $6=column name
// $7 = name of method to call for data entry
$_l_Event:=Form event code:C388
If (Count parameters:C259>=4)
	If ($2<0)
		$_l_Event:=Abs:C99($2)
	End if 
End if 


$_bo_OpeninNewProcess:=False:C215
If ($2>0)
	$_bo_OpeninNewProcess:=($2=1)
End if 
If (Count parameters:C259>=3)
	$_ptr_ListboxSetup:=$1
	// $6 = name of entrey exited callback method (from ALP days)
	If (Size of array:C274($_ptr_ListboxSetup->)>0)
		If ($_l_Event=On Double Clicked:K2:5) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On After Keystroke:K2:26) | ($_l_Event=On After Edit:K2:43) | ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Losing Focus:K2:8) | ($_l_Event=On Column Resize:K2:31) | ($_l_Event=On Column Moved:K2:30) | ($_l_Event=On Row Moved:K2:32) | ($_l_Event=On Header Click:K2:40) | ($_l_Event=On Drop:K2:12)
			
			
			$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
			$_ptr_ArrayOfColumnFormats:=$_ptr_ListboxSetup->{5}
			$_ptr_ArrayOfColumnFormulas:=$_ptr_ListboxSetup->{6}
			$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
			$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
			///$_l_Index2Uniq:=$_ptr_ListboxSetup->{11}
			$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			//$_ptr_EnterabilityArray
			If (Size of array:C274($_ptr_ListboxSetup->)>=19)
				$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
				$_l_AreaType:=$_ptr_areaTypeVariable->
			Else 
				$_l_AreaType:=1
			End if 
			
			If (Count parameters:C259>=2)
				//NG--NEW parameter
				$_bo_NewProcess:=($2=1)
			Else 
				$_bo_NewProcess:=False:C215
			End if 
			If (Count parameters:C259>=3)  // Modified NG March 2004
				
				
				$_t_ParentRecordCode:=$3
			Else 
				$_t_ParentRecordCode:=""
			End if 
			If (Count parameters:C259>=4)
				If (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is integer:K8:5) | (Type:C295($4->)=Is real:K8:4)
					$_l_EditableMode:=$4->
				Else 
					$_l_EditableMode:=Num:C11($4->{1}="Edit")  //current mode is non edit if it says edit
				End if 
				If ($4->=1)  //selectable mode
					
					
					If (Count parameters:C259>=2)
						//$_bo_NewProcess:=True
					End if 
				End if 
			Else 
				$_l_EditableMode:=<>LB_at_EditModes
				If (<>LB_at_EditModes=1)  //selectable mode
					
					
					If (Count parameters:C259>=2)
						If (Count parameters:C259>=2)
							//NG--NEW parameter
							//$_bo_NewProcess:=($2=0)
						Else 
							//$_bo_NewProcess:=False
						End if 
					End if 
				End if 
			End if 
			
			Case of 
				: ($_l_Event=On Getting Focus:K2:7)
					
					
					
				: ($_l_Event=On Double Clicked:K2:5)  //| ($_l_Event=On Plug in Area )
					
					
					If ($_l_EditableMode=1) | (True:C214) | (LBI_bo_NoEdit)
						If (Count parameters:C259>=5)
							//BEEP
							If ($5>0)
								LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
								//```
								
								If (Count parameters:C259>=6)
									$_ti_TimeValue:=?00:00:00?
									$_d_ValueDate:=!00-00-00!
									$_bo_BooleanValue:=False:C215
									$_r_ValueReal:=0
									$_t_ValueString:=""
									LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
									$_bo_BooleanValue:=False:C215
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									If ($_ptr_ArrayReferences->{4}="2@")
										//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
									End if 
									If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))
										
										
										If ($_l_AreaType=3)
											$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
										Else 
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $6)}
										End if 
										
										//$arPtr:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
										
										$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
										Case of 
											: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
												
												
												$_t_ValueString:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
												
												
												$_r_ValueReal:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Date array:K8:20)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Boolean array:K8:21)
												
												
												$_bo_BooleanValue:=$_Ptr_ThisColumnArray->{$5}
										End case 
										
										EXECUTE METHOD:C1007($7)
										
										$_bo_noTab:=False:C215
										Case of 
											: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
												
												
												If ($_t_ValueString#"") & ($_Ptr_ThisColumnArray->{$5}="")
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
												
												
												
												If ($_r_ValueReal#0) & ($_Ptr_ThisColumnArray->{$5}=0)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Date array:K8:20)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->{$_l_Row}
												If ($_d_ValueDate#!00-00-00!) & ($_Ptr_ThisColumnArray->{$5}=!00-00-00!)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Boolean array:K8:21)
												
												
												
										End case 
										
										If ($_bo_noTab=False:C215)
											$_bo_Set:=False:C215
											
											For ($_l_Index; $_l_ColumnNumber+1; Size of array:C274($_ptr_EnterabilityArray->))
												If ($_ptr_ArrayReferences->{4}="2@")
													//$_ptr_EnterabilityArray->{$_l_Index}:=False
												End if 
												If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
													$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
													EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
													$_bo_Set:=True:C214
													$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
												End if 
												
											End for 
											If (Not:C34($_bo_Set))
												LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
											End if 
										Else 
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
											EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
											
										End if   //`````
										
										
									End if 
								End if 
								
								//```
								LBi_InclEdit($_ptr_ListboxSetup; $_bo_NewProcess; $_t_ParentRecordCode; $5)
								
							End if 
						End if 
					Else 
						If (Count parameters:C259>=6)
							$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
							$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
							LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LB_GoToCell($_ptr_ListboxSetup->{1}; $_l_ColumnNumber; $5)
						End if 
					End if 
				: ($_l_Event=On Clicked:K2:4)
					//TRACE
					If (Count parameters:C259>=4)
						If (Type:C295($4->)=Is longint:K8:6) | (Type:C295($4->)=Is real:K8:4) | (Type:C295($4->)=Is integer:K8:5)
							$_bo_NoEdit:=($4->=2)
						Else 
							If (Size of array:C274($4->)>1)
								$_bo_NoEdit:=($4->{1}="edit") | ($_l_EditableMode=1)
							End if 
						End if 
					End if 
					//TRACE
					
					LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
					If ($_l_ColumnNumber>0)
						If ($_ptr_ArrayReferences->{4}="2@")
							//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
						End if 
						If (LBI_bo_NoEdit) | $_bo_NoEdit | (Not:C34(($_ptr_EnterabilityArray->{$_l_ColumnNumber})))
							$_bo_Command:=(Macintosh command down:C546 | Windows Ctrl down:C562)
							$_bo_shift:=Shift down:C543
							If (Not:C34($_bo_shift | $_bo_Command))
								$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
								$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
								$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
								
								If ($_l_AreaType=3)
									$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
								Else 
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $6)}
								End if 
								
								OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; False:C215)
								LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $_l_Row; 0)
							End if 
						Else 
							$_bo_Command:=(Macintosh command down:C546 | Windows Ctrl down:C562)
							$_bo_shift:=Shift down:C543
							If (Not:C34($_bo_shift | $_bo_Command))  //if the shift is
								
								
								If (False:C215)
									$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
									$_l_ColumnNumber:=Find in array:C230($_ptr_ArrayOfArrayNames->; $6)
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									LB_GoToCell($_ptr_ListboxArea; $_l_ColumnNumber; $5)
								Else 
									If (Count parameters:C259>=5)
										If (LB_l_LastRow#$5)
											//$_bo_RowChange:=True
											//LOAD RECORD([ORDER ITEMS])
										End if 
									End if 
									//TRACE
									If (Count parameters:C259>=6)
										If ($_bo_RowChange)
											LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
											
											$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
											$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
											$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
											If ($_l_AreaType=3)
												$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
											Else 
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $6)}
											End if 
											If (Count parameters:C259>=9)
												LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $_l_Row; 0)
											Else 
												OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; True:C214)
												EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
												LB_GoToCell($_ptr_ListboxSetup->{1}; $_l_ColumnNumber; $5)
											End if 
										Else 
											LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
											
											$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
											$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
											$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
											If ($_l_AreaType=3)
												$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
											Else 
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $6)}
											End if 
											//$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
											//$EnterabilityOptions:=$_ptr_ArrayReferences->{4}
											If ($_ptr_ArrayReferences->{4}="2@")
												
											End if 
											
											If (Count parameters:C259>=9)
												If ($9#"")
													
													LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
													$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
													$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
													$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
													If ($_l_AreaType=3)
														$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
														$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
														$_bo_Reject:=False:C215
														$_l_TableNumber:=Table:C252($_Ptr_ThisColumnField)
														$_ptr_TableNumberPointer:=Table:C252($_l_TableNumber)
														LOAD RECORD:C52($_ptr_TableNumberPointer->)
														//TRACE  //dont reject-put the value of the last selected cell in 0
														$_Ptr_ThisColumnArray->{0}:=$_Ptr_ThisColumnField->
														
														//EXECUTE METHOD($9;$_bo_Reject;$_Ptr_ThisColumnArray)
														If ($_bo_Reject)  //Changing this so it only rejects it you edit it
															
															
															//dont reject-put the value of the last selected cell in 0
															$_l_TableNumber:=Table:C252($_Ptr_ThisColumnField)
															$_ptr_TableNumberPointer:=Table:C252($_l_TableNumber)
															UNLOAD RECORD:C212($_ptr_TableNumberPointer->)
															$_l_ColumnNumber:=$_l_ColumnNumber+1
															LB_GoToCell($_ptr_ListboxSetup->{1}; $_l_ColumnNumber; $_l_Row)
															LOAD RECORD:C52($_ptr_TableNumberPointer->)
															LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $_l_Row; 0)
														Else 
															OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnField->; True:C214)
															EDIT ITEM:C870($_Ptr_ThisColumnField->; $_l_Row)
															LB_GoToCell($_ptr_ListboxSetup->{1}; $_l_ColumnNumber; $_l_Row)
														End if 
														
													Else 
														$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $6)}
													End if 
												End if 
												
												
											Else 
												
												OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; True:C214)
												EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
												LB_GoToCell($_ptr_ListboxSetup->{1}; $_l_ColumnNumber; $5)
											End if 
										End if 
										
										
										LB_l_LastRow:=$_l_Row
									End if 
								End if 
							End if 
						End if 
					End if 
				: ($_l_Event=On After Keystroke:K2:26) | ($_l_Event=On After Edit:K2:43)
					
					
					If ($_l_AreaType>=3)
						LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
						If ($_l_ColumnNumber>0)
							$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
							$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
							$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
							$_bo_Reject:=False:C215
							$_bo_Silent:=False:C215
							//$Value:=Old($_Ptr_ThisColumnArray->)
							If ($_Ptr_ThisColumnField->#$_Ptr_ThisColumnArray->{0})
								
								EXECUTE METHOD:C1007($9; $_bo_Reject; $_Ptr_ThisColumnField; $_bo_Silent)
								If ($_bo_Reject)
									$_Ptr_ThisColumnField->:=$_Ptr_ThisColumnArray->{0}
								End if 
							End if 
						End if 
					End if 
					
				: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Losing Focus:K2:8)
					
					
					
					If ($_l_EditableMode=1) & (False:C215)
						
					Else 
						If ($_l_Event=On Losing Focus:K2:8)
							$_bo_OK:=LBI_bo_ColumnMod  //only is there was a change-like cut an paste
							
							
							
							
						Else 
							$_bo_OK:=True:C214
						End if 
						LBI_bo_ColumnMod:=False:C215
						If ($_bo_OK)
							If ($_l_AreaType<3)
								$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
								
								If (Count parameters:C259>=6)
									$_ti_TimeValue:=?00:00:00?
									$_d_ValueDate:=!00-00-00!
									$_bo_BooleanValue:=False:C215
									$_r_ValueReal:=0
									$_t_ValueString:=""
									LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
									$_bo_BooleanValue:=False:C215
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									If ($_l_ColumnNumber>0)
										If ($_ptr_ArrayReferences->{4}="2@")
											//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
										End if 
										If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
											//$arPtr:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
											
											$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
											If (Size of array:C274($_Ptr_ThisColumnArray->)>=$5)
												Case of 
													: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
														
														
														$_t_ValueString:=$_Ptr_ThisColumnArray->{$5}
													: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
														
														
														$_r_ValueReal:=$_Ptr_ThisColumnArray->{$5}
													: ($_l_DataType=Date array:K8:20)
														
														
														$_d_ValueDate:=$_Ptr_ThisColumnArray->{$5}
													: ($_l_DataType=Boolean array:K8:21)
														
														
														$_bo_BooleanValue:=$_Ptr_ThisColumnArray->{$5}
												End case 
											End if 
											
											EXECUTE METHOD:C1007($7)
											
											$_bo_noTab:=False:C215
											If (Size of array:C274($_Ptr_ThisColumnArray->)>=$5)
												Case of 
													: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
														
														
														If ($_t_ValueString#"") & ($_Ptr_ThisColumnArray->{$5}="")
															$_bo_noTab:=True:C214
														End if 
													: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
														
														
														
														If ($_r_ValueReal#0) & ($_Ptr_ThisColumnArray->{$5}=0)
															$_bo_noTab:=True:C214
														End if 
													: ($_l_DataType=Date array:K8:20)
														
														
														$_d_ValueDate:=$_Ptr_ThisColumnArray->{$_l_Row}
														If ($_d_ValueDate#!00-00-00!) & ($_Ptr_ThisColumnArray->{$5}=!00-00-00!)
															$_bo_noTab:=True:C214
														End if 
													: ($_l_DataType=Boolean array:K8:21)
														
														
														
												End case 
											End if 
											If ($_bo_noTab=False:C215)
												$_bo_Set:=False:C215
												
												For ($_l_Index; $_l_ColumnNumber+1; Size of array:C274($_ptr_EnterabilityArray->))
													If ($_ptr_ArrayReferences->{4}="2@")
														//$_ptr_EnterabilityArray->{$_l_Index}:=False
													End if 
													If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
														$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
														EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
														$_bo_Set:=True:C214
														$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
													End if 
													
												End for 
												If (Not:C34($_bo_Set))
													LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
												End if 
											Else 
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
												EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
												
											End if   //`````
											
											
										End if 
									End if 
								End if 
							Else 
								If ($_l_Event=On Data Change:K2:15)
									
									
									If ($9#"")
									End if 
								End if 
								If (Count parameters:C259>=6)
									$_bo_Initialized:=False:C215
									$_ti_TimeValue:=?00:00:00?
									$_d_ValueDate:=!00-00-00!
									$_bo_BooleanValue:=False:C215
									$_r_ValueReal:=0
									$_t_ValueString:=""
									$_bo_Initialized:=False:C215
									LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
									$_bo_BooleanValue:=False:C215
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									$_bo_NoExecute:=False:C215
									If ($_l_ColumnNumber>0)
										If ($_ptr_ArrayReferences->{4}="2@")
											//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
										End if 
										If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))
											$_bo_Initialized:=True:C214
											$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
											$_bo_Reject:=False:C215
											$_bo_Silent:=False:C215
											//$Value:=Old($_Ptr_ThisColumnArray->)
											$_l_DataType:=Type:C295($_Ptr_ThisColumnField->)
											Case of 
												: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
													
													
													$_t_ValueString:=$_Ptr_ThisColumnField->
												: ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is longint:K8:6)
													
													
													$_r_ValueReal:=$_Ptr_ThisColumnField->
												: ($_l_DataType=Is date:K8:7)
													
													
													$_d_ValueDate:=$_Ptr_ThisColumnField->
												: ($_l_DataType=Is boolean:K8:9)
													
													
													$_bo_BooleanValue:=$_Ptr_ThisColumnField->
												: ($_l_DataType=Is time:K8:8)
													
													
													$_ti_TimeValue:=$_Ptr_ThisColumnField->
											End case 
											$_bo_NoExecute:=False:C215
											If ($_Ptr_ThisColumnField->#$_Ptr_ThisColumnArray->{0}) & (Count parameters:C259>=9)
												$_bo_Silent:=False:C215
												
												//EXECUTE METHOD($7)
												
												EXECUTE METHOD:C1007($9; $_bo_Reject; $_Ptr_ThisColumnField; $_bo_Silent; $_Ptr_ThisColumnArray)
												If ($_bo_Reject)
													$_bo_NoExecute:=True:C214
													$_Ptr_ThisColumnField->:=$_Ptr_ThisColumnArray->{0}
												End if 
											Else 
												
											End if 
										End if 
										If (Not:C34($_bo_NoExecute))
											EXECUTE METHOD:C1007($7)
										End if 
										$_bo_noTab:=False:C215
										If ($_bo_Initialized)
											Case of 
												: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
													
													
													If ($_t_ValueString#"") & ($_Ptr_ThisColumnField->="")
														$_bo_noTab:=True:C214
													End if 
												: ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is longint:K8:6)
													
													
													
													If ($_r_ValueReal#0) & ($_Ptr_ThisColumnField->=0)
														$_bo_noTab:=True:C214
													End if 
												: ($_l_DataType=Is date:K8:7)
													
													
													$_d_ValueDate:=$_Ptr_ThisColumnField->
													If ($_d_ValueDate#!00-00-00!) & ($_Ptr_ThisColumnField->=!00-00-00!)
														$_bo_noTab:=True:C214
													End if 
												: ($_l_DataType=Is boolean:K8:9)
												: ($_l_DataType=Is time:K8:8)
													
													
													
													
													If ($_ti_TimeValue#?00:00:00?) & ($_Ptr_ThisColumnField->=?00:00:00?)
														$_bo_noTab:=True:C214
													End if 
											End case 
											
											If ($_bo_noTab=False:C215)
												$_bo_Set:=False:C215
												
												For ($_l_Index; $_l_ColumnNumber+1; Size of array:C274($_ptr_EnterabilityArray->))
													If ($_ptr_ArrayReferences->{4}="2@")
														//$_ptr_EnterabilityArray->{$_l_Index}:=False
													End if 
													If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
														$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_Index}
														EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
														$_bo_Set:=True:C214
														$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
													End if 
													
												End for 
												If (Not:C34($_bo_Set))
													LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
												End if 
											Else 
												$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
												EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
												
											End if 
										End if   //`````
										
										
									End if 
								End if 
							End if 
						End if 
						
					End if 
					
				: ($_l_Event=On Column Resize:K2:31)
					
					
					If (<>PER_bo_LbDefinitiionsInited)
						$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						LISTBOX GET ARRAYS:C832($_Ptr_ListBoxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						
						LBi_Resize($_ptr_ListboxSetup)
						READ WRITE:C146([LIST_LAYOUTS:96])
						//$_ptr_ListboxSetup:=$_ptr_ListboxSetup
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
						$_t_CurrentUserDefinitionsName:=$_ptr_ArrayReferences->{7}
						LBi_ListFindDup($_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName)
						$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
						
						$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
						$_ptr_ArrayOfColumnFormulas:=$_ptr_ListboxSetup->{6}
						$_l_SizeofArray:=Size of array:C274($_ptr_ArrayofColumnWIdths->)
						FIRST RECORD:C50([LIST_LAYOUTS:96])
						COPY NAMED SELECTION:C331([LIST_LAYOUTS:96]; "$TempSelection")
						For ($_l_IndexColumnWidths; 1; Size of array:C274($_ptr_ArrayofColumnWIdths->))
							If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_IndexColumnWidths})=0) & ($_ptr_ArrayofColumnWIdths->{$_l_IndexColumnWidths}#0)
								$_l_IndexgnoreColumns:=0
								$_l_Column:=$_l_IndexColumnWidths
								For ($_l_Index; 1; $_l_Column)
									If (Position:C15("LB_GetRelation"; $_ptr_ArrayOfColumnFormulas->{$_l_Index})#0)
										$_l_IndexgnoreColumns:=$_l_IndexgnoreColumns+1
									End if 
									If ($_ptr_ArrayofColumnWIdths->{$_l_Index}=0)  // Zero width columns are invisible so dont get counted
										
										
										//$_l_IndexgnoreColumns:=$_l_IndexgnoreColumns-1
									End if 
								End for 
								$_l_ColumnWidth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Column})
								$_l_LayoutColumnNumber:=$_l_Column-$_l_IndexgnoreColumns
								USE NAMED SELECTION:C332("$TempSelection")
								QUERY SELECTION:C341([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7=$_l_LayoutColumnNumber)
								If ([LIST_LAYOUTS:96]Width:5#$_ptr_ArrayofColumnWIdths->{$_l_Column})
									[LIST_LAYOUTS:96]Width:5:=$_ptr_ArrayofColumnWIdths->{$_l_Column}
									AA_CheckUUID(Table:C252(->[LIST_LAYOUTS:96]))
									
									SAVE RECORD:C53([LIST_LAYOUTS:96])
								End if 
							End if 
						End for 
						UNLOAD RECORD:C212([LIST_LAYOUTS:96])
						READ ONLY:C145([LIST_LAYOUTS:96])
						
					End if 
				: ($_l_Event=On Column Moved:K2:30)
					
					
					If (<>PER_bo_LbDefinitiionsInited)
						LBi_DragCol($_ptr_ListboxSetup)
					End if 
				: ($_l_Event=On Row Moved:K2:32)
					
					
					//Does this event get called for all drags? or just within the area? test
					If (ORD_bo_IsRevision) | (STOCK_l_Context=-1)  //used in orders AND Stock movements only currently
						
						
						
						
						LBi_DragCopy($_ptr_ListboxSetup)
						
						
					Else 
						LBi_DragRow($_ptr_ListboxSetup)
					End if 
				: ($_l_Event=On Header Click:K2:40)  // Sort
					
					
					If (Not:C34(<>FS_bo_FSettingsLoaded))
						FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
					End if 
					$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
					$_bo_OptionKey:=Gen_Option
					If (Count parameters:C259>=8)
						$_l_ColumnNumber:=$8
						
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
						$_ptr_FieldNumbersRef:=$_ptr_ListboxSetup->{2}
						$_l_SortFieldNumber:=Field:C253($_ptr_FieldNumbersRef->{$8})
						$_l_TableNumber:=Table:C252($_ptr_FieldNumbersRef->{$8})
						If ($_l_TableNumber#Table:C252(->[ORDER_ITEMS:25]))
							While (Semaphore:C143("$WriteFormsortPref"))
								DelayTicks(2)
							End while 
							$_l_FormReferenceRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
							$_l_SortDirection:=0
							
							If ($_l_FormReferenceRow>0)
								$_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormReferenceRow}  //added 29/08/06 - kmw (not initialised which was causing error when toggling)
								
								
								If ($_l_SortFieldNumber=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}) | ((-Abs:C99($_l_ColumnNumber))=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow})
									//Current sort field-change direction
									//$_l_SortDirection:=Abs($_l_SortDirection-1)
									$_l_SortDirection:=-1  //kmw 29/08/06 - above line altered to this so that we toggle between 1 and -1 instead of 1 and 0 (rest of code seems to expect the former).
									
									
									
								Else 
									$_l_SortDirection:=1
								End if 
							Else 
								
								
								$_l_SortDirection:=1
							End if 
							
							CLEAR SEMAPHORE:C144("$WriteFormsortPref")
							//Need to test if this is the current sort field
							//remember the sort field for the area?
							If ($_l_SortFieldNumber>0) & ($_l_TableNumber>0)
								If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#7) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#3) & (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)#30)
									FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; $_l_SortFieldNumber; $_l_TableNumber; ""; "")
								Else 
									If (Type:C295(Field:C253($_l_TableNumber; $_l_SortFieldNumber)->)=7)
										//FSetting_UpdateArray ($_t_CurrentDefinitionsName;$_l_SortDirection;-Abs($_l_Column);$_l_TableNumber;"";"")
										FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; -Abs:C99($_l_ColumnNumber); $_l_TableNumber; ""; "")
									End if 
									
								End if 
								//this was a test....
								//$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
								//If ($_l_SortDirection>0)
								//LISTBOX SORT COLUMNS($_Ptr_ListBoxArea->;$_l_ColumnNumber;>)
								//Else
								//LISTBOX SORT COLUMNS($_Ptr_ListBoxArea->;$_l_ColumnNumber;<)
								//End if
							End if 
						End if 
					End if 
				: ($_l_Event=On After Edit:K2:43)  //this is needed so we know is someone cut or pastes-make sure event is enabled-also the on losing focus-on losing focus reads this
					
					
					//if we did not have this then the on losing focus causes the code to run and this is too slow if the column was not modified
					LBI_bo_ColumnMod:=True:C214
					If (False:C215)
						If ($_l_AreaType<3)
							$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
							
							If (Count parameters:C259>=6)
								$_ti_TimeValue:=?00:00:00?
								$_d_ValueDate:=!00-00-00!
								$_bo_BooleanValue:=False:C215
								$_r_ValueReal:=0
								$_t_ValueString:=""
								LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
								If ($_l_ColumnNumber>0)
									$_bo_BooleanValue:=False:C215
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									If ($_ptr_ArrayReferences->{4}="2@")
										//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
									End if 
									If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))
										$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
										$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
										Case of 
											: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
												
												
												$_t_ValueString:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
												
												
												$_r_ValueReal:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Date array:K8:20)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->{$5}
											: ($_l_DataType=Boolean array:K8:21)
												
												
												$_bo_BooleanValue:=$_Ptr_ThisColumnArray->{$5}
										End case 
										
										
										EXECUTE METHOD:C1007($7)
										$_bo_noTab:=False:C215
										Case of 
											: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
												
												
												If ($_t_ValueString#"") & ($_Ptr_ThisColumnArray->{$5}="")
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18) | ($_l_DataType=LongInt array:K8:19)
												
												
												
												If ($_r_ValueReal#0) & ($_Ptr_ThisColumnArray->{$5}=0)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Date array:K8:20)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->{$_l_Row}
												If ($_d_ValueDate#!00-00-00!) & ($_Ptr_ThisColumnArray->{$5}=!00-00-00!)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Boolean array:K8:21)
												
												
												
										End case 
										
										If ($_bo_noTab=False:C215)
											$_bo_Set:=False:C215
											
											For ($_l_Index; $_l_ColumnNumber+1; Size of array:C274($_ptr_EnterabilityArray->))
												If ($_ptr_ArrayReferences->{4}="2@")
													//$_ptr_EnterabilityArray->{$_l_Index}:=False
												End if 
												If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
													$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
													EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
													$_bo_Set:=True:C214
													$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
												End if 
												
											End for 
											If (Not:C34($_bo_Set))
												LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
											End if 
										Else 
											$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
											EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
											
										End if   //`````
										
										
									End if 
								End if 
							End if 
						Else 
							If (Count parameters:C259>=6)
								$_ti_TimeValue:=?00:00:00?
								$_d_ValueDate:=!00-00-00!
								$_bo_BooleanValue:=False:C215
								$_r_ValueReal:=0
								$_t_ValueString:=""
								$_bo_Initialized:=False:C215
								LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_ColumnNumber; $_l_Row)
								$_bo_BooleanValue:=False:C215
								If ($_l_ColumnNumber>0)
									$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
									If ($_ptr_ArrayReferences->{4}="2@")
										//$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False
									End if 
									If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))
										$_bo_Initialized:=True:C214
										$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
										$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
										Case of 
											: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
												
												
												$_t_ValueString:=$_Ptr_ThisColumnArray->
											: ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is longint:K8:6)
												
												
												$_r_ValueReal:=$_Ptr_ThisColumnArray->
											: ($_l_DataType=Is date:K8:7)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->
											: ($_l_DataType=Is boolean:K8:9)
												
												
												$_bo_BooleanValue:=$_Ptr_ThisColumnArray->
											: ($_l_DataType=Is time:K8:8)
												
												
												$_ti_TimeValue:=$_Ptr_ThisColumnArray->
										End case 
										
									End if 
									
									EXECUTE METHOD:C1007($7)
									$_bo_noTab:=False:C215
									If ($_bo_Initialized)
										Case of 
											: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
												
												
												If ($_t_ValueString#"") & ($_Ptr_ThisColumnArray->="")
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is longint:K8:6)
												
												
												
												If ($_r_ValueReal#0) & ($_Ptr_ThisColumnArray->=0)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Is date:K8:7)
												
												
												$_d_ValueDate:=$_Ptr_ThisColumnArray->{$_l_Row}
												If ($_d_ValueDate#!00-00-00!) & ($_Ptr_ThisColumnArray->=!00-00-00!)
													$_bo_noTab:=True:C214
												End if 
											: ($_l_DataType=Is boolean:K8:9)
											: ($_l_DataType=Is time:K8:8)
												
												
												
												
												If ($_ti_TimeValue#?00:00:00?) & ($_Ptr_ThisColumnArray->=?00:00:00?)
													$_bo_noTab:=True:C214
												End if 
										End case 
										
										If ($_bo_noTab=False:C215)
											$_bo_Set:=False:C215
											
											For ($_l_Index; $_l_ColumnNumber+1; Size of array:C274($_ptr_EnterabilityArray->))
												If ($_ptr_ArrayReferences->{4}="2@")
													//$_ptr_EnterabilityArray->{$_l_Index}:=False
												End if 
												If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
													$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_Index}
													EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
													$_bo_Set:=True:C214
													$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
												End if 
												
											End for 
											If (Not:C34($_bo_Set))
												LISTBOX SELECT ROW:C912($_Ptr_ListBoxArea->; $5; 0)
											End if 
										Else 
											$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
											EDIT ITEM:C870($_Ptr_ThisColumnArray->; $5)
											
										End if 
									End if   //`````
									
									
								End if 
							End if 
						End if 
					End if 
				: ($_l_Event=On Drop:K2:12)
					
					
					While (Semaphore:C143("InitingDragArrays"))
						DelayTicks
					End while 
					If (Not:C34(<>LBI_bo_DrgArrays))
						ARRAY TEXT:C222(<>LBI_at_DropArea; 0)  //The area name we can drop onto
						ARRAY LONGINT:C221(<>LBI_al_DragProcess; 0)  //The process we can drag from
						ARRAY LONGINT:C221(<>LBI_al_DropProcess; 0)  //The area name we can drag from
						ARRAY TEXT:C222(<>LBI_at_DragArea; 0)  //The area name we can drag from
						ARRAY TEXT:C222(<>LBI_at_DragPair; 0)  // The matching pair name
						<>LBI_bo_DrgArrays:=True:C214
					End if 
					CLEAR SEMAPHORE:C144("InitingDragArrays")
					
					//Get the source of the drag.
					_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
					If ($_ptr_SourceObject=Self:C308) & ($_l_SourceProcess=Current process:C322)
						//Row drag and drop
						
						$_ptr_FieldNumbersRef:=$_ptr_ListboxSetup->{2}
						$_l_SortFieldNumber:=Field:C253($_ptr_FieldNumbersRef->{1})
						$_l_TableNumber:=Table:C252($_ptr_FieldNumbersRef->{1})
						If ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
							If ($_l_SourceRow>0)
								$_l_DropRow:=Drop position:C608
								If ($_l_AreaType<3)
									
								Else 
									If (Count parameters:C259>=6)
										$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
										If ($_bo_ReadOnly=False:C215)
											COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
											GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_SourceRow)
											[ORDER_ITEMS:25]Sort_Order:26:=$_l_DropRow
											AA_CheckUUID(Table:C252(->[ORDER_ITEMS:25]))
											
											SAVE RECORD:C53([ORDER_ITEMS:25])
											If ($_l_SourceRow>$_l_DropRow)
												For ($_l_Index2; $_l_DropRow; $_l_SourceRow)
													If ($_l_Index2#$_l_SourceRow)
														GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_Index2)
														[ORDER_ITEMS:25]Sort_Order:26:=[ORDER_ITEMS:25]Sort_Order:26+1
														AA_CheckUUID(Table:C252(->[ORDER_ITEMS:25]))
														
														SAVE RECORD:C53([ORDER_ITEMS:25])
													End if 
												End for 
												
											Else 
												For ($_l_Index2; $_l_SourceRow; $_l_DropRow)
													If ($_l_Index2#$_l_SourceRow)
														GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_Index2)
														[ORDER_ITEMS:25]Sort_Order:26:=[ORDER_ITEMS:25]Sort_Order:26-1
														AA_CheckUUID(Table:C252(->[ORDER_ITEMS:25]))
														
														SAVE RECORD:C53([ORDER_ITEMS:25])
													End if 
												End for 
												
											End if 
											//`````
											REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
											USE NAMED SELECTION:C332("$Temp")
											ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26)
											$_l_Element:=1
											$_bo_Changed:=False:C215
											For ($_l_Index2; 1; Records in selection:C76([ORDER_ITEMS:25]))
												If ([ORDER_ITEMS:25]Sort_Order:26#$_l_Element)
													$_bo_Changed:=True:C214
													[ORDER_ITEMS:25]Sort_Order:26:=$_l_Element
													AA_CheckUUID(Table:C252(->[ORDER_ITEMS:25]))
													
													SAVE RECORD:C53([ORDER_ITEMS:25])
												End if 
												$_l_Element:=$_l_Element+1
												NEXT RECORD:C51([ORDER_ITEMS:25])
												
											End for 
											If ($_bo_Changed)
												REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
												USE NAMED SELECTION:C332("$Temp")
												ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26)
											End if 
											
										End if 
									End if 
									
								End if 
							End if 
						End if 
					Else 
						$_bo_ValidDrop:=False:C215
						PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
						
						For ($_l_Index; 1; Size of array:C274(<>LBI_al_DragProcess))
							//we should find the source process if it valid
							If (<>LBI_al_DragProcess{$_l_Index}=$_l_UniqueProcessID)
								RESOLVE POINTER:C394($_ptr_SourceObject; $_t_SourceName; $_l_TableNumber; $_l_FieldNumber)
								If ($_t_SourceName=<>LBI_at_DragArea{$_l_Index})
									PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
									RESOLVE POINTER:C394($_Ptr_ListBoxArea; $_t_DestinationName; $_l_TableNumber; $_l_FieldNumber)
									If (<>LBI_al_DropProcess{$_l_Index}=$_l_UniqueProcessID) & (<>LBI_at_DropArea{$_l_Index}=$_t_DestinationName)
										//This is a matched pair
										$_bo_ValidDrop:=True:C214
										$_l_Index:=Size of array:C274(<>LBI_al_DragProcess)
									End if 
								End if 
							End if 
						End for 
						//Actually all the above is not needed if we sort out drop on all these areas, they would only need to check that area has the same name(like-to-like)
						
						If ($_bo_ValidDrop)
							If ($_l_SourceProcess>0)
								SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("DragCopy"))
								
								
								POST OUTSIDE CALL:C329($_l_SourceProcess)
							End if 
						End if 
					End if 
					
					
					
					
					
			End case 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("LBi_AreaScript"; $_t_oldMethodName)
