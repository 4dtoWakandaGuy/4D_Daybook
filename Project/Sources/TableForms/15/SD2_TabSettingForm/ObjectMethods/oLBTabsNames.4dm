If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.oLBTabsNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_ActionInclude;0)
	//ARRAY BOOLEAN(SD2_Lb_TabNames;0)
	//ARRAY LONGINT(SD_al_ActionID;0)
	//ARRAY LONGINT(SD_al_ActionIDs;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_FormID;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD_al_TabIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD_at_ActionName;0)
	//ARRAY TEXT(SD2_at_AllActionNames;0)
	//ARRAY TEXT(SD2_at_DisplayedFormNames;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305($_bo_Save; SD_bo_TabitemsModified; SD2_bo_SaveWindow)
	C_LONGINT:C283($_l_ActionID; $_l_Column; $_l_Delete; $_l_event; $_l_FieldNumber; $_l_IDPosition; $_l_Index; $_l_SelectedRow; $_l_SizeofArray; $_l_TableNumber; CB_IncludeDocument)
	C_LONGINT:C283(SD_l_CurrentTab)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SD2_t_TabName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.oLBTabsNames"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			$_l_Column:=LB_GetColumn(->SD2_Lb_TabNames; $_t_VariableName)
			Case of 
				: ($_l_Column=1) | ($_l_Column=2)
					If (SD_l_CurrentTab#0)
						Case of 
							: (SD_l_CurrentTab<0)
								//It is a new tab
								If (SD_bo_TabitemsModified)
									$_bo_Save:=True:C214
								Else 
									$_bo_Save:=False:C215
									Gen_Confirm("You did not set any actions/groups to be included in this Tab("+SD2_t_TabName+")"; "Cancel"; "Save")
									If (OK=0)
										$_bo_Save:=True:C214
									End if 
								End if 
								If ($_bo_Save)
									SD2_bo_SaveWindow:=True:C214
									$_l_SizeofArray:=Size of array:C274(SD2_al_TabIncludes)
									
									SD_al_DocIncludes{$_l_SizeofArray}:=CB_IncludeDocument
									For ($_l_Index; 1; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
										SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Index}:=0
									End for 
									$_l_Column:=0
									For ($_l_Index; 1; Size of array:C274(SD_al_ActionID))
										
										If (SD_al_ActionInclude{$_l_Index}=1)
											$_l_Column:=$_l_Column+1
											If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
												INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_SizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray})+1; 1)
											End if 
											SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_Index}
										End if 
									End for 
									If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
										$_l_Delete:=(Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))-$_l_Column
										DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_SizeofArray}; $_l_Column+1; $_l_Delete)
									End if 
									SD_al_FormID{$_l_SizeofArray}:=SD_al_FormReferenceID{SD2_at_DisplayedFormNames}
									
								Else 
									DELETE FROM ARRAY:C228(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs); 1)
									DELETE FROM ARRAY:C228(SD_al_FormID; Size of array:C274(SD_al_FormID); 1)
									DELETE FROM ARRAY:C228(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames); 1)
									DELETE FROM ARRAY:C228(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes); 1)
									DELETE FROM ARRAY:C228(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes); 1)
									$_l_SelectedRow:=$_l_SelectedRow-1
								End if 
								
							: (SD_l_CurrentTab>0)
								//update the tab
								If (SD_bo_TabItemsModified)
									SD2_bo_SaveWindow:=True:C214
									$_l_SizeofArray:=SD_l_CurrentTab
									SD_al_DocIncludes{$_l_SizeofArray}:=CB_IncludeDocument
									For ($_l_Index; 1; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
										SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Index}:=0
									End for 
									$_l_Column:=0
									For ($_l_Index; 1; Size of array:C274(SD_al_ActionID))
										If (SD_al_ActionInclude{$_l_Index}=1)
											$_l_Column:=$_l_Column+1
											If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
												INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_SizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray})+1; 1)
											End if 
											SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_Index}
										End if 
									End for 
									If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
										$_l_Delete:=(Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))-$_l_Column
										DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_SizeofArray}; $_l_Column+1; $_l_Delete)
									End if 
									
									SD_al_FormID{SD_l_CurrentTab}:=SD_al_FormReferenceID{SD2_at_DisplayedFormNames}
									
									
								End if 
						End case 
						SD_l_CurrentTab:=0
						OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; False:C215)
						SD2_t_TabName:=""
						CB_IncludeDocument:=0
						For ($_l_Index; 1; Size of array:C274(SD_al_ActionInclude))
							SD_al_ActionInclude{$_l_Index}:=0
							SD_abo_ActionInclude{$_l_Index}:=False:C215
						End for 
						
						
					End if 
					
					If ($_l_SelectedRow>0)
						
						
						SD2_t_TabName:=SD2_at_TabNames{$_l_SelectedRow}
						OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; True:C214)
						SD_l_CurrentTab:=$_l_SelectedRow
						$_l_IDPosition:=$_l_SelectedRow
						CB_IncludeDocument:=SD_al_DocIncludes{$_l_SelectedRow}
						If (SD_al_FormID{$_l_SelectedRow}>0)
							SD2_at_DisplayedFormNames:=Find in array:C230(SD_al_FormReferenceID; SD_al_FormID{$_l_SelectedRow})
						Else 
							SD2_at_DisplayedFormNames:=0
						End if 
						
						If (Size of array:C274(SD2_al_TabIncludes{$_l_SelectedRow})=0)
							//all diary types
							For ($_l_Index; 1; Size of array:C274(SD_al_ActionInclude))
								SD_al_ActionInclude{$_l_Index}:=1
								SD_abo_ActionInclude{$_l_Index}:=True:C214
							End for 
						Else 
							
							For ($_l_Index; 1; Size of array:C274(SD2_al_TabIncludes{SD_l_CurrentTab}))
								$_l_ActionID:=SD2_al_TabIncludes{SD_l_CurrentTab}{$_l_Index}
								If ($_l_ActionID<0)  //group
									$_l_IDPosition:=Find in array:C230(SD_al_ActionID; $_l_ActionID)
									If ($_l_IDPosition>0)
										//it should be!
										SD_al_ActionInclude{$_l_Index}:=1
										SD_abo_ActionInclude{$_l_Index}:=True:C214
									Else 
										//Add the group and take off the group items
									End if 
									
								Else 
									If ($_l_ActionID>0)
										$_l_IDPosition:=Find in array:C230(SD_al_ActionID; $_l_ActionID)
										If ($_l_IDPosition>0)
											//it should be!
											SD_al_ActionInclude{$_l_IDPosition}:=1
											SD_abo_ActionInclude{$_l_Index}:=True:C214
											// and if it is not then it is in a group so not displayed in which case....
										Else 
											$_l_IDPosition:=Find in array:C230(SD_al_ActionIDs; $_l_ActionID)
											If ($_l_IDPosition>0)
												INSERT IN ARRAY:C227(SD_at_ActionName; Size of array:C274(SD_at_ActionName)+1; 1)
												INSERT IN ARRAY:C227(SD_al_ActionID; Size of array:C274(SD_at_ActionName)+1; 1)
												INSERT IN ARRAY:C227(SD_al_ActionInclude; Size of array:C274(SD_at_ActionName)+1; 1)
												INSERT IN ARRAY:C227(SD_abo_ActionInclude; Size of array:C274(SD_at_ActionName)+1; 1)
												
												SD_al_ActionID{Size of array:C274(SD_al_ActionID)}:=$_l_ActionID
												SD_at_ActionName{Size of array:C274(SD_at_ActionName)}:="("+SD2_at_AllActionNames{$_l_IDPosition}+")"
												SD_al_ActionInclude{Size of array:C274(SD_al_ActionInclude)}:=1
												SD_abo_ActionInclude{Size of array:C274(SD_abo_ActionInclude)}:=True:C214
											End if 
											
										End if 
										
										
										//Item
									End if 
								End if 
								
							End for 
							
						End if 
					End if 
			End case 
			
		Else 
			LISTBOX SELECT ROW:C912(SD2_Lb_TabNames; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.oLBTabsNames"; $_t_oldMethodName)
