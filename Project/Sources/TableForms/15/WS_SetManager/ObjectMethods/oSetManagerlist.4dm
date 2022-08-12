If (False:C215)
	//object Name: [USER]WS_SetManager.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2011 18:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_CommandDown; $_bo_Expanded; $_bo_ItemSave; $_bo_NewList; $_bo_OptionDown; SM_bo_Busy; SM_bo_SimulateClick)
	C_LONGINT:C283($_l_AddToItemReference; $_l_ContextID; $_l_CountItemsAdded; $_l_CountListITems; $_l_event; $_l_FieldNumber; $_l_HorizontalCenter; $_l_IconID; $_l_ItemReference2; $_l_ItemReferenceRow; $_l_ListItemReference)
	C_LONGINT:C283($_l_OK; $_l_ProcessState; $_l_ProcessTime; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SelectedListItemDROP; $_l_SelectedListItemOLD; $_l_SelectedRef; $_l_SourceProcess; $_l_SourceRow; $_l_SubList2)
	C_LONGINT:C283($_l_SubListID; $_l_TableNumber; $_l_VerticalCenter; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SM_HL_l_SETMANAGER; SM_l_ContextItemID; SM_l_MonitorCall; SM_l_TableNumber)
	C_LONGINT:C283(SM_l_UpdateOnCallBackID; SM_RB_1; SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5)
	C_POINTER:C301($_ptr_SourceObject)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_ListItemName; $_t_NewListItem; $_t_oldMethodName; $_t_ProcessName; $_t_VariableName; SM_t_loadedsetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Double Clicked:K2:5)
		
	: ($_l_event=On Clicked:K2:4)
		SM_bo_Busy:=True:C214
		If (Not:C34(SM_bo_SimulateClick))
			$_bo_CommandDown:=Macintosh command down:C546 | Windows Ctrl down:C562
			
			$_bo_OptionDown:=Macintosh option down:C545 | Windows Alt down:C563
			If ($_bo_OptionDown)
				
				$_l_SelectedListItemDROP:=Selected list items:C379(SM_HL_l_SETMANAGER)
				If ($_l_SelectedListItemDROP>0)
					GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItemDROP; $_l_ListItemReference; $_t_ItemText; $_l_SubListID)
					
					SM_ListItemShared($_l_ListItemReference)
					If ($_l_ListItemReference>10000)  // a context is selected(max 9999 lists!)
						$_t_ListItemName:=""
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
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
						$_t_ListItemName:=SM_at_SetItemsName{$_l_ItemReferenceRow}
						//a sublist is selected
						//so buttons can allow lists to be intersected
						OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_2; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_3; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_4; True:C214)
						OBJECT SET ENABLED:C1123(SM_RB_5; True:C214)
						OBJECT SET TITLE:C194(SM_RB_2; "Unite list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_3; "Intersect list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" & Current Selection")
						OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list "+Char:C90(34)+$_t_ListItemName+Char:C90(34))
						OBJECT SET TITLE:C194(SM_RB_5; "Remove list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" from Current Selection")
						//for the next line we need to know the class of the current list
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
						Case of 
							: ($_l_ItemReferenceRow<0)
								OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
							: (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=853) | (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=852)
								OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to list "+Char:C90(34)+$_t_ListItemName+Char:C90(34))
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
				//Here show the action section
				SM_ShowHideActions(True:C214)
				
				
			Else 
				//option key not down
				If (Not:C34($_bo_CommandDown))
					SM_ShowHideActions(False:C215)
					//we want to use the list for the current selection
					$_l_SelectedListItemDROP:=Selected list items:C379(SM_HL_l_SETMANAGER)
					If ($_l_SelectedListItemDROP>0)
						GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItemDROP; $_l_ListItemReference; $_t_ItemText; $_l_SubListID; $_bo_Expanded)
						SM_ListItemShared($_l_ListItemReference)
						If ($_l_ListItemReference<10000)
							$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
							$_t_ListItemName:=SM_at_SetItemsName{$_l_ItemReferenceRow}
							$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextItemContextID{$_l_ItemReferenceRow})
							SM_ModifySelection($_l_TableNumber; $_l_ListItemReference)
						Else 
							//edit
							//its a parent?
							If ($_l_SubListID>0) & (False:C215)
								
								If ($_bo_Expanded)
									//collapse
									SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ListItemReference; $_t_ItemText; $_l_ListItemReference; $_l_SubListID; False:C215)
									//////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
								Else 
									SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ListItemReference; $_t_ItemText; $_l_ListItemReference; $_l_SubListID; True:C214)
									//////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
								End if 
							End if 
							
						End if 
					End if 
				End if 
				
				SM_bo_Busy:=False:C215
			End if 
		Else 
			SM_bo_SimulateClick:=False:C215
			SM_bo_Busy:=False:C215
		End if 
	: ($_l_event=On Data Change:K2:15)
		SM_bo_Busy:=True:C214
		If (Not:C34(SM_bo_SimulateClick))  //1
			SM_SaveModifiedList
		End if   //end1
		
		SM_bo_Busy:=False:C215
	: ($_l_event=On Drop:K2:12)
		SM_bo_Busy:=True:C214
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		$_l_SelectedListItemOLD:=Selected list items:C379(SM_HL_l_SETMANAGER)
		GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItemOLD; $_l_ListItemReference; $_t_ItemText; $_l_SubListID)
		SM_ListItemShared($_l_ListItemReference)
		$_l_CountItemsAdded:=0
		If ($_l_ListItemReference<0)  //it is an item!!`2
			$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ListItemReference)
			If ($_t_ItemText#"Untitled") & ($_t_ItemText#"")  //3
				$_l_CountItemsAdded:=0
				$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
				If ($_l_ItemReferenceRow<0)  //this is not saved `changing the name of the list`4
					$_l_IconID:=853
					SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ListItemReference; True:C214; Plain:K14:1; 131072+853)
					SM_UpdateArrays("PER"; $_t_ItemText; $_l_ListItemReference; $_l_SelectedItemParent)
				Else   //e4
					//modify
					SM_UpdateArrays("PER"; $_t_ItemText; $_l_ListItemReference; $_l_SelectedItemParent)
				End if   //en4
			Else 
				
				$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
				If ($_l_ItemReferenceRow<0)  //5
					//not saved
					//HANG ON
					$_l_SelectedItemParent:=List item parent:C633(SM_HL_l_SETMANAGER; $_l_ListItemReference)
					SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_SelectedItemParent)
					$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
					
					GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText2; $_l_SubList2; $_bo_Expanded)
					SM_ListItemShared($_l_ListItemReference)
					$_l_CountListITems:=Count list items:C380($_l_SubList2)
					DELETE FROM LIST:C624(SM_HL_l_SETMANAGER; $_l_ListItemReference)
					////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
					$_l_CountItemsAdded:=-1
					If ($_l_CountListITems=1)  //WE JUST DELETED IT`6
						SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference2; $_t_ItemText2; $_l_ItemReference2; 0; True:C214)
					End if   //end6
					//the item name has been wiped
					//so change it back to what it was
					//or remove the item
				Else   //it cant be deleted this way so change it back`els5
					SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ListItemReference; SM_at_SetItemsName{$_l_ItemReferenceRow}; $_l_ListItemReference; $_l_SubListID; False:C215)
				End if   //end 5
				////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
			End if 
		End if 
		
		$_l_SelectedListItemDROP:=Drop position:C608
		Case of 
			: ($_l_SelectedListItemOLD<$_l_SelectedListItemDROP) & ($_l_CountItemsAdded<0)
				$_l_SelectedListItemDROP:=$_l_SelectedListItemDROP-1
			: ($_l_SelectedListItemOLD=$_l_SelectedListItemDROP) & ($_l_CountItemsAdded<0)
				$_l_SelectedListItemDROP:=0
		End case 
		
		$_bo_NewList:=False:C215
		If ($_l_SelectedListItemDROP>0)
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItemDROP; $_l_ListItemReference; $_t_ItemText; $_l_SubListID)
			
			SM_ListItemShared($_l_ListItemReference)
			If ($_l_ListItemReference>10000)  // a context is selected(max 9999 lists!)
				$_l_AddToItemReference:=$_l_ListItemReference
				$_l_TableNumber:=SM_TableFromContextID($_l_ListItemReference)
				If ($_l_TableNumber=SM_l_TableNumber)
					//make sure the context is correct
					//we will be adding a new sublist item
					If ($_l_SubListID=0)
						$_l_SubListID:=New list:C375
					End if 
					$_t_NewListItem:=""
					If (True:C214)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						$_l_HorizontalCenter:=$_l_WindowLeft+($_l_WindowRight-($_l_WindowLeft/2))
						$_l_VerticalCenter:=$_l_WindowTop+($_l_WindowBottom-($_l_WindowTop/2))
						HIDE WINDOW:C436
						$_t_NewListItem:=Gen_Request("Name This list:"; ""; "Save"; "Cancel"; $_l_HorizontalCenter; $_l_VerticalCenter; "Add List")
						SHOW WINDOW:C435
					End if 
					If ($_t_NewListItem#"")
						$_l_CountListITems:=Count list items:C380($_l_SubListID)
						SM_l_ContextItemID:=AA_GetNextIDinMethod(->SM_l_ContextItemID)
						APPEND TO LIST:C376($_l_SubListID; $_t_NewListItem; -(SM_l_ContextItemID); 0; True:C214)
						SET LIST ITEM PROPERTIES:C386($_l_SubListID; -(SM_l_ContextItemID); True:C214; Plain:K14:1; 0)
						OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
						////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
						SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ListItemReference; $_t_ItemText; $_l_ListItemReference; $_l_SubListID; True:C214)
						SELECT LIST ITEMS BY POSITION:C381($_l_SubListID; $_l_SelectedListItemDROP+$_l_CountListITems+1)
						$_l_SelectedListItemDROP:=$_l_SelectedListItemDROP+$_l_CountListITems+1
						SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItemDROP)
						GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItemDROP; $_l_ListItemReference; $_t_ItemText; $_l_SubListID)
						SM_ListItemShared($_l_ListItemReference)
						SM_UpdateArrays("PER"; $_t_NewListItem; -(SM_l_ContextItemID); $_l_AddToItemReference)
						$_bo_NewList:=True:C214
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; -(SM_l_ContextItemID))
						$_l_IconID:=SM_al_SetitemsClassID{$_l_ItemReferenceRow}
						If ($_l_IconID=0)
							$_l_IconID:=853
						End if 
						SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ListItemReference; True:C214; Plain:K14:1; 131072+$_l_IconID)
					End if 
					
				Else 
					If (Is table number valid:C999(SM_l_TableNumber))
						Gen_Alert("a Selection from "+Table name:C256(Table:C252(SM_l_TableNumber))+" Cannot be added to"+$_t_ItemText)
						$_t_ItemText:=""
					End if 
				End if 
				
			Else 
				//it is a set that has been selected
				//but is it in the right table
				$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
				$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ItemReferenceRow}
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
				If ($_l_TableNumber#SM_l_TableNumber)
					If (Is table number valid:C999(SM_l_TableNumber))
						Gen_Alert("a Selection from "+Table name:C256(Table:C252(SM_l_TableNumber))+" Cannot be added to"+$_t_ItemText)
						$_t_ItemText:=""
					End if 
				End if 
			End if 
			If ($_t_ItemText#"")
				RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				Case of 
					: ($_t_VariableName="BselectionDragger")
						//dragged from an output listing
						//so we need the data returned and added to the selection
						//it should be here because we are disabling the buttons
						$_l_SelectedRef:=$_l_ListItemReference
						$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
						Case of 
							: ($_l_ItemReferenceRow<0)
								$_bo_ItemSave:=False:C215
							: (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=853) | (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=852)
								$_bo_ItemSave:=True:C214
							Else 
								$_bo_ItemSave:=False:C215
						End case 
						If ($_bo_ItemSave)
							If ($_l_ItemReferenceRow>0)
								If (Macintosh option down:C545) | (Windows Alt down:C563)
									//overwrite list
									If ($_bo_NewList=False:C215)
										$_l_OK:=Gen_Confirm_WithHideOption(1; "Replace "+$_t_ItemText+"?"; "Yes"; "No")
									Else 
										$_l_OK:=1
									End if 
									If ($_l_OK=1) | ($_bo_NewList)
										CREATE EMPTY SET:C140(Table:C252($_l_TableNumber)->; "EmptySet")
										SM_t_loadedsetName:="EmptySet"
										SM_l_UpdateOnCallBackID:=$_l_SelectedRef
										If ($_l_SourceProcess>0)
											PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 1)
												POST OUTSIDE CALL:C329($_l_SourceProcess)
											End if 
											//the rest of this is handled in the
										End if 
									End if 
								Else 
									If ($_bo_NewList=False:C215)
										Gen_Confirm_WithHideOption(2; "Add to list "+$_t_ItemText+"?"; "Yes"; "No")
									End if 
									If (Ok=1) | ($_bo_NewList)
										SM_t_loadedsetName:=SM_LoadSet($_l_SelectedRef; False:C215)
										SM_l_UpdateOnCallBackID:=$_l_SelectedRef
										If ($_l_SourceProcess>0)
											PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 1)
												POST OUTSIDE CALL:C329($_l_SourceProcess)
											End if 
											//the rest of this is handled in the
										End if 
									End if 
									
								End if 
							End if 
						End if 
				End case 
			End if 
			$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ListItemReference; $_t_ItemText; $_l_SubListID)
				SM_ListItemShared($_l_ListItemReference)
				If ($_l_ListItemReference>10000)  // a context is selected(max 9999 lists!)
					$_t_ListItemName:=""
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
					$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
					$_t_ListItemName:=SM_at_SetItemsName{$_l_ItemReferenceRow}
					//a sublist is selected
					//so buttons can allow lists to be intersected
					OBJECT SET ENABLED:C1123(SM_RB_1; True:C214)
					OBJECT SET ENABLED:C1123(SM_RB_2; True:C214)
					OBJECT SET ENABLED:C1123(SM_RB_3; True:C214)
					OBJECT SET ENABLED:C1123(SM_RB_4; True:C214)
					OBJECT SET ENABLED:C1123(SM_RB_5; True:C214)
					OBJECT SET TITLE:C194(SM_RB_2; "Unite list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" & Current Selection")
					OBJECT SET TITLE:C194(SM_RB_3; "Intersect list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" & Current Selection")
					OBJECT SET TITLE:C194(SM_RB_4; "Remove Current Selection from list "+Char:C90(34)+$_t_ListItemName+Char:C90(34))
					OBJECT SET TITLE:C194(SM_RB_5; "Remove list "+Char:C90(34)+$_t_ListItemName+Char:C90(34)+" from Current Selection")
					//for the next line we need to know the class of the current list
					$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ListItemReference)
					Case of 
						: ($_l_ItemReferenceRow<0)
							OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
						: (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=853) | (SM_al_SetitemsClassID{$_l_ItemReferenceRow}=852)
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
		SM_bo_Busy:=False:C215
		
End case 
ERR_MethodTrackerReturn("OBJ:WS_SetManager,SM_HL_l_SETMANAGER"; $_t_oldMethodName)
