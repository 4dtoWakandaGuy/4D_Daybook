//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateSelectionsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/04/2010 11:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY PICTURE(DB_apic_SetPicture;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_ContractNames; 0)
	ARRAY TEXT:C222($_at_ContractTypes; 0)
	ARRAY TEXT:C222($_at_moveTypeCodes; 0)
	ARRAY TEXT:C222($_at_moveTypeNames; 0)
	ARRAY TEXT:C222($_at_OrderStateCodes; 0)
	ARRAY TEXT:C222($_at_OrderStateNames; 0)
	ARRAY TEXT:C222($_at_PriceGroupCodes; 0)
	ARRAY TEXT:C222($_at_PriceGroupNames; 0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_RememberSelection; DB_bo_DisplaySelections; DB_bo_SelectionsInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>SYS_l_DefaultPlainFontSize; $_l_CountCompanyBased; $_l_FoundQuantity; $_l_ItemsIndex; $1; Smgr_l_BUT1; Smgr_l_But2; Smgr_l_BUT3; Smgr_l_BUT4; Smgr_l_BUT5)
	C_LONGINT:C283(Smgr_l_BUT6; Smgr_l_BUT7; Smgr_l_BUT8; Smgr_l_BUT9)
	C_PICTURE:C286(DB_pic_BuiltinSet; DB_pic_BuiltSet; DB_pic_SelectedPlusSet; DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284(<>DefRole; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; <>SYS_t_DefaultFontPlain; $_t_CurrentUserName; $_t_MenuItemName; $_t_MenuItemReference; $_t_MenuNameAllRecord; $_t_MenuNameNextSelection; $_t_MenuNameSaveSelection; $_t_MethodName)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; $0; $2; DB_t_CurrentSelMenuReference; SMGR_t_COL1; SMGR_t_COL2; SMGR_t_COL3; SMGR_t_COL4; SMGR_t_COL5; SMGR_t_COL6)
	C_TEXT:C284(SMGR_t_COL7; SMGR_t_COL8; SMGR_t_COL9; SMGR_t_HED1; SMGR_t_HED2; SMGR_t_HED3; SMGR_t_HED4; SMGR_t_HED5; SMGR_t_HED6; SMGR_t_HED7; SMGR_t_HED8)
	C_TEXT:C284(SMGR_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateSelectionsMenu")

If (DB_t_CurrentSelMenuReference#"")
	RELEASE MENU:C978(DB_t_CurrentSelMenuReference)
End if 
If (Not:C34(DB_bo_SelectionsInited))
	
	
	ARRAY TEXT:C222(DB_at_SetName; 0)
	ARRAY PICTURE:C279(DB_apic_SetPicture; 0)
	ARRAY LONGINT:C221(DB_al_SetID; 0)
	ARRAY TEXT:C222(DB_at_SetMethod; 0)
	ARRAY TEXT:C222(DB_at_MethodParameters; 0)
	DB_bo_SelectionsInited:=True:C214
Else 
	//is there a set to save
	ARRAY TEXT:C222(DB_at_SetName; 0)
	ARRAY PICTURE:C279(DB_apic_SetPicture; 0)
	ARRAY LONGINT:C221(DB_al_SetID; 0)
	ARRAY TEXT:C222(DB_at_SetMethod; 0)
	ARRAY TEXT:C222(DB_at_MethodParameters; 0)
	
End if 
//GET PICTURE FROM LIBRARY(22547; DB_pic_BuiltinSet)
DB_pic_BuiltinSet:=Get_Picture(22547)
$_t_MenuItemReference:=""
Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		
		If (Count parameters:C259<3)
			If ($2#"") & ($2#"Mailing Companies")
				
				
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Companies")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_ExcludePrivate")
				$_t_MethodName:="SEL_AllRecords"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "2")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_MarkedPrivate")
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "3")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "3")
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				//INSERT MENU ITEM($_t_MenuItemReference;-1;"(-")
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[COMPANIES:2]))
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CONTACTS:1]))
		If (Count parameters:C259<3)
			If ($2#"") & ($2#"Mailing Contacts")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Contacts")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				If (<>DefRole#"")
					QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=<>DefRole)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Contacts")+" "+[ROLES:87]Role_Name:2
					$_t_MethodName:="SEL_AllRecords"
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "2")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				End if 
				If (False:C215)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Companies")+" "+Get localized string:C991("MenuItem_MarkedPrivate")
					$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "3")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "3")
				End if 
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Contacts")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CONTACTS:1]))
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
	: ($1=Table:C252(->[ACCOUNTS:32]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Accounts")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ACCOUNTS:32]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))
	: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
	: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
	: ($1=Table:C252(->[ACTIONS:13]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Actions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ACTIONS:13]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_AddressFormats")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ADDRESS_FORMATS:74]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[AddressRecords:125]))
	: ($1=Table:C252(->[ANALYSES:36]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Analyses")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ANALYSES:36]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[AREAS:3]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Areas")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[AREAS:3]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Brands")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PRODUCT_BRANDS:8]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CATALOGUE:108]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Catalogues")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CATALOGUE:108]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Categories")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TIME_BILLING_CATEGORIES:46]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_ContractTypes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CONTRACT_TYPES:19]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CONTRACTS:17]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Contracts")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				$_bo_RememberSelection:=False:C215
				If (Records in selection:C76([CONTRACT_TYPES:19])>0)
					$_bo_RememberSelection:=True:C214
					COPY NAMED SELECTION:C331([CONTRACT_TYPES:19]; "$temp")
					
				End if 
				ALL RECORDS:C47([CONTRACT_TYPES:19])
				SELECTION TO ARRAY:C260([CONTRACT_TYPES:19]Contract_Type_Code:1; $_at_ContractTypes; [CONTRACT_TYPES:19]Contract_Type_Name:2; $_at_ContractNames)
				SORT ARRAY:C229($_at_ContractNames; $_at_ContractTypes)
				If ($_bo_RememberSelection)
					USE NAMED SELECTION:C332("$Temp")
				End if 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_FoundQuantity)
				
				For ($_l_ItemsIndex; 1; Size of array:C274($_at_ContractTypes))
					QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Type_Code:4=$_at_ContractTypes{$_l_ItemsIndex})
					If ($_l_FoundQuantity>0)
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_at_ContractNames{$_l_ItemsIndex}+" "+Get localized string:C991("MenuItem_Contracts")
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+$_at_ContractTypes{$_l_ItemsIndex})
						APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
						APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
						APPEND TO ARRAY:C911(DB_al_SetID; 0)
						APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+$_at_ContractTypes{$_l_ItemsIndex})
					End if 
					
				End for 
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CONTRACTS:17]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[COUNTRIES:73]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Countries")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[COUNTRIES:73]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_CreditStages")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CREDIT_STAGES:54]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CURRENCIES:71]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Currencies")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CURRENCIES:71]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CURRENCY_RATES:72]))
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_CurrentStock")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[CURRENT_STOCK:62]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[DATA_AUDITS:102]))
	: ($1=Table:C252(->[DIARY:12]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Diary")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Diary")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Diary")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_open")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_open")
				
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Open")+" "+Get localized string:C991("MenuItem_Diary")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Open"+<>PER_t_CurrentUserInitials)
				
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Open"+<>PER_t_CurrentUserInitials)
				
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[DIARY:12]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[DOCUMENTS:7]))
		
		If (Count parameters:C259<3)
			If ($2#"")
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_DocumentTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Need to make a modiification so templates can easily be created that are not re-used.
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_LetterTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_LetterTemplates")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_LetterTemplates")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_EmailTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_EmailTemplates")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_EmailTemplates")
				
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[DOCUMENTS:7]))
				
			Else 
				//This is always a view of the template documents not the sent items-sent items are viewed view diary
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_DocumentTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Need to make a modiification so templates can easily be created that are not re-used.
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_LetterTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_LetterTemplates")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_LetterTemplates")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_EmailTemplates")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_EmailTemplates")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_EmailTemplates")
				
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[DOCUMENTS:7]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
	: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
	: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
	: ($1=Table:C252(->[IDENTIFIERS:16]))
	: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
	: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_FurtherAnalysis")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Groups")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PRODUCT_GROUPS:10]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[HEADINGS:84]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Headings")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[HEADINGS:84]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[INFORMATION:55]))
	: ($1=Table:C252(->[INVOICES:39]))
		If (Count parameters:C259<3)
			If ($2#"")
				Case of 
					: ($2="View Credit notes") | ($2="View Receipts") | ($2="View Deposits") | ($2="View Proformas") | ($2="Refund Deposit")
						
						$_t_MenuItemReference:=Create menu:C408
						$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
						$_t_MethodName:="SEL_NextRecordsSelection"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
						$_t_MethodName:="SEL_PrevRecordsSelection"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						
						$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
						$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
						If (DB_bo_DisplaySelections)
							$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
						Else 
							$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
						End if 
						
						$_t_MethodName:="DB_SetselectionManager"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
						
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_SalesLedger")
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
						APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
						APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
						APPEND TO ARRAY:C911(DB_al_SetID; 0)
						APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
						
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_SalesInvoices")
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						Case of 
							: ($2="View Credit notes")
								SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_CreditNotes")
								APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
								APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
								APPEND TO ARRAY:C911(DB_al_SetID; 0)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_CreditNotes")
								
							: ($2="View Receipts")
								SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Receipts")
								APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
								APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
								APPEND TO ARRAY:C911(DB_al_SetID; 0)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Receipts")
								
							: ($2="View Deposits")
								SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Deposits")
								APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
								APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
								APPEND TO ARRAY:C911(DB_al_SetID; 0)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Deposits")
							: ($2="View Proformas")
								SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Proformas")
								APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
								APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
								APPEND TO ARRAY:C911(DB_al_SetID; 0)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Proformas")
							Else 
								
								SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Invoices")
								APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
								APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
								APPEND TO ARRAY:C911(DB_al_SetID; 0)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Invoices")
								
						End case 
				End case 
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_SalesLedger")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_SalesInvoices")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Invoices")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Invoices")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Unpaid")+" "+Get localized string:C991("MenuItem_SalesInvoices")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_UnpaidInvoices")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_UnpaidInvoices")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_overdue")+" "+Get localized string:C991("MenuItem_SalesInvoices")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_overdueInvoices")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_overdueInvoices")
				
				
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Proformas")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Proforma")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Proforma")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_CreditNotes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_CreditNotes")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_CreditNotes")
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Deposits")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Deposits")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Deposits")
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Receipts")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Receipts")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Receipts")
				
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[INVOICES:39]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_JobPersonnel")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[JOB PERSONNEL:48]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[JOB_STAGES:47]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_JobStages")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[JOB_STAGES:47]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[JOB_TYPES:65]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_JobTypes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[JOB_TYPES:65]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[JOBS:26]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Jobs")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[JOBS:26]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[LAYERS:76]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Layers")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[LAYERS:76]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[LIST_LAYOUTS:96]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Listlayouts")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[LIST_LAYOUTS:96]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[LOCATIONS:61]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Locations")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[LOCATIONS:61]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[SCRIPTS:80]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Macros")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[SCRIPTS:80]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_MovementTypes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[MOVEMENT_TYPES:60]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		If (Count parameters:C259<3)
			If ($2#"")
				Case of 
					: ($2="Subscription Renewals")
						$_t_MenuItemReference:=Create menu:C408
						$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
						$_t_MethodName:="SEL_NextRecordsSelection"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
						$_t_MethodName:="SEL_PrevRecordsSelection"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						
						$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
						$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
						If (DB_bo_DisplaySelections)
							$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
						Else 
							$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
						End if 
						
						$_t_MethodName:="DB_SetselectionManager"
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						
						
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
						
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Subscriptions")
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
						APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
						APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
						APPEND TO ARRAY:C911(DB_al_SetID; 0)
						APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
						
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_uninvoiced")+" "+Get localized string:C991("MenuItem_Subscriptions")
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
						APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
						APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
						APPEND TO ARRAY:C911(DB_al_SetID; 0)
						APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
						
						//Here we get the names of user sets-same as we did in the old selction manager....
						
						DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ORDER_ITEMS:25]))
						
				End case 
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_OrderItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_uninvoiced")+" "+Get localized string:C991("MenuItem_OrderItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ORDER_ITEMS:25]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ORDERS:24]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_SalesOrders")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				
				$_bo_RememberSelection:=False:C215
				If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
					$_bo_RememberSelection:=True:C214
					COPY NAMED SELECTION:C331([TABLE_RECORD_STATES:90]; "$temp")
					
				End if 
				If (Not:C34(<>StatesLoaded))
					States_Load
				End if 
				If ($_bo_RememberSelection)
					USE NAMED SELECTION:C332("$Temp")
				End if 
				//The first 2 here are quotes and enquiries
				ARRAY TEXT:C222($_at_OrderStateCodes; 0)
				ARRAY TEXT:C222($_at_OrderStateNames; 0)
				For ($_l_ItemsIndex; 3; Size of array:C274(<>SYS_at_RecStateCodes{24}))
					APPEND TO ARRAY:C911($_at_OrderStateCodes; <>SYS_at_RecStateCodes{24}{$_l_ItemsIndex})
					APPEND TO ARRAY:C911($_at_OrderStateNames; <>SYS_at_RecStateNames{24}{$_l_ItemsIndex})
				End for 
				
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
					$_t_Name:=<>SYS_at_RecStateNames{24}{1}
					If (<>SYS_at_RecStateNames{24}{1}#"")
						If (<>SYS_at_RecStateNames{24}{1}[[Length:C16(<>SYS_at_RecStateNames{24}{1})]]="y")
							$_t_Name:=Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; Length:C16(<>SYS_at_RecStateNames{24}{1})-1)+"ie"
						End if 
					End if 
					
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_t_Name+"s"
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+<>SYS_at_RecStateCodes{24}{1})
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+<>SYS_at_RecStateCodes{24}{1})
					
				End if 
				
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=3)
					$_t_Name:=<>SYS_at_RecStateNames{24}{2}
					If (<>SYS_at_RecStateNames{24}{2}#"")
						If (<>SYS_at_RecStateNames{24}{2}[[Length:C16(<>SYS_at_RecStateNames{24}{2})]]="y")
							$_t_Name:=Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; Length:C16(<>SYS_at_RecStateNames{24}{2})-1)+"ie"
						End if 
					End if 
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_t_Name+"s"
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+<>SYS_at_RecStateCodes{24}{2})
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+<>SYS_at_RecStateCodes{24}{2})
					
				End if 
				
				For ($_l_ItemsIndex; 1; Size of array:C274($_at_OrderStateCodes))
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_at_OrderStateNames{$_l_ItemsIndex}+" "+Get localized string:C991("MenuItem_SalesOrders")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+$_at_OrderStateCodes{$_l_ItemsIndex})
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+$_at_OrderStateCodes{$_l_ItemsIndex})
					
					
				End for 
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ORDERS:24]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PERIODS:33]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_AccountingPeriods")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PERIODS:33]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PersonnelGroups")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PERSONNEL_GROUPS:92]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PERSONNEL:11]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Personnel")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PERSONNEL:11]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PICTURES:85]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Pictures")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PICTURES:85]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[POSTAL_CODES:50]))
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PriceGroups")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_discountBased")+" "+Get localized string:C991("MenuItem_PriceGroups")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PriceBased")+" "+Get localized string:C991("MenuItem_PriceGroups")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "3")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "3")
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PRICE_GROUPS:18]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_bo_RememberSelection:=False:C215
				If (Records in selection:C76([PRICE_GROUPS:18])>0)
					$_bo_RememberSelection:=True:C214
					COPY NAMED SELECTION:C331([PRICE_GROUPS:18]; "$Temp")
				End if 
				ALL RECORDS:C47([PRICE_GROUPS:18])
				SELECTION TO ARRAY:C260([PRICE_GROUPS:18]Price_Code:1; $_at_PriceGroupCodes; [PRICE_GROUPS:18]Price_Name:2; $_at_PriceGroupNames)
				If ($_bo_RememberSelection)
					USE NAMED SELECTION:C332("$Temp")
				End if 
				SORT ARRAY:C229($_at_PriceGroupNames; $_at_PriceGroupCodes)
				
				
				
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CountCompanyBased)
				
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8#"")
				If ($_l_CountCompanyBased>0)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Company")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Company")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Company")
					
					
				End if 
				
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7#"")
				If ($_l_CountCompanyBased>0)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Brand")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Brand")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Brand")
					
				End if 
				
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6#"")
				If ($_l_CountCompanyBased>0)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Group")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_ProductGroup")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_ProductGroup")
					
				End if 
				
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1#"")
				If ($_l_CountCompanyBased>0)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Product")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Product")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Product")
				End if 
				
				
				
				
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Currency_Code:13#"")
				If ($_l_CountCompanyBased>0)
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Currency")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Currency")
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Currency")
				End if 
				
				
				For ($_l_ItemsIndex; 1; Size of array:C274($_at_PriceGroupNames))
					QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_at_PriceGroupCodes{$_l_ItemsIndex})
					If ($_l_CountCompanyBased>0)
						$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_at_PriceGroupNames{$_l_ItemsIndex}+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
						
						$_t_MethodName:="SEL_AllRecords"  //
						
						INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
						SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+$_at_PriceGroupCodes{$_l_ItemsIndex})
						APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
						APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
						APPEND TO ARRAY:C911(DB_al_SetID; 0)
						APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
						APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+$_at_PriceGroupCodes{$_l_ItemsIndex})
					End if 
				End for 
				
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_DiscountBased")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
				
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_Discount")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Discount")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PriceBased")+" "+Get localized string:C991("MenuItem_PriceTable")+" "+Get localized string:C991("MenuItem_entries")
				
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "Price")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_Price")
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PRICE_TABLE:28]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PROBLEMS:22]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Problems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PROBLEMS:22]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PRODUCTS:9]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Products")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//get products by class-cant do this until new code is in here
				//SET QUERY DESTINATION(Into variable ;$CountIterative)
				//Quer
				
				CAT_LoadCats(<>PER_l_CurrentUserID; False:C215)
				//COPY ARRAY(CAT_al_CatalogueID;PROD_al_ViewableCatalogues)
				//COPY ARRAY(CAT_at_CatalogueNames;PROD_at_ViewableCatalogues)
				SORT ARRAY:C229(CAT_at_CatalogueNames; CAT_al_CatalogueID)
				For ($_l_ItemsIndex; 1; Size of array:C274(CAT_at_CatalogueNames))
					
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+CAT_at_CatalogueNames{$_l_ItemsIndex}
					
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9_"+String:C10(CAT_al_CatalogueID{$_l_ItemsIndex}))
					
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "9_"+String:C10(CAT_al_CatalogueID{$_l_ItemsIndex}))
					
					
				End for 
				
				
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PRODUCTS:9]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PROJECTS:89]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Projects")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PROJECTS:89]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Publications")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PUBLICATIONS:52]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PurchaseOrders")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "Passed Cancel By Date")
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; "PO_CancelDateHasPassed")
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "")
				APPEND TO ARRAY:C911(DB_at_SetName; "Passed Cancel By Date")
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "PO_CancelDateHasPassed")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
				
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PURCHASE_ORDERS:57]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PurchaseOrderItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selction manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PurchaseInvoices")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PURCHASE_INVOICES:37]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_PurchaseInvoiceItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_RecurJournals")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[RECURRING_JOURNALS:38]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[RESULTS:14]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Results")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[RESULTS:14]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[ROLES:87]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Roles")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[ROLES:87]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[SALES_PROJECTION:113]))
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_ServiceCalls")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Open")+Get localized string:C991("MenuItem_ServiceCalls")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "9")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "9")
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_ServiceCalls")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[SERVICE_CALLS:20]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[SOLUTIONS:23]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Solutions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[SOLUTIONS:23]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[SOURCES:6]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Sources")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Sources")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[SOURCES:6]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STAGES:45]))  //Job stage types
		
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_JobStageTypes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STAGES:45]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STATUS:4]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Status")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STATUS:4]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_StockItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_current")+" "+Get localized string:C991("MenuItem_StockItems")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "8")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "8")
				
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_StockLevels")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_free")+" "+Get localized string:C991("MenuItem_StockMovements")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "8")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "8")
				
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STOCK_LEVELS:58]))
				
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_StockMovements")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				ALL RECORDS:C47([STOCK_TYPES:59])
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_moveTypeCodes; [MOVEMENT_TYPES:60]Type_Name:2; $_at_moveTypeNames)
				SORT ARRAY:C229($_at_moveTypeNames; $_at_moveTypeCodes)
				
				For ($_l_ItemsIndex; 1; Size of array:C274($_at_moveTypeCodes))
					$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+$_at_moveTypeNames{$_l_ItemsIndex}+" "+Get localized string:C991("MenuItem_StockMovements")
					$_t_MethodName:="SEL_AllRecords"  //
					
					INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
					SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
					SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "7_"+$_at_moveTypeCodes{$_l_ItemsIndex})
					APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
					APPEND TO ARRAY:C911(DB_al_SetID; 0)
					APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
					APPEND TO ARRAY:C911(DB_at_MethodParameters; "7_"+$_at_moveTypeCodes{$_l_ItemsIndex})
					
				End for 
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_current")+" "+Get localized string:C991("MenuItem_StockMovements")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "2")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "2")
				
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STOCK_MOVEMENTS:40]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_StockTypes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[STOCK_TYPES:59]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Subscriptions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_current")+" "+Get localized string:C991("MenuItem_Subscriptions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "6")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "6")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[SUBSCRIPTIONS:93]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TAX_CODES:35]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TaxCodes")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TAX_CODES:35]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Terminology")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TERMINOLOGY:75]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TIME_BUDGETS:49]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TimeBudget")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TimeBudget")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TIME_BUDGETS:49]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TransBatches")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_CurrentFinancialYear")+" "+Get localized string:C991("MenuItem_TransBatches")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "5")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "5")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TRANSACTION_BATCHES:30]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TransBatchItem")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_CurrentFinancialYear")+" "+Get localized string:C991("MenuItem_TransBatchItem")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "5")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "5")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_TransactionType")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TRANSACTION_TYPES:31]))
				
				
			End if 
		End if 
		
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Transactions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_CurrentFinancialYear")+" "+Get localized string:C991("MenuItem_Transactions")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "5")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "5")
				
				
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TRANSACTIONS:29]))
				
				
				
			End if 
		End if 
	: ($1=Table:C252(->[TYPES:5]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Types")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "1")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[TYPES:5]))
				
				
			End if 
		End if 
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		If (Count parameters:C259<3)
			If ($2#"")
			Else 
				$_t_MenuItemReference:=Create menu:C408
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_NextSelection")
				$_t_MethodName:="SEL_NextRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				$_t_MenuNameNextSelection:=Get localized string:C991("MenuItem_PreviousSelection")
				$_t_MethodName:="SEL_PrevRecordsSelection"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameNextSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				$_t_MenuNameSaveSelection:=Get localized string:C991("MenuItem_SaveSelection")
				$_t_MethodName:="SEL_SaveRecordSelection"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameSaveSelection)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				If (DB_bo_DisplaySelections)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
				Else 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
				End if 
				
				$_t_MethodName:="DB_SetselectionManager"
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuItemName)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				
				
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; "(-")
				
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Workflow")
				$_t_MethodName:="SEL_AllRecords"  //
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "1")
				
				$_t_CurrentUserName:=DB_GetOrganisation
				$_t_MenuNameAllRecord:=Get localized string:C991("MenuItem_all")+" "+Get localized string:C991("MenuItem_Workflow")+" "+Get localized string:C991("MenuItem_Marked")+" "+<>PER_t_CurrentUserName
				$_t_MethodName:="SEL_AllRecords"  //this will do the same as dragging did...
				
				INSERT MENU ITEM:C412($_t_MenuItemReference; -1; $_t_MenuNameAllRecord)
				SET MENU ITEM METHOD:C982($_t_MenuItemReference; -1; $_t_MethodName)
				SET MENU ITEM PARAMETER:C1004($_t_MenuItemReference; -1; "4")
				APPEND TO ARRAY:C911(DB_at_SetName; $_t_MenuNameAllRecord)
				APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_BuiltinSet)
				APPEND TO ARRAY:C911(DB_al_SetID; 0)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "SEL_AllRecords")
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "4")
				
				
				//Here we get the names of user sets-same as we did in the old selection manager....
				
				DB_BuildSelectionsMenuitems($_t_MenuItemReference; Table:C252(->[WORKFLOW_CONTROL:51]))
				
				
			End if 
		End if 
		
		
