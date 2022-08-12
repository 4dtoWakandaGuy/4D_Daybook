If (False:C215)
	//Table Form Method Name: [USER]List_PropertiesItemManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ActionCodes;0)
	//ARRAY LONGINT(AA_al_PropertyItemsID;0)
	//ARRAY LONGINT(AA_at_PropertyItemActionCodes;0)
	//ARRAY TEXT(AA_at_ActionNames;0)
	//ARRAY TEXT(AA_at_PropertyItems;0)
	//ARRAY TEXT(AA_at_PropertyItemsProperties;0)
	//ARRAY TEXT(AA_at_PropertyItemAction;0)
	C_BOOLEAN:C305(AA_bo AddPropertyItem; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ActionCodeNumber; $_l_ActionPosition; $_l_event; $_l_Index; $_l_PositionChar; AA_l_CurrentSelectItemID; AA_l_LoadPropertyItemsListID; AA_l_PropertyCurItemActionCode; BsaveItem)
	C_TEXT:C284($_t_ActionCodeSTR; $_t_oldMethodName; AA_t_PropertyCurrentItem; AA_t_PropertyCurrentItemAction; AA_t_PropertyName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].List_PropertiesItemManager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "List_PropertiesItemManager")
		WS_AutoscreenSize(3; 310; 420)
		//here we load the property items
		//for a given property.
		ARRAY TEXT:C222(AA_at_PropertyItemsProperties; 0)
		ARRAY TEXT:C222(AA_at_PropertyItems; 0)
		ARRAY LONGINT:C221(AA_al_PropertyItemsID; 0)
		ARRAY TEXT:C222(AA_at_ActionNames; 0)
		ARRAY LONGINT:C221(AA_al_ActionCodes; 0)
		AA_t_PropertyCurrentItemAction:=""
		AA_l_PropertyCurItemActionCode:=0
		AA_l_CurrentSelectItemID:=0
		AA_t_PropertyCurrentItem:=""
		OBJECT SET VISIBLE:C603(BsaveItem; False:C215)
		OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItem; False:C215)
		OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItemAction; False:C215)
		OBJECT SET VISIBLE:C603(AA_at_ActionNames; False:C215)
		If (AA_l_LoadPropertyItemsListID>0)
			AA_LoadListbyID(AA_l_LoadPropertyItemsListID; ->AA_at_PropertyItems; ->AA_al_PropertyItemsID; False:C215; ->AA_at_PropertyItemsProperties)
			ARRAY TEXT:C222(AA_at_PropertyItemAction; Size of array:C274(AA_at_PropertyItems))
			ARRAY LONGINT:C221(AA_at_PropertyItemActionCodes; Size of array:C274(AA_at_PropertyItems))
			//we also load the current range of actions associated
			//this range of actions is hard coded
			//CURRENTLY
			//i have only allowed for property actions
			//BUT I will be allowing a property to have different data types.
			//some of those data types will allow linking-to other  lists
			//or linking to data(such as a list of MACROS!)
			//when that is done the next lines change
			AA_Listmanager_ImplementedCalls(->AA_at_ActionNames; ->AA_al_ActionCodes)
			For ($_l_Index; 1; Size of array:C274(AA_at_PropertyItemsProperties))
				$_l_PositionChar:=Position:C15("CODE:"; AA_at_PropertyItemsProperties{$_l_Index})
				If ($_l_PositionChar>0)
					$_t_ActionCodeSTR:=Substring:C12(AA_at_PropertyItemsProperties{$_l_Index}; $_l_PositionChar+Length:C16("CODE:"); Length:C16(AA_at_PropertyItemsProperties{$_l_Index}))
					$_l_PositionChar:=Position:C15(Char:C90(13); $_t_ActionCodeSTR)  //in case we add something else in here
					If ($_l_PositionChar>0)
						$_t_ActionCodeSTR:=Substring:C12($_t_ActionCodeSTR; 1; $_l_PositionChar-1)
					End if 
					$_l_ActionCodeNumber:=Num:C11($_t_ActionCodeSTR)
					If ($_l_ActionCodeNumber>0)
						$_l_ActionPosition:=Find in array:C230(AA_al_ActionCodes; $_l_ActionCodeNumber)
						If ($_l_ActionPosition>0)
							//it should be
							AA_at_PropertyItemAction{$_l_Index}:=AA_at_PropertyItemAction{$_l_ActionPosition}
							AA_at_PropertyItemActionCodes{$_l_Index}:=AA_al_ActionCodes{$_l_ActionPosition}
						Else 
							AA_at_PropertyItemAction{$_l_Index}:="Unnassigned"
						End if 
					Else 
						AA_at_PropertyItemAction{$_l_Index}:="Unnassigned"
					End if 
					
				Else 
					AA_at_PropertyItemAction{$_l_Index}:="Unnassigned"
				End if 
				
			End for 
			If (AA_bo AddPropertyItem)
				// we want to add a new item
				OBJECT SET VISIBLE:C603(BsaveItem; True:C214)
				OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItem; True:C214)
				OBJECT SET VISIBLE:C603(AA_t_PropertyCurrentItemAction; True:C214)
				OBJECT SET VISIBLE:C603(AA_at_ActionNames; True:C214)
			End if 
			
		Else 
			CANCEL:C270
		End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].List_PropertiesItemManager"; $_t_oldMethodName)
