If (False:C215)
	//object Name: [USER]WS_SetManager.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 20:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_LONGINT:C283($_l_AddToItemReference; $_l_CountItems; $_l_event; $_l_HorizontalCentre; $_l_IconID; $_l_ItemPosition; $_l_ItemReference; $_l_ProcessState; $_l_ProcessTime; $_l_SelectedListItem; $_l_SubListID)
	C_LONGINT:C283($_l_TableNumber; $_l_VerticalCentre; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SM_HL_l_SETMANAGER; SM_l_CallBack; SM_l_ContextItemID; SM_l_MonitorCall; SM_RB_1)
	C_LONGINT:C283(SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_ItemText; $_t_NewListName; $_t_oldMethodName; $_t_ProcessName; SM_t_loadedsetName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button1"; Form event code:C388)
SM_bo_Busy:=True:C214
$_l_event:=Form event code:C388


SM_SaveModifiedList

Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (Macintosh option down:C545) | (Windows Alt down:C563)
			//Here we want to tell the from most process to load a set
			If (SM_l_CallBack>0)
				
				PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 6)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
				End if 
			End if 
			
		Else 
			//this will load a set from disk and create a set
			$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
				SM_ListItemShared($_l_ItemReference)
				If ($_l_ItemReference>10000)
					$_l_AddToItemReference:=$_l_ItemReference
					$_l_TableNumber:=SM_TableFromContextID($_l_ItemReference)
					
					$_ptr_Table:=Table:C252($_l_TableNumber)
					SM_t_loadedsetName:="TempSet"
					LOAD SET:C185($_ptr_Table->; SM_t_loadedsetName; "")
					If (OK=1)
						If ($_l_SubListID=0)
							$_l_SubListID:=New list:C375
						End if 
						OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
						$_t_NewListName:=""
						If (True:C214)
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
							$_l_HorizontalCentre:=$_l_WindowLeft+($_l_WindowRight-($_l_WindowLeft/2))
							$_l_VerticalCentre:=$_l_WindowTop+($_l_WindowBottom-($_l_WindowTop/2))
							HIDE WINDOW:C436
							$_t_NewListName:=Gen_Request("Name This list:"; ""; "Save"; "Cancel"; $_l_HorizontalCentre; $_l_VerticalCentre)
							SHOW WINDOW:C435
						End if 
						If ($_t_NewListName#"")  // | (True)
							$_l_CountItems:=Count list items:C380($_l_SubListID)
							SM_l_ContextItemID:=AA_GetNextIDinMethod(->SM_l_ContextItemID)
							APPEND TO LIST:C376($_l_SubListID; $_t_NewListName; -(SM_l_ContextItemID); 0; True:C214)
							SET LIST ITEM PROPERTIES:C386($_l_SubListID; -(SM_l_ContextItemID); True:C214; Plain:K14:1; 0)
							SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; True:C214)
							OBJECT SET ENTERABLE:C238(SM_HL_l_SETMANAGER; True:C214)
							////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
							SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; True:C214)
							
							SM_UpdateArrays("PER"; $_t_NewListName; -(SM_l_ContextItemID); $_l_ItemReference)
							//Now use the set to add to the list
							$_l_TableNumber:=SM_saveSet(SM_t_loadedsetName; -(SM_l_ContextItemID))
							$_l_SelectedListItem:=$_l_SelectedListItem+$_l_CountItems+1
							SELECT LIST ITEMS BY POSITION:C381(SM_HL_l_SETMANAGER; $_l_SelectedListItem)
							$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
							If ($_l_SelectedListItem>0)
								GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
								SM_ListItemShared($_l_ItemReference)
								$_l_ItemPosition:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
								$_l_IconID:=SM_al_SetitemsClassID{$_l_ItemPosition}
								If ($_l_IconID=0)
									$_l_IconID:=853
								End if 
								SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Bold:K14:2; 131072+$_l_IconID)
								If ($_l_ItemReference>10000)  // a context is selected(max 9999 lists!)
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
									$_l_ItemPosition:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
									Case of 
										: ($_l_ItemPosition<0)
											OBJECT SET TITLE:C194(SM_RB_1; "Save Current Selection to new list")
										: (SM_al_SetitemsClassID{$_l_ItemPosition}=853) | (SM_al_SetitemsClassID{$_l_ItemPosition}=852)
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
					End if 
					CLEAR SET:C117("TempSet")
				End if 
			Else 
				Gen_Alert("You must select a context to add a list to")
			End if 
		End if 
		
End case 
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ:WS_SetManager,BloadList"; $_t_oldMethodName)