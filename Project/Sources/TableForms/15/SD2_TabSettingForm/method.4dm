If (False:C215)
	//Table Form Method Name: [USER]SD2_TabSettingForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_ActionInclude;0)
	//ARRAY BOOLEAN(SD2_aBo_TabModified;0)
	//ARRAY BOOLEAN(SD2_Lb_IncludedActions;0)
	//ARRAY BOOLEAN(SD2_Lb_TabNames;0)
	//ARRAY LONGINT(SD_al_ActionID;0)
	//ARRAY LONGINT(SD_al_ActionIDs;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY LONGINT(SD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_FormID;0)
	//ARRAY LONGINT(SD_al_TabIDs;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0;0)
	//ARRAY TEXT(SD_at_ActionName;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionGroupNames;0)
	//ARRAY TEXT(SD2_at_AllActionNames;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305($_bo_IsInaGroup; DB_bo_NoLoad; SD_bo_TabItemsModified; SD2_bo_SaveWindow)
	C_LONGINT:C283($_l_ActionGroupIDSIndex; $_l_ActionID; $_l_ActionIDSIndex; $_l_Column; $_l_CurrentRow; $_l_DeleteRows; $_l_event; $_l_GroupIDRow; $_l_TabIncludesRow; $_l_TabRow; AI2_l_BUT1)
	C_LONGINT:C283(AI2_l_But2; AI2_l_BUT3; AI2_l_BUT4; AI2_l_BUT5; AI2_l_BUT6; AI2_l_BUT7; AI2_l_BUT8; AI2_l_BUT9; CB_IncludeDocument; SD_l_CurrentTab; SD_l_CurrentTable)
	C_LONGINT:C283(TC2_l_BUT1; TC2_l_But2; TC2_l_BUT3; TC2_l_BUT4; TC2_l_BUT5; TC2_l_BUT6; TC2_l_BUT7; TC2_l_BUT8; TC2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; AI2_t_COL1; AI2_t_COL2; AI2_t_COL3; AI2_t_COL4; AI2_t_COL5; AI2_t_COL6; AI2_t_COL7; AI2_t_COL8; AI2_t_COL9; AI2_t_HED1)
	C_TEXT:C284(AI2_t_HED2; AI2_t_HED3; AI2_t_HED4; AI2_t_HED5; AI2_t_HED6; AI2_t_HED7; AI2_t_HED8; AI2_t_HED9; SD_t_ContextName; SD_t_TabName; SD2_t_TabName)
	C_TEXT:C284(TC2_t_COL1; TC2_t_COL2; TC2_t_COL3; TC2_t_COL4; TC2_t_COL5; TC2_t_COL6; TC2_t_COL7; TC2_t_COL8; TC2_t_COL9; TC2_t_HED1; TC2_t_HED2)
	C_TEXT:C284(TC2_t_HED3; TC2_t_HED4; TC2_t_HED5; TC2_t_HED6; TC2_t_HED7; TC2_t_HED8; TC2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_TabSettingForm"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SD2_TabSettingForm")
		
		ARRAY TEXT:C222(SD2_at_TabNames; 0)
		ARRAY LONGINT:C221(SD2_al_TabIncludes; 0; 0)
		ARRAY LONGINT:C221(SD_al_DocIncludes; 0)
		ARRAY BOOLEAN:C223(SD2_aBo_TabModified; 0)
		ARRAY LONGINT:C221(SD_al_ActionInclude; 0)
		ARRAY BOOLEAN:C223(SD_abo_ActionInclude; 0)
		ARRAY TEXT:C222(SD_at_ActionName; 0)
		ARRAY LONGINT:C221(SD_al_ActionID; 0)
		ARRAY LONGINT:C221(SD_al_TabIDs; 0)
		ARRAY LONGINT:C221(SD_al_FormID; 0)
		SD2_bo_SaveWindow:=False:C215
		//NG Modifying this April 2007-we need the default form to use for this tab
		SD2_LoadTabSetting(True:C214; SD_l_CurrentTable; ->SD2_at_TabNames; ->SD2_al_TabIncludes; ->SD_al_DocIncludes; ->SD_al_TabIDs; ->SD_al_FormID)
		ARRAY BOOLEAN:C223(SD2_aBo_TabModified; Size of array:C274(SD_al_DocIncludes))
		SD2_LoadActionGroups
		
		SD2_loadFormNames
		
		READ ONLY:C145([ACTIONS:13])
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=0)
		If (Records in selection:C76([ACTIONS:13])>0)
			READ WRITE:C146([ACTIONS:13])
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=0)
			APPLY TO SELECTION:C70([ACTIONS:13]; [ACTIONS:13]xID:12:=0)
			UNLOAD RECORD:C212([ACTIONS:13])
			READ ONLY:C145([ACTIONS:13])
		End if 
		ALL RECORDS:C47([ACTIONS:13])
		
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_AllActionNames; [ACTIONS:13]xID:12; SD_al_ActionIDs)
		SORT ARRAY:C229(SD2_at_AllActionNames; SD2_at_ActionCodes; SD_al_ActionIDs)
		ARRAY TEXT:C222(SD_at_ActionName; Size of array:C274(SD2_al_ActionGroupIDs)+Size of array:C274(SD_al_ActionIDs))
		
		ARRAY LONGINT:C221(SD_al_ActionID; Size of array:C274(SD2_al_ActionGroupIDs)+Size of array:C274(SD_al_ActionIDs))
		$_l_CurrentRow:=0
		For ($_l_ActionIDSIndex; 1; Size of array:C274(SD2_al_ActionGroupIDs))
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD_at_ActionName{$_l_CurrentRow}:="•"+SD2_at_ActionGroupNames{$_l_ActionIDSIndex}
			SD_al_ActionID{$_l_CurrentRow}:=-SD2_al_ActionGroupIDs{$_l_ActionIDSIndex}
		End for 
		For ($_l_ActionIDSIndex; 1; Size of array:C274(SD_al_ActionIDs))  //only add if not in a group
			$_bo_IsInaGroup:=False:C215
			For ($_l_ActionGroupIDSIndex; 1; Size of array:C274(SD2_al_ActionGroupIDs))
				$_l_TabIncludesRow:=Find in array:C230(SD2_al_TabIncludes{$_l_ActionGroupIDSIndex}; SD_al_ActionIDs{$_l_ActionIDSIndex})
				If ($_l_TabIncludesRow>0)
					$_bo_IsInaGroup:=True:C214
					$_l_ActionGroupIDSIndex:=999999
				End if 
			End for 
			If (Not:C34($_bo_IsInaGroup))
				$_l_CurrentRow:=$_l_CurrentRow+1
				SD_at_ActionName{$_l_CurrentRow}:=SD2_at_AllActionNames{$_l_ActionIDSIndex}
				SD_al_ActionID{$_l_CurrentRow}:=SD_al_ActionIDs{$_l_ActionIDSIndex}
			End if 
		End for 
		ARRAY TEXT:C222(SD_at_ActionName; $_l_CurrentRow)
		ARRAY LONGINT:C221(SD_al_ActionID; $_l_CurrentRow)
		ARRAY LONGINT:C221(SD_al_ActionInclude; $_l_CurrentRow)
		ARRAY BOOLEAN:C223(SD_abo_ActionInclude; $_l_CurrentRow)
		If (Is table number valid:C999(SD_l_CurrentTable))
			SD_t_ContextName:=Table name:C256(Table:C252(SD_l_CurrentTable))
			OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; False:C215)
			SD_l_CurrentTab:=0
			If (Size of array:C274(SD2_at_TabNames)=0)
				INSERT IN ARRAY:C227(SD_al_TabIDs; Size of array:C274(SD_al_TabIDs)+1; 1)
				INSERT IN ARRAY:C227(SD_al_FormID; Size of array:C274(SD_al_FormID)+1; 1)
				INSERT IN ARRAY:C227(SD2_at_TabNames; Size of array:C274(SD2_at_TabNames)+1; 1)
				INSERT IN ARRAY:C227(SD2_al_TabIncludes; Size of array:C274(SD2_al_TabIncludes)+1; 1)
				INSERT IN ARRAY:C227(SD_al_DocIncludes; Size of array:C274(SD_al_DocIncludes)+1; 1)
				SD2_at_TabNames{Size of array:C274(SD2_at_TabNames)}:="Diary"
				OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; True:C214)
				SD_l_CurrentTab:=-1
				CB_IncludeDocument:=0
				SD_bo_TabitemsModified:=True:C214
				For ($_l_ActionIDSIndex; 1; Size of array:C274(SD_al_ActionInclude))
					SD_al_ActionInclude{$_l_ActionIDSIndex}:=1
					SD_abo_ActionInclude{$_l_ActionIDSIndex}:=True:C214
				End for 
				$_l_CurrentRow:=Size of array:C274(SD2_al_TabIncludes)
				For ($_l_ActionIDSIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_CurrentRow}))
					SD2_al_TabIncludes{$_l_CurrentRow}{$_l_ActionIDSIndex}:=0
				End for 
				$_l_Column:=0
				For ($_l_ActionIDSIndex; 1; Size of array:C274(SD_al_ActionID))
					If (SD_al_ActionInclude{$_l_ActionIDSIndex}=1)
						$_l_Column:=$_l_Column+1
						If ($_l_Column>Size of array:C274(SD2_al_TabIncludes{$_l_CurrentRow}))
							INSERT IN ARRAY:C227(SD2_al_TabIncludes{$_l_CurrentRow}; Size of array:C274(SD2_al_TabIncludes{$_l_CurrentRow})+1; 1)
						End if 
						SD2_al_TabIncludes{$_l_CurrentRow}{$_l_Column}:=SD_al_ActionID{$_l_ActionIDSIndex}
					End if 
				End for 
				If ($_l_Column<Size of array:C274(SD2_al_TabIncludes{$_l_CurrentRow}))
					$_l_DeleteRows:=(Size of array:C274(SD2_al_TabIncludes{$_l_CurrentRow}))-$_l_Column
					DELETE FROM ARRAY:C228(SD2_al_TabIncludes{$_l_CurrentRow}; $_l_Column+1; $_l_DeleteRows)
				End if 
				SD_l_CurrentTab:=1
			End if 
		End if 
		If (Size of array:C274(SD2_at_TabNames)=1)
			SD_t_TabName:=SD2_at_TabNames{1}
			OBJECT SET VISIBLE:C603(*; "oLabelTabIncludes"; True:C214)
			SD_l_CurrentTab:=1
			$_l_TabRow:=1
			CB_IncludeDocument:=SD_al_DocIncludes{1}
			If (Size of array:C274(SD2_al_TabIncludes{$_l_TabRow})=0)
				//all diary types
				For ($_l_ActionIDSIndex; 1; Size of array:C274(SD_al_ActionInclude))
					SD_al_ActionInclude{$_l_ActionIDSIndex}:=1
					SD_abo_ActionInclude{$_l_ActionIDSIndex}:=True:C214
				End for 
			Else 
				
				For ($_l_ActionIDSIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_TabRow}))
					$_l_ActionID:=SD2_al_TabIncludes{$_l_TabRow}{$_l_ActionIDSIndex}
					If ($_l_ActionID<0)  //group
						$_l_GroupIDRow:=Find in array:C230(SD_al_ActionID; $_l_ActionID)
						If ($_l_GroupIDRow>0)
							//it should be!
							SD_al_ActionInclude{$_l_ActionIDSIndex}:=1
							SD_abo_ActionInclude{$_l_ActionIDSIndex}:=True:C214
						Else 
							
						End if 
						
					Else 
						If ($_l_ActionID>0)
							$_l_GroupIDRow:=Find in array:C230(SD_al_ActionID; $_l_ActionID)
							If ($_l_GroupIDRow>0)
								//it should be!
								SD_al_ActionInclude{$_l_ActionIDSIndex}:=1
								SD_abo_ActionInclude{$_l_ActionIDSIndex}:=True:C214
								// and if it is not then it is in a group so not displaye in which case....
							Else 
								$_l_GroupIDRow:=Find in array:C230(SD_al_ActionIDs; $_l_ActionID)
								If ($_l_GroupIDRow>0)
									INSERT IN ARRAY:C227(SD_at_ActionName; Size of array:C274(SD_at_ActionName)+1; 1)
									INSERT IN ARRAY:C227(SD_al_ActionID; Size of array:C274(SD_at_ActionName)+1; 1)
									INSERT IN ARRAY:C227(SD_al_ActionInclude; Size of array:C274(SD_at_ActionName)+1; 1)
									INSERT IN ARRAY:C227(SD_abo_ActionInclude; Size of array:C274(SD_abo_ActionInclude)+1; 1)
									SD_al_ActionID{Size of array:C274(SD_al_ActionID)}:=$_l_ActionID
									SD_at_ActionName{Size of array:C274(SD_at_ActionName)}:="("+SD2_at_AllActionNames{$_l_TabRow}+")"
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
		
		
		//```
		
		
		LB_SetupListbox(->SD2_Lb_IncludedActions; "AI2_t"; "AI2_L"; 1; ->SD_al_ActionInclude; ->SD_abo_ActionInclude; ->SD_at_ActionName; ->SD_al_ActionID)
		LB_SetColumnHeaders(->SD2_Lb_IncludedActions; "AI2_L"; 1; ""; "Include"; "Action")
		LB_SetColumnWidths(->SD2_Lb_IncludedActions; "AI2_t"; 1; 0; 18; 281; 0)
		LB_SetEnterable(->SD2_Lb_IncludedActions; False:C215; 0)
		LB_StyleSettings(->SD2_Lb_IncludedActions; "Black"; 9; "AI2_t"; ->[DIARY:12])
		LB_SetupListbox(->SD2_Lb_TabNames; "TC2_t"; "TC2_L"; 1; ->SD2_at_TabNames)
		LB_SetColumnHeaders(->SD2_Lb_TabNames; "TC2_L"; 1; "Tab Title")
		LB_SetColumnWidths(->SD2_Lb_TabNames; "TC2_t"; 1; 225)
		
		LB_SetEnterable(->SD2_Lb_TabNames; False:C215; 0)
		LB_StyleSettings(->SD2_Lb_TabNames; "Black"; 9; "TC2_t"; ->[DIARY:12])
		INT_SetLongintCheckFormat(->SD_al_ActionInclude)
		WS_AutoscreenSize(3; 400; 650)
		
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM:SD2_TabSettingForm"; $_t_oldMethodName)
