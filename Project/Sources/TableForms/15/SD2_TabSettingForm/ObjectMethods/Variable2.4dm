If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/11/2012 16:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionID;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_FormID;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD_al_TabIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD_at_ActionName;0)
	//ARRAY TEXT(SD2_at_DisplayedFormNames;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305($_bo_Save; SD_bo_TabitemsModified; SD2_bo_SaveWindow)
	C_LONGINT:C283($_l_Column; $_l_Delete; $_l_SizeofArray; $_l_TabIndex; CB_IncludeDocument; SD_l_CurrentTab)
	C_TEXT:C284($_t_oldMethodName; $_t_TabName; SD2_t_TabName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.Variable2"; Form event code:C388)
//first save any data in the action names
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
				For ($_l_TabIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
					SD2_al_TabIncludes{$_l_SizeofArray}{$_l_TabIndex}:=0
				End for 
				$_l_Column:=0
				For ($_l_TabIndex; 1; Size of array:C274(SD_al_ActionID))
					
					If (SD_al_ActionInclude{$_l_TabIndex}=1)
						$_l_Column:=$_l_Column+1
						If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
							INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_SizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray})+1; 1)
						End if 
						SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_TabIndex}
					End if 
				End for 
				If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
					$_l_Delete:=(Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))-$_l_Column
					DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_SizeofArray}; $_l_Column+1; $_l_Delete)
				End if 
			Else 
				DELETE FROM ARRAY:C228(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs); 1)
				DELETE FROM ARRAY:C228(SD_al_FormID; Size of array:C274(SD_al_FormID); 1)
				DELETE FROM ARRAY:C228(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames); 1)
				DELETE FROM ARRAY:C228(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes); 1)
				DELETE FROM ARRAY:C228(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes); 1)
			End if 
			
		: (SD_l_CurrentTab>0)
			//update the tab
			If (SD_bo_TabItemsModified)
				SD2_bo_SaveWindow:=True:C214
				$_l_SizeofArray:=SD_l_CurrentTab
				SD_al_DocIncludes{$_l_SizeofArray}:=CB_IncludeDocument
				For ($_l_TabIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
					SD2_al_TabIncludes{$_l_SizeofArray}{$_l_TabIndex}:=0
				End for 
				$_l_Column:=0
				For ($_l_TabIndex; 1; Size of array:C274(SD_al_ActionID))
					If (SD_al_ActionInclude{$_l_TabIndex}=1)
						$_l_Column:=$_l_Column+1
						If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
							INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_SizeofArray}; Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray})+1; 1)
						End if 
						SD2_al_TabIncludes{$_l_SizeofArray}{$_l_Column}:=SD_al_ActionID{$_l_TabIndex}
					End if 
				End for 
				If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))
					$_l_Delete:=(Size of array:C274(SD2_al_TabIncludes{$_l_SizeofArray}))-$_l_Column
					DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_SizeofArray}; $_l_Column+1; $_l_Delete)
				End if 
				SD_al_FormID{$_l_SizeofArray}:=SD_al_FormReferenceID{SD2_at_DisplayedFormNames}
				
				
			End if 
	End case 
	SD_l_CurrentTab:=0
	OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; False:C215)
	SD2_at_TabNames:=0
	CB_IncludeDocument:=0
	For ($_l_TabIndex; 1; Size of array:C274(SD_al_ActionInclude))
		SD_al_ActionInclude{$_l_TabIndex}:=0
	End for 
	
	
End if 

//Now add a new entry
$_t_TabName:=Gen_Request("Name this Tab"; "")
If (OK=1) & ($_t_TabName#"")
	
	INSERT IN ARRAY:C227(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames)+1; 1)
	INSERT IN ARRAY:C227(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes)+1; 1)
	INSERT IN ARRAY:C227(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes)+1; 1)
	INSERT IN ARRAY:C227(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs)+1; 1)
	INSERT IN ARRAY:C227(SD_al_FormID; Size of array:C274(SD_al_FormID)+1; 1)
	SD2_at_TabNames{Size of array:C274(SD2_at_TabNames)}:=$_t_TabName
	SD2_t_TabName:=$_t_TabName
	SD2_at_DisplayedFormNames:=0
	OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; True:C214)
	SD_l_CurrentTab:=-1
	CB_IncludeDocument:=0
	SD_bo_TabitemsModified:=False:C215
	SD2_at_TabNames:=Size of array:C274(SD2_at_TabNames)
	For ($_l_TabIndex; Size of array:C274(SD_al_ActionInclude); 1; -1)
		If (Length:C16(SD_at_ActionName{$_l_TabIndex})>0)  //NG modified May 2008 Error reported
			If (SD_at_ActionName{$_l_TabIndex}[[1]]=" ")
				DELETE FROM ARRAY:C228(SD_al_ActionID; $_l_TabIndex)
				DELETE FROM ARRAY:C228(SD_at_ActionName; $_l_TabIndex)
				DELETE FROM ARRAY:C228(SD_al_ActionInclude; $_l_TabIndex)
			End if 
		End if 
	End for 
	For ($_l_TabIndex; 1; Size of array:C274(SD_al_ActionInclude))
		SD_al_ActionInclude{$_l_TabIndex}:=0
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.Variable2"; $_t_oldMethodName)
