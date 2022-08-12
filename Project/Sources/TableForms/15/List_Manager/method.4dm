If (False:C215)
	//Table Form Method Name: [USER]List_Manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 12:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_ItemProperties;0)
	//ARRAY BOOLEAN(LB_lb_Properties;0)
	//ARRAY BOOLEAN(LB_lb_RelatedFields;0)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ItemIDsModified;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListItemDeletion;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemPropertyTypes;0)
	//ARRAY LONGINT(AA_al_ListItemsDelete;0)
	//ARRAY LONGINT(AA_al_ListItemvalue;0)
	//ARRAY LONGINT(AA_al_ListPropTypesID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsID;0)
	//ARRAY LONGINT(AA_al_RelatedFieldsTable;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY LONGINT(AA_al_SubListItemDeletion;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(WS_al_AssociateFields;0)
	//ARRAY LONGINT(WS_al_AssociateTables;0)
	//ARRAY TEXT(AA_at_aallListNames;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_ListItemPropertyTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemvalue;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(AA_at_ListPropertyTypes;0)
	//ARRAY TEXT(AA_at_RelatedFieldNames;0)
	//ARRAY TEXT(WS_at_AssociateFIeldNames;0)
	C_BOOLEAN:C305($_bo_Deletions; $_bo_ListAllowed; AA_bo_ListsInited; AA_Bo_ListtoUpdate; AA_bo_ProperitesChange; AA_bo_SimulateClick; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; SM_bo_SimulateClick)
	C_LONGINT:C283($_l_AccessBinary; $_l_AccessType; $_l_ButtonNumber; $_l_ButtonPressed; $_l_DeletionIndex; $_l_event; $_l_Index; $_l_ListID; $_l_ListPosition; $_l_ModulePosition; $_l_OK)
	C_LONGINT:C283($_l_PropertyPosition; $_l_Retries; AA_HL_ListItems; AA_l_CurrentItemID; AA_l_CurrentListiD; AA_l_CurrentSelectedItemID; AA_l_CurrentSelectedProperty; bDeleteList; BModProperties; CB_LP4; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(DB_l_WindowCurrentModule; iCancel; iOK; IP_l_BUT1; IP_l_BUT10; IP_l_BUT11; IP_l_BUT12; IP_l_BUT13; IP_l_BUT14; IP_l_BUT15; IP_l_BUT16)
	C_LONGINT:C283(IP_l_BUT17; IP_l_BUT18; IP_l_BUT19; IP_l_BUT2; IP_l_BUT20; IP_l_BUT21; IP_l_BUT22; IP_l_BUT23; IP_l_BUT24; IP_l_BUT25; IP_l_BUT26)
	C_LONGINT:C283(IP_l_BUT27; IP_l_BUT3; IP_l_BUT4; IP_l_BUT5; IP_l_BUT6; IP_l_BUT7; IP_l_BUT8; IP_l_BUT9; ModuleNumber; RP_l_BUT1; RP_l_BUT10)
	C_LONGINT:C283(RP_l_BUT11; RP_l_BUT12; RP_l_BUT13; RP_l_BUT14; RP_l_BUT15; RP_l_BUT16; RP_l_BUT17; RP_l_BUT18; RP_l_BUT19; RP_l_BUT2; RP_l_BUT20)
	C_LONGINT:C283(RP_l_BUT21; RP_l_BUT22; RP_l_BUT23; RP_l_BUT24; RP_l_BUT25; RP_l_BUT26; RP_l_BUT27; RP_l_BUT3; RP_l_BUT4; RP_l_BUT5; RP_l_BUT6)
	C_LONGINT:C283(RP_l_BUT7; RP_l_BUT8; RP_l_BUT9; RS_l_BUT1; RS_l_BUT10; RS_l_BUT11; RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16)
	C_LONGINT:C283(RS_l_BUT17; RS_l_BUT18; RS_l_BUT19; RS_l_BUT2; RS_l_BUT20; RS_l_BUT21; RS_l_BUT22; RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26)
	C_LONGINT:C283(RS_l_BUT27; RS_l_BUT3; RS_l_BUT4; RS_l_BUT5; RS_l_BUT6; RS_l_BUT7; RS_l_BUT8; RS_l_BUT9; WS_l_HLALISTNAMES)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; AA_t_AddorModLabel; AA_t_listName; AA_t_NewListItem; BAR_t_Button; oIP_COL1; oIP_COL10; oIP_COL11; oIP_COL12; oIP_COL13)
	C_TEXT:C284(oIP_COL14; oIP_COL15; oIP_COL16; oIP_COL17; oIP_COL18; oIP_COL19; oIP_COL2; oIP_COL20; oIP_COL21; oIP_COL22; oIP_COL23)
	C_TEXT:C284(oIP_COL24; oIP_COL25; oIP_COL26; oIP_COL27; oIP_COL3; oIP_COL4; oIP_COL5; oIP_COL6; oIP_COL7; oIP_COL8; oIP_COL9)
	C_TEXT:C284(oIP_HED1; oIP_HED10; oIP_HED11; oIP_HED12; oIP_HED13; oIP_HED14; oIP_HED15; oIP_HED16; oIP_HED17; oIP_HED18; oIP_HED19)
	C_TEXT:C284(oIP_HED2; oIP_HED20; oIP_HED21; oIP_HED22; oIP_HED23; oIP_HED24; oIP_HED25; oIP_HED26; oIP_HED27; oIP_HED3; oIP_HED4)
	C_TEXT:C284(oIP_HED5; oIP_HED6; oIP_HED7; oIP_HED8; oIP_HED9; oRP_COL1; oRP_COL10; oRP_COL11; oRP_COL12; oRP_COL13; oRP_COL14)
	C_TEXT:C284(oRP_COL15; oRP_COL16; oRP_COL17; oRP_COL18; oRP_COL19; oRP_COL2; oRP_COL20; oRP_COL21; oRP_COL22; oRP_COL23; oRP_COL24)
	C_TEXT:C284(oRP_COL25; oRP_COL26; oRP_COL27; oRP_COL3; oRP_COL4; oRP_COL5; oRP_COL6; oRP_COL7; oRP_COL8; oRP_COL9; oRP_HED1)
	C_TEXT:C284(oRP_HED10; oRP_HED11; oRP_HED12; oRP_HED13; oRP_HED14; oRP_HED15; oRP_HED16; oRP_HED17; oRP_HED18; oRP_HED19; oRP_HED2)
	C_TEXT:C284(oRP_HED20; oRP_HED21; oRP_HED22; oRP_HED23; oRP_HED24; oRP_HED25; oRP_HED26; oRP_HED27; oRP_HED3; oRP_HED4; oRP_HED5)
	C_TEXT:C284(oRP_HED6; oRP_HED7; oRP_HED8; oRP_HED9; oRS_COL1; oRS_COL10; oRS_COL11; oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15)
	C_TEXT:C284(oRS_COL16; oRS_COL17; oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21; oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25)
	C_TEXT:C284(oRS_COL26; oRS_COL27; oRS_COL3; oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7; oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10)
	C_TEXT:C284(oRS_HED11; oRS_HED12; oRS_HED13; oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17; oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20)
	C_TEXT:C284(oRS_HED21; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27; oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6)
	C_TEXT:C284(oRS_HED7; oRS_HED8; oRS_HED9; PAL_BUTTON; vButtDisLM)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].List_Manager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(AA_at_RelatedFieldNames; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsTable; 0)
		ARRAY LONGINT:C221(AA_al_RelatedFieldsID; 0)
		ARRAY TEXT:C222(AA_at_ListPropertyTypes; 0)
		LB_SetupListbox(->LB_lb_RelatedFields; "oRS"; "RS_L"; 1; ->AA_at_RelatedFieldNames; ->AA_al_RelatedFieldsTable; ->AA_al_RelatedFieldsID)
		LB_SetColumnHeaders(->LB_lb_RelatedFields; "RS_L"; 1; "Use"; "Table")
		LB_SetColumnWidths(->LB_lb_RelatedFields; "oABR"; 1; 200; 0; 0)
		LB_SetEnterable(->LB_lb_RelatedFields; False:C215; 0)
		
		If ((Size of array:C274(LB_lb_RelatedFields)*16)>90)
			LB_SetScroll(->LB_lb_RelatedFields; -3; -2)
		Else 
			LB_SetScroll(->LB_lb_RelatedFields; -3; -3)
		End if 
		LB_StyleSettings(->LB_lb_RelatedFields; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		LB_Setdividers(->LB_lb_RelatedFields; 0; 0)
		LB_SetupListbox(->LB_lb_Properties; "oRP"; "RP_L"; 1; ->AA_at_ListPropertyTypes; ->AA_al_ListPropTypesID)
		//;->AA_al_RelatedFieldsTable;->AA_al_RelatedFieldsID)
		LB_SetColumnHeaders(->LB_lb_Properties; "RP_L"; 1; "Property"; "")
		LB_SetColumnWidths(->LB_lb_Properties; "oABR"; 1; 200; 0)
		LB_SetEnterable(->LB_lb_Properties; False:C215; 0)
		
		If ((Size of array:C274(LB_lb_Properties)*16)>90)
			LB_SetScroll(->LB_lb_Properties; -3; -2)
		Else 
			LB_SetScroll(->LB_lb_Properties; -3; -3)
		End if 
		LB_StyleSettings(->LB_lb_Properties; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		LB_Setdividers(->LB_lb_Properties; 0; 0)
		
		ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
		ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
		ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
		ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
		ARRAY TEXT:C222(AA_at_ListItemPropertyTypes; 0)
		ARRAY LONGINT:C221(AA_al_ListItemPropertyTypes; 0)
		ARRAY TEXT:C222(AA_at_ListItemvalue; 0)
		ARRAY LONGINT:C221(AA_al_ListItemvalue; 0)
		
		LB_SetupListbox(->LB_lb_ItemProperties; "oIP"; "IP_L"; 1; ->AA_at_ListItemPropertyTypes; ->AA_at_ListItemvalue; ->AA_al_ListItemPropertyTypes; ->AA_al_ListItemvalue)
		
		LB_SetColumnHeaders(->LB_lb_ItemProperties; "IP_L"; 1; "Property"; "Value"; ""; "")
		LB_SetColumnWidths(->LB_lb_ItemProperties; "oABR"; 1; 200; 200)
		LB_SetEnterable(->LB_lb_ItemProperties; False:C215; 0)
		
		If ((Size of array:C274(LB_lb_ItemProperties)*16)>90)
			LB_SetScroll(->LB_lb_ItemProperties; -3; -2)
		Else 
			LB_SetScroll(->LB_lb_ItemProperties; -3; -3)
		End if 
		LB_StyleSettings(->LB_lb_ItemProperties; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		LB_Setdividers(->LB_lb_ItemProperties; 0; 0)
		
		DB_SetnewToolBar
		If (Not:C34(AA_bo_ListsInited))
			$_l_Retries:=0
			While (Semaphore:C143("$LoadingListofLists"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			
			ARRAY TEXT:C222(AA_at_ListNames; 0)
			ARRAY LONGINT:C221(AA_al_ListIDS; 0)
			ARRAY TEXT:C222(AA_at_aallListNames; 0)
			ARRAY LONGINT:C221(AA_al_aallListIDS; 0)
			AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
			//On THIS FORM we do need all the list IDs
			AA_bo_ListsInited:=True:C214
			CLEAR SEMAPHORE:C144("$LoadingListofLists")
		End if 
		SORT ARRAY:C229(AA_at_ListNames; AA_al_ListIDS)
		
		ALL RECORDS:C47([X_LISTS:111])
		SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; AA_al_aallListIDs; [X_LISTS:111]x_ListName:2; AA_at_aallListNames)
		
		
		
		
		OpenHelp(Table:C252(->[USER:15]); "List_Manager")
		//WS_AutoscreenSize (2;490;550)
		SET WINDOW TITLE:C213("List Administrator")
		//Make sure all
		AA_bo_SimulateClick:=False:C215
		AA_CheckHeirarchical
		OBJECT SET VISIBLE:C603(BModProperties; False:C215)
		AA_l_CurrentSelectedProperty:=0
		WS_l_HLALISTNAMES:=New list:C375
		AA_HL_ListItems:=New list:C375
		ARRAY LONGINT:C221(WS_al_AssociateTables; 0)
		ARRAY LONGINT:C221(WS_al_AssociateFields; 0)
		ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 0)
		ARRAY LONGINT:C221(WS_al_AssociateTables; 1)
		ARRAY LONGINT:C221(WS_al_AssociateFields; 1)
		ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 1)
		WS_al_AssociateTables{1}:=Table:C252(->[COMPANIES:2])
		WS_al_AssociateFields{1}:=Field:C253(->[COMPANIES:2]Record_State:62)
		WS_at_AssociateFIeldNames{1}:=Table name:C256(Table:C252(WS_al_AssociateTables{1}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{1}; WS_al_AssociateFields{1}))
		SM_bo_SimulateClick:=False:C215
		
		Case of 
			: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")  //| (False)
				$_l_AccessType:=4
				OBJECT SET VISIBLE:C603(CB_LP4; True:C214)
				FORM GOTO PAGE:C247(2)
			: (User in group:C338(Current user:C182; "administrator")) | (Current user:C182="Administrator")  // | (True)
				$_l_AccessType:=2
				//GOTO PAGE(2)
				OBJECT SET VISIBLE:C603(CB_LP4; False:C215)
			Else 
				$_l_AccessType:=1
				OBJECT SET VISIBLE:C603(CB_LP4; False:C215)
		End case 
		
		$_bo_ListAllowed:=False:C215
		
		
		For ($_l_Index; 1; Size of array:C274(AA_at_ListNames))
			//do not put in invisible ones
			$_bo_ListAllowed:=False:C215
			
			Case of 
				: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")
					$_l_AccessType:=4
				: (User in group:C338(Current user:C182; "administrator")) | (Current user:C182="Administrator")
					$_l_AccessType:=2
				Else 
					$_l_AccessType:=1
			End case 
			//Get this lists access rights
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_al_ListIDS{$_l_Index})
			ARRAY TEXT:C222(AA_at_APropertyNames; 0)
			ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
			ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
			AA_GetListProperties(->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
			$_l_PropertyPosition:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
			If ($_l_PropertyPosition>0)
				$_l_AccessBinary:=AA_al_aPropertyNum{$_l_PropertyPosition}
			Else 
				$_l_AccessBinary:=0
			End if 
			
			Repeat 
				If (Not:C34($_l_AccessBinary ?? 5))
					$_bo_ListAllowed:=($_l_AccessBinary ?? $_l_AccessType)
					If (Not:C34($_bo_ListAllowed))
						$_l_AccessType:=$_l_AccessType-1
					End if 
					
					
				Else 
					$_l_AccessType:=-1
				End if 
			Until ($_l_AccessType<=0) | ($_bo_ListAllowed)
			Case of 
				: ($_bo_ListAllowed)
					APPEND TO LIST:C376(WS_l_HLALISTNAMES; AA_at_ListNames{$_l_Index}; AA_al_ListIDS{$_l_Index})
				: ($_l_AccessType=0)
					APPEND TO LIST:C376(WS_l_HLALISTNAMES; AA_at_ListNames{$_l_Index}; AA_al_ListIDS{$_l_Index})
			End case 
			
		End for 
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		
		ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
		ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		ARRAY LONGINT:C221(AA_al_ListItemIDs; 0)
		ARRAY LONGINT:C221(AA_al_ListItemsDelete; 0)
		AA_t_NewListItem:=""
		AA_l_CurrentItemID:=0
		AA_l_CurrentListiD:=0
		AA_t_AddorModLabel:="Enter New Item"
		//unload any current list
		UNLOAD RECORD:C212([X_LISTS:111])
		AA_LoadListtoManager(0; "")
		
		INT_SetDialog
		If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator"))
			OBJECT SET VISIBLE:C603(bDeleteList; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(bDeleteList; False:C215)
		End if 
		WS_GETPALLETEBUTTONS
		vButtDisLM:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisLM)
		In_ButtChkDis(->vButtDisLM)
		DB_AppendInputMenu(108)
	: ($_l_event=On Activate:K2:9)
		In_ButtChkDis(->vButtDisLM)
	: ($_l_event=On Outside Call:K2:11)
		
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Case of 
			: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
				
				If (AA_l_CurrentListiD#0)
					If (AA_l_CurrentSelectedItemID#0)
						AA_SaveListItem(AA_l_CurrentSelectedItemID)
						//////_o_REDRAW LIST(AA_HL_ListItems)
					End if 
					$_bo_Deletions:=False:C215
					For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_ListItemDeletion))
						If (AA_al_ListItemDeletion{$_l_DeletionIndex}>0)
							$_l_DeletionIndex:=Size of array:C274(AA_al_ListItemDeletion)
							$_bo_Deletions:=True:C214
						End if 
					End for 
					If (Not:C34($_bo_Deletions))
						For ($_l_DeletionIndex; 1; Size of array:C274(AA_al_SubListItemDeletion))
							If (AA_al_SubListItemDeletion{$_l_DeletionIndex}>0)
								$_l_DeletionIndex:=Size of array:C274(AA_al_SubListItemDeletion)
								$_bo_Deletions:=True:C214
							End if 
						End for 
						
					End if 
					$_l_ListPosition:=Find in array:C230(AA_al_ListIDS; AA_l_CurrentListiD)
					If ($_l_ListPosition<0)
						$_l_ListPosition:=0
					End if 
					If (Size of array:C274(AA_al_ItemIDsModified)>0) | ($_bo_Deletions) | (AA_at_ListNames{$_l_ListPosition}#AA_t_listName) | (AA_Bo_ListtoUpdate)
						
						Gen_Confirm("Save "+AA_t_listName+"?")
						$_l_OK:=OK
						If ($_l_OK=1)
							$_l_ListID:=AA_SaveUpdatedList(AA_l_CurrentListiD; AA_t_listName)
						End if 
						AA_bo_ProperitesChange:=False:C215
					End if 
					
				End if 
				CANCEL:C270
				
			: (($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				CANCEL:C270
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_AppendInputMenu(108)
					
				End if 
				BAR_t_Button:=""
				
			Else 
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:List_Manager"; $_t_oldMethodName)
