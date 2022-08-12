If (False:C215)
	//Table Form Method Name: [USER]WS_SetManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 08:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MCR_al_TableIDs;0)
	//ARRAY LONGINT(SM_al_SetClassID;0)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY LONGINT(WS_al_TableIDs;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(MCR_at_TableNames;0)
	//ARRAY TEXT(SM_at_PalleteTab;0)
	//ARRAY TEXT(SM_at_SetClass;0)
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	//ARRAY TEXT(WS_at_TableNames;0)
	C_BOOLEAN:C305(<>DB_bo_TableNamestatesLoaded; <>SM_isHidden; $_bo_Expanded; $_bo_SetExists; DB_bo_NoLoad; SM_ActionsDisplayed; SM_bo_Busy)
	C_LONGINT:C283(<>Bar; <>DB_at_TableNamesMacro; <>MENU_l_BarModule; <>MenuProc; $_l_CLassID; $_l_ContextID; $_l_CountListItems; $_l_event; $_l_Icon; $_l_Index; $_l_ItemReference)
	C_LONGINT:C283($_l_ItemReference2; $_l_ListItemRow; $_l_MonitorCall; $_l_ObjectRef2Bottom; $_l_ObjectRef2Left; $_l_ObjectRef2RIght; $_l_ObjectRef2Top; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SubListID)
	C_LONGINT:C283($_l_SublistID2; $_l_TableNumber; $_l_TabPosition; $_l_VirtualTableNumber; $_l_WindowBottom; $_l_WIndowCenterHorizontal; $_l_WIndowCenterVertical; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $bottomOBJREF)
	C_LONGINT:C283($RIGHTOBJREF; $TOPOBJREF; r1; r2; s1; s2; SM_HL_l_SETMANAGER; SM_l_CallBack; SM_l_ContextItemID; SM_l_MonitorCall; SM_l_ShowScripts)
	C_LONGINT:C283(SM_l_TableNumber; SM_l_UpdateOnCallBackID; SM_RB_1; SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5; SM_Recordsinselection; SM_SaveSelection; topOBJREF; WS_l_ContextID)
	C_LONGINT:C283(xCount; xNext; xPlus; xSelect)
	C_OBJECT:C1216($_obj_Fields)
	C_TEXT:C284($_t_CLass; $_t_ItemText; $_t_ItemText2; $_t_ListNameText; $_t_oldMethodName; SM_t_loadedsetName; SM_t_ScriptCode; SM_t_SetManagerRecords; SM_t_UseSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].WS_SetManager"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (<>MenuProc=0)
			<>MenuProc:=1
		End if 
		//If (Not(<>DB_bo_TableNamestatesLoaded))
		//Load_Fields
		//End if 
		$_obj_Fields:=New object:C1471("tableNames"; New collection:C1472; "tableNumbers"; New collection:C1472; "fieldNames"; New collection:C1472; "fieldNumbers"; New collection:C1472)
		Load_Fields($_obj_Fields)
		
		ARRAY TEXT:C222(WS_at_TableNames; 0)
		ARRAY LONGINT:C221(WS_al_TableIDs; 0)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNames; WS_at_TableNames)
		COLLECTION TO ARRAY:C1562($_obj_Fields.tableNumbers; WS_al_TableIDs)
		
		
		OpenHelp(Table:C252(->[USER:15]); "WS_SetManager")
		SM_bo_Busy:=True:C214
		
		ARRAY TEXT:C222(SM_at_PalleteTab; 1)
		SM_at_PalleteTab{1}:="Data Lists"
		//SET VISIBLE(SM_at_PalleteTab;False)  `Rollo 25/11/2004 - no, don't hide it - no need, and just looks odd
		
		SET WINDOW TITLE:C213("Data Lists")
		SM_ActionsDisplayed:=True:C214
		SM_ShowHideActions(False:C215)
		OBJECT SET ENABLED:C1123(SM_SaveSelection; False:C215)
		SM_SaveSelection:=0
		//Object Set Enabled(SM_RB_1;TRUE)
		//Object Set Enabled(SM_RB_2;FALSE)
		//Object Set Enabled(SM_RB_3;FALSE)
		//Object Set Enabled(SM_RB_4;FALSE)
		//Object Set Enabled(SM_RB_5;FALSE)
		OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
		OBJECT SET ENABLED:C1123(SM_RB_2; False:C215)
		OBJECT SET ENABLED:C1123(SM_RB_3; False:C215)
		OBJECT SET ENABLED:C1123(SM_RB_4; False:C215)
		OBJECT SET ENABLED:C1123(SM_RB_5; False:C215)
		OBJECT SET TITLE:C194(SM_RB_2; "Unite list & Current Selection")
		OBJECT SET TITLE:C194(SM_RB_3; "Intersect list & Current Selection")
		OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list")
		OBJECT SET TITLE:C194(SM_RB_5; "Remove list from Current Selection")
		OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
		OBJECT SET FONT STYLE:C166(SM_RB_1; _o_Condensed:K14:7)
		OBJECT SET FONT STYLE:C166(SM_RB_2; _o_Condensed:K14:7)
		OBJECT SET FONT STYLE:C166(SM_RB_3; _o_Condensed:K14:7)
		OBJECT SET FONT STYLE:C166(SM_RB_4; _o_Condensed:K14:7)
		OBJECT SET FONT STYLE:C166(SM_RB_5; _o_Condensed:K14:7)
		SM_RB_1:=0
		SM_RB_2:=0
		SM_RB_3:=0
		SM_RB_4:=0
		SM_RB_5:=0
		
		Case of 
			: (SM_l_TableNumber>0)
				// a table number is passed-make sure there is a context
				$_bo_SetExists:=False:C215
				For ($_l_Index; 1; Size of array:C274(SM_al_SetContextIDs))
					$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_Index})
					If ($_l_TableNumber=SM_l_TableNumber)
						$_bo_SetExists:=True:C214
						$_l_Index:=Size of array:C274(SM_al_SetContextIDs)
					End if 
				End for 
				If (Not:C34($_bo_SetExists))
					//no context already exists so add one
					$_l_VirtualTableNumber:=10000+SM_l_TableNumber
					//by definition this is correct
					If (Is table number valid:C999(SM_l_TableNumber))
						APPEND TO LIST:C376(SM_HL_l_SETMANAGER; Table name:C256(Table:C252(SM_l_TableNumber)); $_l_VirtualTableNumber; 0; False:C215)
						SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_VirtualTableNumber; False:C215; Bold:K14:2; 0)
						// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
						SM_UpdateArrays("PER"; ""; 0; 0; Table name:C256(Table:C252(SM_l_TableNumber)); $_l_VirtualTableNumber)
					End if 
				End if 
			: (SM_l_ShowScripts>0)
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					//show macros page
					SET WINDOW TITLE:C213("Macros")
					//make sure the tabs are set up
					$_l_TabPosition:=Find in array:C230(SM_at_PalleteTab; "Macros")
					If ($_l_TabPosition<0)
						$_l_TabPosition:=Find in array:C230(SM_at_PalleteTab; "Scripts")
					End if 
					If ($_l_TabPosition<0) & (Size of array:C274(SM_at_PalleteTab)>0)
						INSERT IN ARRAY:C227(SM_at_PalleteTab; Size of array:C274(SM_at_PalleteTab)+1; 1)
						SM_at_PalleteTab{Size of array:C274(SM_at_PalleteTab)}:="Scripts"
						SM_at_PalleteTab:=Size of array:C274(SM_at_PalleteTab)
						//SET VISIBLE(SM_at_PalleteTab;True)
						If ((r1=0) & (r2=0))
							If (Frontmost process:C327(*)=<>MenuProc)
								s2:=1
								r2:=1
							Else 
								s1:=1
								r1:=1
							End if 
						Else 
							s1:=r1
							s2:=r2
						End if 
						Record_BarSrch
						
						Array_CopyFiles
						INSERT IN ARRAY:C227(GEN_at_Identity; 1; 1)
						GEN_at_Identity{1}:="Unspecified"
						GEN_at_Identity:=<>DB_at_TableNamesMacro+1
						
						If ((DB_GetModuleSettingByNUM(Module_Macros))=3)
							//Object Set Enabled(xPlus;FALSE)
							//Object Set Enabled(xNext;FALSE)
							//Object Set Enabled(xSelect;FALSE)
							OBJECT SET ENABLED:C1123(xPlus; False:C215)
							OBJECT SET ENABLED:C1123(xNext; False:C215)
							OBJECT SET ENABLED:C1123(xSelect; False:C215)
							
						End if 
						If ((DB_GetModuleSettingByNUM(Module_Macros))>2)
							//Object Set Enabled(xCount;FALSE)
							OBJECT SET ENABLED:C1123(xCount; False:C215)
						End if 
						//````
					End if 
					SM_at_PalleteTab:=2
					FORM GOTO PAGE:C247(5)
				End if 
				
				SM_l_ShowScripts:=0
		End case 
		SM_bo_Busy:=False:C215
		INT_SetDialog
		
	: ($_l_event=On Resize:K2:27)
		SM_bo_Busy:=True:C214
		If (False:C215)
			//following is called to verify window sizing.
			//SM_ShowHideActions (SM_ActionsDisplayed)  `set it to current setting
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			// GET OBJECT RECT(Splitter_hide;$leftOBJREF;$topOBJREF;$rightOBJREF;$bottomOBJREF
			
			If (SM_ActionsDisplayed)
				// SM_SETOBJECTPOSITION ("Splitter1";$leftOBJREF;$_l_WindowBottom-133;$rightOBJREF;$_l_WindowBottom-
			Else 
				// SM_SETOBJECTPOSITION ("Splitter1";$leftOBJREF;$_l_WindowBottom-117;$rightOBJREF;$_l_WindowBottom-
			End if 
			//GET OBJECT RECT(Splitter_hide;$leftOBJREF;$topOBJREF;$rightOBJREF;$bottomOBJREF)
			//Variable1
			OBJECT GET COORDINATES:C663(*; "Variable1"; $_l_ObjectRef2Left; $_l_ObjectRef2Top; $_l_ObjectRef2RIght; $_l_ObjectRef2Bottom)
			// /SM_SETOBJECTPOSITION ("Variable1";$_l_ObjectRef2Left;$_l_ObjectRef2Top;$_l_ObjectRef2RIght;$topOBJREF-20)
			OBJECT GET COORDINATES:C663(*; "Variable7"; $_l_ObjectRef2Left; $_l_ObjectRef2Top; $_l_ObjectRef2RIght; $_l_ObjectRef2Bottom)
			//SM_SETOBJECTPOSITION ("Variable7";$_l_ObjectRef2Left;143;$_l_ObjectRef2RIght;156)
		End if 
		SM_bo_Busy:=False:C215
		INT_SetDialog
		
	: ($_l_event=On Outside Call:K2:11)
		SM_bo_Busy:=True:C214
		If (Not:C34(<>SM_isHidden))
			SHOW PROCESS:C325(Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		If (SM_l_ShowScripts>0)
			Case of 
				: (SM_l_ShowScripts=3)
					SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; Num:C11(SM_t_ScriptCode))
					$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
					GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
					$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
					//get the class
					// and then update it
					ARRAY TEXT:C222(SM_at_SetClass; 4)
					ARRAY LONGINT:C221(SM_al_SetClassID; 4)
					SM_at_SetClass{1}:="Fixed List"
					SM_at_SetClass{2}:="Dynamic List"
					SM_at_SetClass{3}:="Fixed List with Dynamic Query"
					SM_at_SetClass{4}:="Group"
					SM_al_SetClassID{1}:=853
					SM_al_SetClassID{2}:=854
					SM_al_SetClassID{3}:=852
					SM_al_SetClassID{4}:=855
					$_t_CLass:=SM_at_SetitemsClassName{$_l_ListItemRow}
					$_l_CLassID:=SM_al_SetitemsClassID{$_l_ListItemRow}
					Case of 
						: ($_l_CLassID=853)  //does not have a macro currently
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_ItemReference)
							If (Records in selection:C76([USER_SETS:105])>0)
								//has both
								SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; SM_al_SetContextItemContextID{$_l_ListItemRow}; ""; 0; SM_at_SetClass{3}; SM_al_SetClassID{3})
							Else 
								//has no list so
								SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; SM_al_SetContextItemContextID{$_l_ListItemRow}; ""; 0; SM_at_SetClass{2}; SM_al_SetClassID{2})
							End if 
							UNLOAD RECORD:C212([USER_SETS:105])
							$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemRow}
							If ($_l_Icon=0)
								$_l_Icon:=853
							End if 
							//SELECT LIST ITEM BY REFERENCE(list;itemRef)
							SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Plain:K14:1; 131072+$_l_Icon)
							// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
							
							
					End case 
					
					
					
			End case 
			
			SM_l_ShowScripts:=0
		Else 
			If (FORM Get current page:C276#3)
				SET WINDOW TITLE:C213("Data Lists")
				$_l_TabPosition:=Find in array:C230(SM_at_PalleteTab; "Data Lists")
				If ($_l_TabPosition<0) & (Size of array:C274(SM_at_PalleteTab)>0)
					INSERT IN ARRAY:C227(SM_at_PalleteTab; Size of array:C274(SM_at_PalleteTab)+1; 1)
					SM_at_PalleteTab{Size of array:C274(SM_at_PalleteTab)}:="Data Lists"
					SM_at_PalleteTab:=Size of array:C274(SM_at_PalleteTab)
					//SET VISIBLE(SM_at_PalleteTab;True)
					
				End if 
				SM_at_PalleteTab:=1
				FORM GOTO PAGE:C247(1)
				If (SM_l_TableNumber>0)
					If (Is table number valid:C999(SM_l_TableNumber))
						SM_t_SetManagerRecords:=String:C10(SM_Recordsinselection)+" "+Table name:C256(SM_l_TableNumber)+" Records"
						
						// a table number is passed-make sure there is a context
						$_bo_SetExists:=False:C215
						For ($_l_Index; 1; Size of array:C274(SM_al_SetContextIDs))
							$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_Index})
							If ($_l_TableNumber=SM_l_TableNumber)
								$_bo_SetExists:=True:C214
								//first test if an item is selected
								$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
								If ($_l_SelectedListItem=0)
									SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; SM_al_SetContextIDs{$_l_Index})
								Else 
									GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
									SM_ListItemShared($_l_ItemReference)
									$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ItemReference)
									If ($_l_SelectedItemParent#SM_al_SetContextIDs{$_l_Index})
										//the context is changing
										SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; SM_al_SetContextIDs{$_l_Index})
										$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
										//now collapse others
										For ($_l_SelectedListItem2; Count list items:C380(SM_HL_l_SETMANAGER); 1; -1)
											GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded)
											SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID2; False:C215)
											
										End for 
										SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; SM_al_SetContextIDs{$_l_Index})
										$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
										GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText2; $_l_SublistID2; $_bo_Expanded)
										SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; $_l_SublistID2; True:C214)
									End if 
								End if 
								
								$_l_Index:=Size of array:C274(SM_al_SetContextIDs)
							End if 
						End for 
						If (Not:C34($_bo_SetExists))
							If (Is table number valid:C999(SM_l_TableNumber))
								//no context already exists so add one
								$_l_VirtualTableNumber:=10000+SM_l_TableNumber  //by definition this is correct
								APPEND TO LIST:C376(SM_HL_l_SETMANAGER; Table name:C256(Table:C252(SM_l_TableNumber)); $_l_VirtualTableNumber; 0; False:C215)
								SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_VirtualTableNumber; False:C215; Bold:K14:2; 0)
								// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
								SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_VirtualTableNumber)
								SM_UpdateArrays("PER"; ""; 0; 0; Table name:C256(Table:C252(SM_l_TableNumber)); $_l_VirtualTableNumber)
							Else 
								SM_t_SetManagerRecords:=""
							End if 
						End if 
					Else 
						SM_t_SetManagerRecords:=""
					End if 
					
				Else 
					SM_t_SetManagerRecords:=""
				End if 
				If (SM_l_MonitorCall#0)
					$_l_MonitorCall:=SM_l_MonitorCall
					SM_l_MonitorCall:=0
					Case of 
						: ($_l_MonitorCall=1)
							If (SM_t_UseSetName#"")  //bsw/ng 23/07/04
								USE SET:C118(SM_t_UseSetName)
								If (SM_t_loadedsetName#"")  //this is being added to an existing set
									UNION:C120(SM_t_UseSetName; SM_t_loadedsetName; SM_t_loadedsetName)
									$_l_TableNumber:=SM_saveSet(SM_t_loadedsetName; SM_l_UpdateOnCallBackID)
									SM_l_UpdateOnCallBackID:=0
									SM_t_UseSetName:=""
								Else 
									If (SM_l_TableNumber>0)
										$_l_ContextID:=SM_ContextIDfromTable(SM_l_TableNumber)
										If ($_l_ContextID>0)
											$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
											SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_ContextID)
											$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
											
											GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
											SM_ListItemShared($_l_ItemReference)
											If ($_l_SubListID=0)
												$_l_SubListID:=New list:C375
											End if 
											OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
											$_t_ListNameText:=""
											If (True:C214)
												GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
												$_l_WIndowCenterVertical:=$_l_WindowLeft+($_l_WindowRight-($_l_WindowLeft/2))
												$_l_WIndowCenterHorizontal:=$_l_WindowTop+($_l_WindowBottom-($_l_WindowTop/2))
												HIDE WINDOW:C436
												$_t_ListNameText:=Gen_Request("Name This list:"; ""; "Save"; "Cancel"; $_l_WIndowCenterVertical; $_l_WIndowCenterHorizontal; "Add List")
												SHOW WINDOW:C435
											End if 
											If ($_t_ListNameText#"")
												$_l_CountListItems:=Count list items:C380($_l_SubListID)
												SM_l_ContextItemID:=AA_GetNextIDinMethod(->SM_l_ContextItemID)
												APPEND TO LIST:C376($_l_SubListID; $_t_ListNameText; -(SM_l_ContextItemID); 0; True:C214)
												SET LIST ITEM PROPERTIES:C386($_l_SubListID; -(SM_l_ContextItemID); True:C214; Plain:K14:1; 0)
												SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; True:C214)
												OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
												// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
												SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; True:C214)
												$_l_SelectedListItem:=$_l_SelectedListItem+$_l_CountListItems+1
												SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem)
												SM_UpdateArrays("PER"; $_t_ListNameText; -(SM_l_ContextItemID); $_l_ItemReference)
												//NOW SAVE THE SET
												GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
												SM_ListItemShared($_l_ItemReference)
												$_l_ListItemROW:=Find in array:C230(SM_al_SetitemsID; -(SM_l_ContextItemID))
												$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemROW}
												If ($_l_Icon=0)
													$_l_Icon:=853
												End if 
												SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Plain:K14:1; 131072+$_l_Icon)
												USE SET:C118(SM_t_UseSetName)
												SM_saveSet(SM_t_UseSetName; -(SM_l_ContextItemID))
												$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
												If ($_l_SelectedListItem>0)
													GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
													SM_ListItemShared($_l_ItemReference)
													If ($_l_ItemReference>10000)  // a context is selected(max 9999 lists!)
														//Object Set Enabled(SM_RB_1;TRUE)
														//Object Set Enabled(SM_RB_2;FALSE)
														//Object Set Enabled(SM_RB_3;FALSE)
														//Object Set Enabled(SM_RB_4;FALSE)
														//Object Set Enabled(SM_RB_5;FALSE)
														OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
														OBJECT SET ENABLED:C1123(SM_RB_2; False:C215)
														OBJECT SET ENABLED:C1123(SM_RB_3; False:C215)
														OBJECT SET ENABLED:C1123(SM_RB_4; False:C215)
														OBJECT SET ENABLED:C1123(SM_RB_5; False:C215)
														OBJECT SET TITLE:C194(SM_RB_2; "Unite list & Current Selection")
														OBJECT SET TITLE:C194(SM_RB_3; "Intersect list & Current Selection")
														OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list")
														OBJECT SET TITLE:C194(SM_RB_5; "Remove list from Current Selection")
														OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
														SM_RB_1:=0
														SM_RB_2:=0
														SM_RB_3:=0
														SM_RB_4:=0
														SM_RB_5:=0
													Else 
														//a sublist is selected
														//so buttons can allow lists to be intersected
														//Object Set Enabled(SM_RB_1;TRUE)
														//Object Set Enabled(SM_RB_2;TRUE)
														//Object Set Enabled(SM_RB_3;TRUE)
														//Object Set Enabled(SM_RB_4;TRUE)
														//Object Set Enabled(SM_RB_5;TRUE)
														OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
														OBJECT SET ENABLED:C1123(SM_RB_2; True:C214)
														OBJECT SET ENABLED:C1123(SM_RB_3; True:C214)
														OBJECT SET ENABLED:C1123(SM_RB_4; True:C214)
														OBJECT SET ENABLED:C1123(SM_RB_5; True:C214)
														
														OBJECT SET TITLE:C194(SM_RB_2; "Unite list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
														OBJECT SET TITLE:C194(SM_RB_3; "Intersect list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" & Current Selection")
														OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list "+Char:C90(34)+$_t_ItemText+Char:C90(34))
														OBJECT SET TITLE:C194(SM_RB_5; "Remove list "+Char:C90(34)+$_t_ItemText+Char:C90(34)+" from Current Selection")
														//for the next line we need to know the class of the current list
														$_l_ListItemROW:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
														Case of 
															: ($_l_ListItemROW<0)
																OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
															: (SM_al_SetitemsClassID{$_l_ListItemROW}=853) | (SM_al_SetitemsClassID{$_l_ListItemROW}=852)
																OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to list "+Char:C90(34)+$_t_ItemText+Char:C90(34))
															Else 
																OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
														End case 
														SM_RB_1:=0
														SM_RB_2:=0
														SM_RB_3:=0
														SM_RB_4:=0
														SM_RB_5:=0
													End if 
													
												Else 
													
													
													//Object Set Enabled(SM_RB_1;TRUE)
													//Object Set Enabled(SM_RB_2;FALSE)
													//Object Set Enabled(SM_RB_3;FALSE)
													//Object Set Enabled(SM_RB_4;FALSE)
													//Object Set Enabled(SM_RB_5;FALSE)
													OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
													OBJECT SET ENABLED:C1123(SM_RB_2; False:C215)
													OBJECT SET ENABLED:C1123(SM_RB_3; False:C215)
													OBJECT SET ENABLED:C1123(SM_RB_4; False:C215)
													OBJECT SET ENABLED:C1123(SM_RB_5; False:C215)
													OBJECT SET TITLE:C194(SM_RB_2; "Unite list & Current Selection")
													OBJECT SET TITLE:C194(SM_RB_3; "Intersect list & Current Selection")
													OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list")
													OBJECT SET TITLE:C194(SM_RB_5; "Remove list from Current Selection")
													OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
													SM_RB_1:=0
													SM_RB_2:=0
													SM_RB_3:=0
													SM_RB_4:=0
													SM_RB_5:=0
												End if 
											End if 
										End if 
									End if 
								End if 
								If (SM_t_UseSetName#"")
									SM_t_UseSetName:=""
								End if 
							End if 
							
						: ($_l_MonitorCall=2) | ($_l_MonitorCall=3) | ($_l_MonitorCall=4) | ($_l_MonitorCall=5)
							If (SM_t_UseSetName#"")  //bsw/ng 23/07/04
								If (SM_l_UpdateOnCallBackID#0)
									USE SET:C118(SM_t_UseSetName)
									SM_saveSet(SM_t_UseSetName; SM_l_UpdateOnCallBackID)
									SM_l_UpdateOnCallBackID:=0
									SM_t_UseSetName:=""
								Else 
									SM_l_UpdateOnCallBackID:=0
									SM_t_UseSetName:=""
								End if 
								
								If (SM_t_UseSetName#"")
									SM_t_UseSetName:=""
								End if 
							End if 
						: ($_l_MonitorCall=9999)
							SM_UPDATEDATA
							CANCEL:C270
						: ($_l_MonitorCall=-1)
							CANCEL:C270
						: ($_l_MonitorCall=-2)
							//reload sets
							//dont forget to save any local changes
							SM_UPDATEDATA(False:C215; False:C215)
							SM_LoadHLList
							// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
					End case 
					$_l_MonitorCall:=0
				End if 
			End if 
		End if 
		SM_bo_Busy:=False:C215
	: ($_l_event=On Timer:K2:25)
		If (Not:C34(SM_bo_Busy))
			SM_UPDATEDATA(False:C215)
			SM_LoadHLList
			// //////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM:WS_SetManager"; $_t_oldMethodName)
