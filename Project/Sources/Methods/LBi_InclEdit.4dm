//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	C_BOOLEAN:C305($_bo_FromIn; $_bo_NewProcess; $_bo_Save; $2; LB_bo_RefreshLineItems; VfromIn)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_FieldNumber; $_l_FirstLine; $_l_KeyPosition; $_l_NewProcess; $_l_Process; $_l_RecordNumber; $_l_RecordsInSelection; $_l_Row; $_l_SizeofArray)
	C_LONGINT:C283($_l_SortFieldWas; $_l_SortOrderWas; $_l_SortTableWas; $_l_TableNumber; DB_l_ButtonClickedFunction; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_HighlightSet; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_REAL:C285($4)
	C_TEXT:C284($_t_FieldName; $_t_FormName; $_t_HighlightSetName; $_t_oldMethodName; $_t_ParentRecordCode; $_t_RecordCode; $_t_TableName; $_t_TableNumberSTR; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclEdit")

//NG 20/07/06 THis method is a replacemnent for ALincledit

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclEdit")
//ALInclEdit - key field method/subfile no
//$1 - Ptr to array of ptrs

If (Count parameters:C259>=2)
	$_bo_NewProcess:=$2
Else 
	$_bo_NewProcess:=False:C215
End if 
If (Count parameters:C259>=3)
	$_t_ParentRecordCode:=$3
Else 
	$_t_ParentRecordCode:=""
End if 

If (Size of array:C274($1->)>0)
	$_Ptr_ListBox:=$1->{1}
	
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	$_ptr_ArrayReferences:=$1->{9}
	If (Size of array:C274($1->)>=19)
		$_ptr_areaTypeVariable:=$1->{19}
		$_l_AreaType:=$_ptr_areaTypeVariable->
	Else 
		$_l_AreaType:=1
	End if 
	If (Size of array:C274($1->)>=20)
		$_ptr_HighlightSet:=$1->{20}
		$_t_HighlightSetName:=$_ptr_HighlightSet->
	Else 
		$_t_HighlightSetName:=""
	End if 
	LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
	
	If ($_ptr_ArrayReferences->{5}#"")
		If ($_ptr_ArrayReferences->{8}="")
			If ($_l_AreaType#3)
				//$_l_FirstLine:=AL_GetLine ($_Ptr_ListBox»)
				//ARRAY INTEGER(LB_aI_Lines;0)
				//LB_GetCurrentRows($_Ptr_ListBox->;->LB_aI_Lines)
				
				ARRAY LONGINT:C221($_al_SelectedLines; 0)
				LB_GetSelect($_Ptr_ListBox; ->$_al_SelectedLines)
				
				$_l_SizeofArray:=Size of array:C274($_al_SelectedLines)
				If ($_l_SizeofArray=0)
					
					If ($_l_Row>0)
						ARRAY LONGINT:C221($_al_SelectedLines; 1)
						$_al_SelectedLines{1}:=$_l_Row
						$_l_SizeofArray:=1
					End if 
				End if 
				
				
				If ($_l_SizeofArray>0)
					$_l_FirstLine:=$_al_SelectedLines{1}
					$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
					If ($_l_KeyPosition>0)
						//$PaddF:=$1->{2}
						$_ptr_ArrayofArrayPointers:=$1->{3}
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
						
						Case of 
								
							: ($_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_FirstLine})
								$_t_TableNumberSTR:=String:C10(Table:C252($_ptr_LBTable))
								CREATE SET:C116($_ptr_LBTable->; "$Returnselection"+$_t_TableNumberSTR)
								DB_SaveRecord($_ptr_LBTable)
								$_l_RecordNumber:=Record number:C243($_ptr_LBTable->)
								
								If ($_bo_NewProcess)
									UNLOAD RECORD:C212($_ptr_LBTable->)
									//  $RecordIdent:=$_Ptr_ThisColumnArray->{$_l_FirstLine}
								Else 
									If (Read only state:C362($_ptr_LBTable->))
										READ WRITE:C146($_ptr_LBTable->)
									End if 
									ONE RECORD SELECT:C189($_ptr_LBTable->)
								End if 
								// : (Type($_Ptr_ThisColumnArray->{$_l_FirstLine})="")
							Else 
								$_bo_Save:=True:C214
								Case of 
									: (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is real:K8:4)
										$_t_RecordCode:=String:C10($_Ptr_ThisColumnArray->{$_l_FirstLine})
										If ($_Ptr_ThisColumnArray->{$_l_FirstLine}=0)
											$_t_FieldName:=Field name:C257($_Ptr_KeyField)
											ALERT:C41("The Field "+$_t_FieldName+" is empty")
											$_bo_Save:=False:C215
										Else 
											If ($_Ptr_KeyField->#$_Ptr_ThisColumnArray->{$_l_FirstLine})
												//$_bo_Save:=False
											End if 
										End if 
									: (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is date:K8:7)
										$_t_RecordCode:=String:C10($_Ptr_ThisColumnArray->{$_l_FirstLine})
										If ($_Ptr_ThisColumnArray->{$_l_FirstLine}=!00-00-00!)
											$_t_FieldName:=Field name:C257($_Ptr_KeyField)
											ALERT:C41("The Field "+$_t_FieldName+" is empty")
											$_bo_Save:=False:C215
										Else 
											If ($_Ptr_KeyField->#$_Ptr_ThisColumnArray->{$_l_FirstLine})
												//$_bo_Save:=False
											End if 
										End if 
									: (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=Is text:K8:3)
										$_t_RecordCode:=$_Ptr_ThisColumnArray->{$_l_FirstLine}
										If ($_Ptr_ThisColumnArray->{$_l_FirstLine}="")
											$_t_FieldName:=Field name:C257($_Ptr_KeyField)
											ALERT:C41("The Field "+$_t_FieldName+" is empty")
											$_bo_Save:=False:C215
										Else 
											If ($_Ptr_KeyField->#$_Ptr_ThisColumnArray->{$_l_FirstLine})
												//$_bo_Save:=False
											End if 
										End if 
								End case 
								$_t_TableNumberSTR:=String:C10(Table:C252($_ptr_LBTable))
								If (Records in selection:C76($_ptr_LBTable->)>0)
									CREATE SET:C116($_ptr_LBTable->; "$Returnselection"+$_t_TableNumberSTR)
								Else 
									CREATE EMPTY SET:C140($_ptr_LBTable->; "$Returnselection"+$_t_TableNumberSTR)
								End if 
								If ($_bo_NewProcess)
									If ($_bo_Save)
										READ WRITE:C146($_ptr_LBTable->)
										QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_FirstLine})
										$_l_RecordNumber:=Record number:C243($_ptr_LBTable->)
										If ($_t_RecordCode="")
											Case of 
												: (Type:C295($_Ptr_ThisColumnArray->{$_l_FirstLine})=24)
													$_t_RecordCode:=$_Ptr_ThisColumnArray->{$_l_FirstLine}
											End case 
										End if 
										
										UNLOAD RECORD:C212($_ptr_LBTable->)
									End if 
								Else 
									If ($_bo_Save)
										If (Record number:C243($_ptr_LBTable->)#-1)  //no record loaded!
											DB_SaveRecord($_ptr_LBTable)
										End if 
									End if 
									READ WRITE:C146($_ptr_LBTable->)
									$_t_TableNumberSTR:=String:C10(Table:C252($_ptr_LBTable))
									CREATE SET:C116($_ptr_LBTable->; "$Returnselection"+$_t_TableNumberSTR)
									QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_FirstLine})
									
								End if 
						End case 
						If ($_bo_NewProcess)
							
							//the astix stops a second process being created for the same record
							$_l_TableNumber:=Table:C252($_ptr_LBTable)
							$_l_FieldNumber:=Field:C253($_Ptr_KeyField)
							$_t_FormName:=$_ptr_ArrayReferences->{5}
							$_l_Process:=Current process:C322
							//dont launch a second instance of the same record
							UNLOAD RECORD:C212($_ptr_LBTable->)
							READ ONLY:C145($_ptr_LBTable->)
							$_l_NewProcess:=New process:C317("LBi_InclEdit_InProcess"; 512000; "Edit "+(Table name:C256($_ptr_LBTable))+" "+$_t_RecordCode; $_l_TableNumber; $_l_FieldNumber; $_t_FormName; $_l_RecordNumber; $_l_Process; $_t_ParentRecordCode; *)
							SHOW PROCESS:C325($_l_NewProcess)
							BRING TO FRONT:C326($_l_NewProcess)
							//```
							$_t_TableNumberSTR:=String:C10(Table:C252($_ptr_LBTable))
							USE SET:C118("$Returnselection"+$_t_TableNumberSTR)
							CLEAR SET:C117("$Returnselection"+$_t_TableNumberSTR)
						Else 
							//TRACE
							
							FORM SET INPUT:C55($_ptr_LBTable->; $_ptr_ArrayReferences->{5})
							$_l_RecordsInSelection:=Records in selection:C76($_ptr_LBTable->)
							Case of 
								: ($_l_RecordsInSelection=1)  //one record
									//  If ($5)
									//NG AUgust 2008 when we open another window these values will get changed
									$_l_SortFieldWas:=FS_l_SortFieldNUM
									$_l_SortTableWas:=FS_l_SortTableNUM
									$_l_SortOrderWas:=FS_l_SortDirection
									
									$_bo_FromIn:=VfromIn
									DBI_DisplayRecord(-Current process:C322; Table:C252($_ptr_LBTable); "")
									DB_l_ButtonClickedFunction:=DB_GetButtonFunction("MenuReset")
									POST OUTSIDE CALL:C329(Current process:C322)
									VfromIn:=$_bo_FromIn
									FS_l_SortFieldNUM:=$_l_SortFieldWas
									FS_l_SortTableNUM:=$_l_SortTableWas
									FS_l_SortDirection:=$_l_SortOrderWas
									
									
									If (Records in selection:C76($_ptr_LBTable->)=0)  //ie if the user deleted it in the main layout
										LBi_DeleteElem($1; $_l_FirstLine; 1)  //NB: check that the delete proc of the Item doesn'r resurrect a selection
										//AL_UpdateArrays ($_Ptr_ListBox->;-2)
									Else 
										
										
										If (OK=1)
											LBi_ArrUpdate($1; $_l_FirstLine; True:C214)
											LBi_LoadFtrs($1)
										End if 
										USE SET:C118("$Returnselection"+$_t_TableNumberSTR)
									End if 
									If ($_l_FirstLine<=Size of array:C274($_Ptr_ThisColumnArray->))
										If (<>LB_at_EditModes=1)
											LBi_SetSelect1($_Ptr_ListBox; $_l_FirstLine)
										Else 
											//NG TO do
											
										End if 
									End if 
									$_t_TableNumberSTR:=String:C10(Table:C252($_ptr_LBTable))
									USE SET:C118("$Returnselection"+$_t_TableNumberSTR)
									CLEAR SET:C117("$Returnselection"+$_t_TableNumberSTR)
								: ($_l_RecordsInSelection=0)
									Gen_Alert("That record has been deleted by another process or user("+$_Ptr_ThisColumnArray->{$_l_FirstLine}+")"; "Cancel")
									
								Else 
									Case of 
										: (Type:C295($_Ptr_ThisColumnArray->)=Integer array:K8:18) | (Type:C295($_Ptr_ThisColumnArray->)=LongInt array:K8:19) | (Type:C295($_Ptr_ThisColumnArray->)=Real array:K8:17)
											Gen_Alert("That record does not have a unique identifier("+String:C10($_Ptr_ThisColumnArray->{$_l_FirstLine})+")"; "Cancel")
										: (Type:C295($_Ptr_ThisColumnArray->)=String array:K8:15) | (Type:C295($_Ptr_ThisColumnArray->)=Text array:K8:16)
											Gen_Alert("That record does not have a unique identifier("+$_Ptr_ThisColumnArray->{$_l_FirstLine}+")"; "Cancel")
											
									End case 
							End case 
							UNLOAD RECORD:C212($_ptr_LBTable->)
						End if 
					End if 
					
					
				End if 
			Else 
				$_t_TableName:=Table name:C256($_ptr_LBTable)
				COPY NAMED SELECTION:C331($_ptr_LBTable->; "$tempSel"+$_t_TableName)
				CREATE SET:C116($_ptr_LBTable->; "$Temp"+$_t_TableName)
				
				USE SET:C118($_t_HighlightSetName)
				FIRST RECORD:C50($_ptr_LBTable->)
				If ($_bo_NewProcess)
					
					//the astix stops a second process being created for the same record
					$_l_TableNumber:=Table:C252($_ptr_LBTable)
					$_l_FieldNumber:=Field:C253($_Ptr_KeyField)
					$_t_FormName:=$_ptr_ArrayReferences->{5}
					$_l_Process:=Current process:C322
					$_l_RecordNumber:=Record number:C243($_ptr_LBTable->)
					//dont launch a second instance of the same record
					$_l_NewProcess:=New process:C317("LBi_InclEdit_InProcess"; 64000; "Edit "+(Table name:C256($_ptr_LBTable))+" "+$_t_RecordCode; $_l_TableNumber; $_l_FieldNumber; $_t_FormName; $_l_RecordNumber; $_l_Process; $_t_ParentRecordCode; *)
					SHOW PROCESS:C325($_l_NewProcess)
					BRING TO FRONT:C326($_l_NewProcess)
					//```
					If (Records in selection:C76($_ptr_LBTable->)=0)  //ie if the user deleted it in the main layout
						//LBi_DeleteElem ($1;$_l_FirstLine;1)  `NB: check that the delete proc of the Item doesn'r resurrect a selection
						//AL_UpdateArrays ($_Ptr_ListBox->;-2)
						USE NAMED SELECTION:C332("$tempSel"+$_t_TableName)
					Else 
						
						
						If (OK=1)
							//LBi_ArrUpdate ($1;$_l_FirstLine;True)
							LBi_LoadFtrs($1)
						End if 
						USE NAMED SELECTION:C332("$tempSel"+$_t_TableName)
						
					End if 
					
					//HIGHLIGHT RECORDS($_ptr_LBTable->;"$Temp"+$_t_TableName)
					//$_t_TableNumberSTR:=String(Table($_ptr_LBTable))
					//USE SET("$Returnselection"+$_t_TableNumberSTR)
					//CLEAR SET("$Returnselection"+$_t_TableNumberSTR)
				Else 
					FORM SET INPUT:C55($_ptr_LBTable->; $_ptr_ArrayReferences->{5})
					$_l_RecordsInSelection:=Records in selection:C76($_ptr_LBTable->)
					Case of 
						: ($_l_RecordsInSelection=1)  //one record
							//  If ($5)
							
							$_bo_FromIn:=vFromIn
							
							//NG AUgust 2008 when we open another window these values will get changed
							$_l_SortFieldWas:=FS_l_SortFieldNUM
							$_l_SortTableWas:=FS_l_SortTableNUM
							$_l_SortOrderWas:=FS_l_SortDirection
							DBI_DisplayRecord(-Current process:C322; Table:C252($_ptr_LBTable); "")
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("MenuReset")
							POST OUTSIDE CALL:C329(Current process:C322)
							
							vFromIn:=$_bo_FromIn
							FS_l_SortTableNUM:=$_l_SortTableWas
							FS_l_SortDirection:=$_l_SortOrderWas
							
							
							If (Records in selection:C76($_ptr_LBTable->)=0)  //ie if the user deleted it in the main layout
								//LBi_DeleteElem ($1;$_l_FirstLine;1)  `NB: check that the delete proc of the Item doesn'r resurrect a selection
								//AL_UpdateArrays ($_Ptr_ListBox->;-2)
								USE NAMED SELECTION:C332("$tempSel"+$_t_TableName)
							Else 
								
								
								If (OK=1)
									//LBi_ArrUpdate ($1;$_l_FirstLine;True)
									LBi_LoadFtrs($1)
								End if 
								USE NAMED SELECTION:C332("$tempSel"+$_t_TableName)
								
							End if 
							
							//HIGHLIGHT RECORDS($_ptr_LBTable->;"$Temp"+$_t_TableName)
							
							
							
							
							
					End case 
					UNLOAD RECORD:C212($_ptr_LBTable->)
				End if 
			End if 
			
			
		Else 
			//=subfile
			ARRAY LONGINT:C221($_al_SelectedLines; 0)
			ARRAY LONGINT:C221($_al_SelectedLines; 0)
			LB_GetSelect($_Ptr_ListBox; ->$_al_SelectedLines)
			
			$_l_SizeofArray:=Size of array:C274($_al_SelectedLines)
			If ($_l_SizeofArray=0)
				//NG todo-done to TEST
				If ($_l_Row>0)
					ARRAY LONGINT:C221($_al_SelectedLines; 1)
					$_al_SelectedLines{1}:=$_l_Row
					$_l_SizeofArray:=1
				End if 
			End if 
			If ($_l_SizeofArray>0)
				$_l_FirstLine:=$_al_SelectedLines{1}
				If (LBi_FindLine($1))
					//    If ($5)
					Open_Pro_Window("View "+$_ptr_ArrayReferences->{10})
					//`  End if
					_O_MODIFY SUBRECORD:C203($_Ptr_KeyField->; $_ptr_ArrayReferences->{5}; *)
					LB_bo_RefreshLineItems:=True:C214
					LBi_FindLineSub($1)
					
					//   If ($5)
					Close_ProWin
					//  End if
					If (OK=1)
						LBi_ArrUpdate($1; $_l_FirstLine; True:C214)
						LBi_LoadFtrs($1)
					End if 
					If (<>LB_at_EditModes=1)
						LBi_SetSelect1($_Ptr_ListBox; $_l_FirstLine)
					Else 
						//NG TODO
					End if 
				End if 
			End if 
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_InclEdit"; $_t_oldMethodName)