End case 
If (Not:C34(Undefined:C82(DB_lb_Setsandselections)))
	
	
	If (Size of array:C274(DB_at_SetName)>0)
		
		LB_SetupListbox(->DB_lb_Setsandselections; "SMGR_t"; "Smgr_L"; 1; ->DB_apic_SetPicture; ->DB_at_SetName; ->DB_at_SetMethod; ->DB_at_MethodParameters; ->DB_al_SetID)
		//LB_SetupListbox (->DB_lb_Setsandselections;"SMGR_t";"Smgr_L";1;->DB_at_SetName;->DB_at_SetMethod;->DB_at_MethodParameters;->DB_al_SetID)
		LB_SetColumnHeaders(->DB_lb_Setsandselections; "Smgr_L"; 1; "PIC"; "Name"; "Method"; "Parameters"; "ID")
		LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
		
		LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; 410; 0; 0; 0)
		LB_SetScroll(->DB_lb_Setsandselections; -3; -2)
		$_ptr_Table:=Table:C252($1)
		LB_StyleSettings(->DB_lb_Setsandselections; "Black"; 9; "SMGR_t"; $_ptr_Table)
		LB_Setdividers(->DB_lb_Setsandselections; 0; 0)
		LB_SETFONT(->DB_lb_Setsandselections; "SMGR_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
		
		
		
	Else 
		LB_SetupListbox(->DB_lb_Setsandselections; "SMGR_t"; "Smgr_L"; 1; ->DB_apic_SetPicture; ->DB_at_SetName; ->DB_at_SetMethod; ->DB_at_MethodParameters; ->DB_al_SetID)
		//LB_SetupListbox (->DB_lb_Setsandselections;"SMGR_t";"Smgr_L";1;->DB_at_SetName;->DB_at_SetMethod;->DB_at_MethodParameters;->DB_al_SetID)
		LB_SetColumnHeaders(->DB_lb_Setsandselections; "Smgr_L"; 1; "PIC"; "Name"; "Method"; "Parameters"; "ID")
		LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
		
		LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; 410; 0; 0; 0)
		LB_SetScroll(->DB_lb_Setsandselections; -3; -2)
		
		$_ptr_Table:=Table:C252($1)
		LB_StyleSettings(->DB_lb_Setsandselections; "Black"; 9; "SMGR_t"; $_ptr_Table)
		LB_Setdividers(->DB_lb_Setsandselections; 0; 0)
		LB_SETFONT(->DB_lb_Setsandselections; "SMGR_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
		
		//$_t_MenuItemReference:=
		DB_bo_DisplaySelections:=True:C214
		DB_SetselectionManager
	End if   //this will hide it
	
	
	
End if 



$0:=$_t_MenuItemReference
ERR_MethodTrackerReturn("DB_MenuCreateSelectionsMenu"; $_t_oldMethodName)
