//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateFunctionsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2012 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($2)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_SubMenuShortCutmodifier;0;0)
	ARRAY TEXT:C222($_at_ScriptCodes; 0)
	ARRAY TEXT:C222($_at_ScriptNames; 0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	//ARRAY TEXT(DB_at_SubMenu1Item4DFunction;0;0)
	//ARRAY TEXT(DB_at_SubMenu1ItemParameter;0;0)
	//ARRAY TEXT(DB_at_Submenuitem;0;0)
	//ARRAY TEXT(DB_at_SubMenuReference;0)
	//ARRAY TEXT(DB_at_SubMenuShortCut;0;0)
	C_BOOLEAN:C305($_bo_OverrideFunctions; DB_bo_MenusInited; DB_bo_ModuleArrayInited; <>FindMy; $_bo_OverrideFunctions; DB_bo_MenusInited; DB_bo_ModuleArrayInited)
	C_LONGINT:C283($_l_Column; $_l_CountRecords; $_l_CountRecords2; $_l_Index; $_l_MenuItemCount; $_l_MenuShortcut; $_l_Row; $_l_Shortcut; $_l_ShortCutRow; $_l_TableNumber; $1)
	C_LONGINT:C283($_l_ArraySize; $_l_Column; $_l_CountRecords; $_l_CountRecords2; $_l_Index; $_l_MenuItemCount; $_l_MenuShortcut; $_l_Row; $_l_Shortcut; $_l_ShortCutRow; $_l_TableNumber)
	C_LONGINT:C283($1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AddMenuItemName; $_t_ApplytoSelectionItem; $_t_BatchEntryName; $_t_BatchPrintName; $_t_Character; $_t_ExtendTextName; $_t_MenuItem; $_t_MenuItemName; $_t_MenuItemParameter; $_t_MenuMethod)
	C_TEXT:C284($_t_MenuParameter; $_t_MenuReference; $_t_MenuTime; $_t_MenuType; $_t_oldMethodName; $_t_SubMenu2; $_t_SubMenuName; $_t_SubMenuReference; $_t_SubMenuReference3; $_t_ViewsMenuReference; $0)
	C_TEXT:C284($2; $4; Db_t_MenuType; <>PER_t_CurrentUserInitials; $_t_AddMenuItemName; $_t_ApplytoSelectionItem; $_t_BatchEntryName; $_t_BatchPrintName; $_t_Character; $_t_ExtendTextName; $_t_MenuItem)
	C_TEXT:C284($_t_MenuItemName; $_t_MenuItemParameter; $_t_MenuMethod; $_t_MenuParameter; $_t_MenuReference; $_t_MenuTime; $_t_MenuType; $_t_oldMethodName; $_t_SubMenu2; $_t_SubMenuName; $_t_SubMenuReference)
	C_TEXT:C284($_t_SubMenuReference3; $_t_ViewsMenuReference; $3; $4; Db_t_MenuType)
End if 
//Code Starts Here


//TRACE

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateFunctionsMenu")
$_l_MenuItemCount:=0
$0:=$_t_MenuReference
$_bo_OverrideFunctions:=False:C215
If (Not:C34(DB_bo_ModuleArrayInited))
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	DB_bo_ModuleArrayInited:=True:C214
	DB_bo_MenusInited:=False:C215
End if 
If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
End if 
If (Count parameters:C259>=4)
	$_t_MenuType:=$4
Else 
	$_t_MenuType:="4D menu"
End if 
If ($_t_MenuType="menu string")
	//Return the menu into arrays-this can then be passed to the web as a JSON string after some filtering
	//Note these arrays are used on each 'build' of a menu-file-edit-reports-etc etc etc.
	//and on the build of the module menus. they have to be passed into a 2D array which represents the whole menu bar.ARRAY TEXT(DB_at_menuitem;0)
	ARRAY TEXT:C222(DB_at_menuitem; 0)
	ARRAY TEXT:C222(DB_at_MenuShortCut; 0)
	ARRAY LONGINT:C221(DB_al_MenuShortCutModifier; 0)
	ARRAY TEXT:C222(DB_at_MenuItem4DFunction; 0)
	ARRAY TEXT:C222(DB_at_MenuItemParameter; 0)
	ARRAY TEXT:C222(DB_at_SubMenuReference; 0)
	//``
	ARRAY TEXT:C222(DB_at_SubMenuReference; 0)  //tells us the row
	
	ARRAY TEXT:C222(DB_at_Submenuitem; 0; 0)
	ARRAY TEXT:C222(DB_at_SubMenuShortCut; 0; 0)
	ARRAY LONGINT:C221(DB_al_SubMenuShortCutmodifier; 0; 0)
	ARRAY TEXT:C222(DB_at_SubMenu1Item4DFunction; 0; 0)
	ARRAY TEXT:C222(DB_at_SubMenu1ItemParameter; 0; 0)
	$_t_ViewsMenuReference:=""
Else 
	$_t_ViewsMenuReference:=Create menu:C408
End if 

Case of 
	: ($_l_TableNumber=Table:C252(->[COMPANIES:2])) | ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
		
		If ($2="Input")
			Case of 
				: ($3="Company_In")
					//add to existing contacts
					$_t_MenuReference:=Create menu:C408
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_AddMenuItemName:=Get localized string:C991("MenuItem_AddexistingContacts")
					$_t_MenuMethod:="Comp_ContAdd"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_AddMenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SwitchAccess")
					$_t_MenuMethod:="Companies_InAS"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"-")
					
					$_t_BatchEntryName:=Get localized string:C991("MenuItem_BatchEntry")
					$_t_MenuMethod:="COM_SingleSwitch"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchEntryName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					$_l_MenuItemCount:=1
					
					
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
				: ($3="Contact_In")
					
					$_t_MenuReference:=Create menu:C408
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_AddMenuItemName:=Get localized string:C991("MenuItem_ShowCreditCards")
					$_t_MenuMethod:="CCM_ShowContactCards"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_AddMenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_GoDuplicate")
					$_t_MenuMethod:="Contacts_DupGo"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"-")
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_BatchEntryName:=Get localized string:C991("MenuItem_SwitchAccess")
					$_t_MenuMethod:="Contacts_InAS"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchEntryName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					$_l_MenuItemCount:=1
			End case 
		Else 
			$_bo_OverrideFunctions:=False:C215
			If ($2="Renumber") | ($2="Deduplicate")
				$_bo_OverrideFunctions:=True:C214
			End if 
			If (Not:C34($_bo_OverrideFunctions))
				$_t_MenuReference:=Create menu:C408
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
				$_t_MenuMethod:="DB_Applytoselected"
				$_l_MenuShortcut:=0
				$_t_MenuParameter:=String:C10($_l_TableNumber)
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
				
				
			Else 
				Case of 
					: ($2="Renumber")
						$_t_MenuReference:=Create menu:C408
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_RenumberSelection")
						If ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
							
							$_t_MenuMethod:="COM_CompanyRenumber"
						Else 
							$_t_MenuMethod:="CON_ContactRenumber"
						End if 
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=String:C10($_l_TableNumber)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						
						
						
					: ($2="Deduplicate")
						$_t_MenuReference:=Create menu:C408
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_FindDuplicates")
						If ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
							
							$_t_MenuMethod:="COM_CompanyFindDuplicates"
						Else 
							$_t_MenuMethod:="CON_ContactFindDuplicates"
						End if 
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=String:C10($_l_TableNumber)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						
				End case 
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
		
		//no apply to selection here..but other functions
		
		$_t_MenuReference:=Create menu:C408
		//if user has access to this..
		If ($2="Input")
			Case of 
				: ($3="AccBal_in") | ($3="AccBal_In") | ($3="AccBal_In")
					
					$_t_ApplytoSelectionItem:="Set Viewing Currency"
					//ACC_balanceSetOutputCurrency 
					$_t_MenuMethod:="ACC_balanceSetOutputCurrency"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=String:C10($_l_TableNumber)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
			End case 
		Else 
			
			If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) & (DB_GetModuleSettingByNUM(Module_NominalLedger)#3)
				
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_Setupbudgets")
				$_t_MenuMethod:="Acc_BalBudgetCreate"  // "ZaccBal Bud" this did call. which displays account balances and has a button to create budgets. but there is no relation between what is on screen and the budgets that get created!..so from here this is not the method called by the button
				
				$_l_MenuShortcut:=0
				$_t_MenuParameter:=String:C10($_l_TableNumber)
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
				
			End if 
			
			If (DB_GetModuleSettingByNUM(Module_DataManager)>=2) & (DB_GetModuleSettingByNUM(Module_DataManager)#3)
				
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CheckAccountBalances")
				//$_t_MenuMethod:="DB_Applytoselected"
				$_t_MenuMethod:="ACC_ValidateBalances"
				$_l_MenuShortcut:=0
				$_t_MenuParameter:=String:C10($_l_TableNumber)
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
				
			End if 
			//
			$_t_ApplytoSelectionItem:="Set Viewing Currency"
			//ACC_balanceSetOutputCurrency 
			$_t_MenuMethod:="ACC_balanceSetOutputCurrency"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
		
		
		$_t_MenuReference:=Create menu:C408
		
		
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
		
		
		
		
		
	: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Action_In")
			End case 
		Else 
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
		
		$_t_MenuReference:=Create menu:C408
	: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
	: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Analysis_In")
					
			End case 
		Else 
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[AREAS:3]))
		
		$_t_MenuReference:=Create menu:C408
		
		If ($2="Input")
			Case of 
				: ($3="Area_in")
					
			End case 
		Else 
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Brands_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Catalogue_Input")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Categories_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="ContractType_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Contract_in")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintaContract")
					$_t_MenuMethod:="Contr_PPrint"
					$_l_MenuShortcut:=Character code:C91("P")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"P";2048)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AddProductItems")
					$_t_MenuMethod:="Contracts_GP"
					$_l_MenuShortcut:=Character code:C91("R")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SortItems")
					$_t_MenuMethod:="Contr_Sort"
					$_l_MenuShortcut:=Character code:C91("S")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_FindOrderItems")+" "+Get localized string:C991("MenuItem_FindByCompany")
					$_t_MenuMethod:="Contr_OI"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					$_t_MenuItemName:=Get localized string:C991("MenuItem_FindOrderItems")+" "+Get localized string:C991("MenuItem_FindBySerialNo")
					$_t_MenuMethod:="Contr_SerSrch"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Country_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="CreditStage_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Currency_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Rates_in")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="CurrentStock_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[DIARY:12]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Letters_inW")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:="Add Product Items"
					$_t_MenuMethod:="Letters_GPD"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:="Preview"
					$_t_MenuMethod:="Letters_Preview"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					
			End case 
			
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		
		
		$_t_MenuReference:=Create menu:C408
		$_l_MenuItemCount:=$_l_MenuItemCount+1
		$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
		$_t_MenuMethod:="DB_Applytoselected"
		$_l_MenuShortcut:=0
		$_t_MenuParameter:=String:C10($_l_TableNumber)
		
		DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
		
	: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
	: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		
		
		
		
		
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="CustomFIeld_in")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Furthers_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="ProductGroup_In")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Heading_in")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
	: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Invoice_In")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyPrevious")
					$_t_MenuMethod:="Invoices_Dup"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					If (False:C215)  //This item should only available if no periods closed??
						
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_OpeningBalance")
						$_t_MenuMethod:="Invoices_Posted"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					End if 
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
				: ($3="Invoices_In1P13")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_BatchCreateInvoices")
			$_t_MenuMethod:="DB_BatchCreate"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_BatchPrintInvoices")
			$_t_MenuMethod:="DB_BatchPrint"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1  //see menu bar 102
			
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_BatchPrintRemittance")
			$_t_MenuMethod:="DB_BatchPrint"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)+"_"+"Remitance"
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_BatchPostnvoices")
			$_t_MenuMethod:="DB_BatchPost"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="JobPers_in")
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="JobStage_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Types_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[JOBS:26]))
		
		$_t_MenuReference:=Create menu:C408
		
		If ($2="Input")
			Case of 
				: ($3="Job_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Layer_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Location_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Scripts_in") | ($3="scripts In13")
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_Find")
					$_t_MenuMethod:="Text_Find"
					$_l_MenuShortcut:=Character code:C91("F")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$CharCode)
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_FindNext")
					$_t_MenuMethod:="Text_FindN"
					$_l_MenuShortcut:=Character code:C91("G")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_Replace")
					$_t_MenuMethod:="Text_Replace"
					$_l_MenuShortcut:=Character code:C91("R")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ReplaceNext")
					$_t_MenuMethod:="Text_ReplaceN"
					$_l_MenuShortcut:=Character code:C91("T")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CalculateIndents")
					$_t_MenuMethod:="Record_Paginate"
					$_l_MenuShortcut:=Character code:C91("I")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_EditMacro")
					$_t_MenuMethod:="Macros_Edit"
					$_l_MenuShortcut:=Character code:C91("M")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=Character code:C91(";")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="MoveType_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Items_in")
					If ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4))
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_StockAllocation")
						$_t_MenuMethod:="OrderI_AllocCur"
						$_l_MenuShortcut:=Character code:C91("L")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
						//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
						
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_StockLevels")
						$_t_MenuMethod:="OrderI_StockLev"
						$_l_MenuShortcut:=Character code:C91("E")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
						If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
							
							$_l_MenuItemCount:=$_l_MenuItemCount+1
							$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialAssenblyDisplay")
							$_t_MenuMethod:="ZStockAss_CalOI"
							//$Char:=Character code("E")
							DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
							//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$Char)
						End if 
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
						
					End if 
					If (DB_GetModuleSettingByNUM(Module_Subscriptions)>1)
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_SubscriptionDetails")
						$_t_MenuMethod:="Orders_SuMod"
						$_l_MenuShortcut:=Character code:C91("Y")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
						
					End if 
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=Character code:C91(";")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					
				: ($3="Items_Su")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_DuplicateOrder")
			$_t_MenuMethod:="Orders_OutDup"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_PurchaseOrder")
			$_t_MenuMethod:="Orders_PPPO"
			$_l_MenuShortcut:=Character code:C91("9")
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_ProFormaInvoice")
			$_t_MenuMethod:="Orders_PPProf"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Order_In")
					//Some items here moving from the print menu..item to create PO and invoice
					
					$_t_SubMenuName:=Get localized string:C991("MenuItem_InvCreditNotes")
					
					
					Case of 
						: ($_t_MenuType="4D menu")
							$_t_SubMenuReference:=Create menu:C408
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SubMenuName; $_t_SubMenuReference)
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SubMenuName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resize this here and at the end!
							
							$_l_Row:=Size of array:C274(DB_at_Submenuitem)+1
							DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_Row)
							INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_Row; 1)
							//INSERT IN ARRAY(DB_at_Submenuitem;$_l_Row;1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_Row; 1)
							$_l_Row:=Size of array:C274(DB_at_Submenuitem)
					End case 
					
					
					//```
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AllocatedItems")
					$_t_MenuMethod:="Orders_PPInvL"
					$_l_MenuShortcut:=Character code:C91("8")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					
					$_t_MenuItemName:=Get localized string:C991("Menuitem_ItemsbyinvoiceNo")
					$_t_MenuMethod:="Orders_PPInvN"
					$_l_MenuShortcut:=Character code:C91("9")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AllNotInvoiced")
					$_t_MenuMethod:="Orders_PPInvA"
					$_l_MenuShortcut:=Character code:C91("9")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SelectedItems")
					$_t_MenuMethod:="Orders_PPInvS"
					$_l_MenuShortcut:=Character code:C91("9")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					
					
					$_t_SubMenuName:=Get localized string:C991("MenuItem_PurchaseOrderUC")
					Case of 
						: ($_t_MenuType="4D menu")
							$_t_SubMenuReference:=Create menu:C408
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SubMenuName; $_t_SubMenuReference)
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SubMenuName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
							ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resize this here and at the end!
							
							$_l_Row:=Size of array:C274(DB_at_Submenuitem)+1
							DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_Row)
							INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_Row; 1)
							//INSERT IN ARRAY(DB_at_Submenuitem;$_l_Row;1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_Row; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_Row; 1)
							$_l_Row:=Size of array:C274(DB_at_Submenuitem)
					End case 
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ItemsbyPurchordNo")
					$_t_MenuMethod:="Orders_PPPON"
					$_l_MenuShortcut:=Character code:C91("5")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SelectedItems")
					$_t_MenuMethod:="Orders_PPPOS"
					$_l_MenuShortcut:=Character code:C91("5")
					$_t_MenuParameter:=""
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
							
						: ($_t_MenuType="menu string")
							$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
							DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
							DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
							DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
							$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
							
					End case 
					//```
					//cant use the generic validation here-different arrays
					If ($_l_MenuShortcut>0)
						Case of 
							: ($_l_MenuShortcut=Character code:C91("F"))
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									If ($_l_ShortCutRow<0)
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
								End if 
							Else 
								$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								If ($_l_ShortCutRow>0)
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										$_t_Character:=Char:C90($_l_MenuShortcut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
										: ($_t_MenuType="menu string")
											$_t_Character:=Char:C90($_l_MenuShortcut)
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
								End if 
						End case 
					End if 
					
					If (True:C214)
						$_t_SubMenuName:=""
						$_t_SubMenuName:=Get localized string:C991("MenuItem_DeliveryNoteUC")
						Case of 
							: ($_t_MenuType="4D menu")
								$_t_SubMenu2:=Create menu:C408
								INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SubMenuName; $_t_SubMenu2)
							: ($_t_MenuType="menu string")
								APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SubMenuName)
								APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
								APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
								APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
								APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
								ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resize this here and at the end!
								
								$_l_Row:=Size of array:C274(DB_at_Submenuitem)+1
								DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_Row)
								INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_Row; 1)
								//INSERT IN ARRAY(DB_at_Submenuitem;$_l_Row;1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_Row; 1)
								$_l_Row:=Size of array:C274(DB_at_Submenuitem)
						End case 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AllocatedItems")
						$_t_MenuMethod:="Orders_PPDelL"
						$_t_MenuItemParameter:=""
						$_l_MenuShortcut:=Character code:C91("1")
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenu2; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenu2; -1; $_t_MenuMethod)
								//SET MENU ITEM SHORTCUT($_t_SubMenu2;-1;"1";2048+512)
								$_l_MenuShortcut:=Character code:C91("1")
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=""
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								$_l_MenuShortcut:=Character code:C91("1")
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ItemsbyDate")
						$_t_MenuMethod:="Orders_PPDelD"
						$_l_MenuShortcut:=Character code:C91("2")
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenu2; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenu2; -1; $_t_MenuMethod)
								//SET MENU ITEM SHORTCUT($_t_SubMenu2;-1;"1";2048+512)
								$_l_MenuShortcut:=Character code:C91("2")
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=""
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								$_l_MenuShortcut:=Character code:C91("2")
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_allnotDelivered")
						$_t_MenuMethod:="Orders_PPDelA"
						$_l_Shortcut:=Character code:C91("3")
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenu2; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenu2; -1; $_t_MenuMethod)
								//SET MENU ITEM SHORTCUT($_t_SubMenu2;-1;"1";2048+512)
								$_l_MenuShortcut:=Character code:C91("3")
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=""
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								$_l_MenuShortcut:=Character code:C91("3")
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_SelectedItems")
						$_t_MenuMethod:="Orders_PPDelS"
						$_l_MenuShortcut:=Character code:C91("4")
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenu2; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenu2; -1; $_t_MenuMethod)
								//SET MENU ITEM SHORTCUT($_t_SubMenu2;-1;"1";2048+512)
								$_l_MenuShortcut:=Character code:C91("4")
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=""
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								$_l_MenuShortcut:=Character code:C91("4")
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenu2; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
					End if 
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_AddProductItems")
					$_t_MenuMethod:="Orders_GP"
					$_l_MenuShortcut:=Character code:C91("P")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_QuickAddItems")
					$_t_MenuMethod:="Orders_QAdd"
					$_l_MenuShortcut:=Character code:C91("D")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_SetSortOrder")
					$_t_MenuMethod:="ORDi_setSort"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048)
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_DuplicateItem")
					$_t_MenuMethod:="OrderI_Dup"
					$_l_MenuShortcut:=Character code:C91("U")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_SplitItem")
					$_t_MenuMethod:="OrderI_Split"
					$_l_MenuShortcut:=Character code:C91("S")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"S";2048+512)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CreditCardAuthorization")
					$_t_MenuMethod:="CCM_mOrderAuthorize"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					If (False:C215)
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_AddNewProduct")
						$_t_MenuMethod:="ORD_AddProducts"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048)
					End if 
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyPrevious")
					$_t_MenuMethod:="Orders_CP"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048)
					If ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4))
						
						
						
						
						
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
						
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_AllocateStock")
						$_t_MenuMethod:="OrderI_AllocCur"
						$_l_MenuShortcut:=Character code:C91("L")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_AllocateStockAuto")
						$_t_MenuMethod:="OrderI_AllocAut"
						$_l_MenuShortcut:=Character code:C91("B")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"B";2048)
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_Unallocate")
						$_t_MenuMethod:="OrderI_UnaAut"
						$_l_MenuShortcut:=Character code:C91("B")
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214; 2048)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"B";2048+Shift key mask )
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ViewStockLevels")
						$_t_MenuMethod:="OrderI_StockLev"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048+Shift key mask )
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_DeliveryTypeStockMovement")
						$_t_MenuMethod:="Orders_StockPos"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048+Shift key mask )
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:="Undo delivery on selected items"
						$_t_MenuMethod:="STK_UndoDelivery"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						
						
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialAssenblyDisplay")
						$_t_MenuMethod:="ZStockAss_CalOI"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048+Shift key mask )
						
						
					End if 
					If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
						
						
						$_t_SubMenuReference3:=Create menu:C408
						$_t_SubMenuName:=Get localized string:C991("MenuItem_BundlesAssemblies")
						
						
						Case of 
							: ($_t_MenuType="4D menu")
								$_t_SubMenuReference:=Create menu:C408
								INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SubMenuName; $_t_SubMenuReference)
							: ($_t_MenuType="menu string")
								APPEND TO ARRAY:C911(DB_at_menuitem; $_t_SubMenuName)
								APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
								APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
								APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
								APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
								ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resize this here and at the end!
								
								$_l_Row:=Size of array:C274(DB_at_Submenuitem)+1
								DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_Row)
								INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_Row; 1)
								//INSERT IN ARRAY(DB_at_Submenuitem;$_l_Row;1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_Row; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_Row; 1)
								$_l_Row:=Size of array:C274(DB_at_Submenuitem)
						End case 
						
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowTopLevelItems")
						$_t_MenuMethod:="Orders_ItemTop"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
								
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
						
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowNextLevelItems")
						$_t_MenuMethod:="Orders_ItemNext"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						
						Case of 
							: ($_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_SubMenuReference; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_SubMenuReference; -1; $_t_MenuMethod)
								
							: ($_t_MenuType="menu string")
								$_l_ArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_ArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_ArraySize; 1)
								DB_at_Submenuitem{$_l_Row}{$_l_ArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_Row}{$_l_ArraySize}:=Char:C90($_l_MenuShortcut)
								DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_ArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_ArraySize}:=$_t_MenuMethod
								DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_ArraySize}:=$_t_MenuParameter
								$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
								
						End case 
						//```
						//cant use the generic validation here-different arrays
						If ($_l_MenuShortcut>0)
							Case of 
								: ($_l_MenuShortcut=Character code:C91("F"))
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										If ($_l_ShortCutRow<0)
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
										Else 
											//dont add the short cut
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; "F"; 2048)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
									End if 
								Else 
									$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									If ($_l_ShortCutRow>0)
										$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										If ($_l_ShortCutRow>0)
											$_l_ShortCutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											If ($_l_ShortCutRow<0)
												$_t_Character:=Char:C90($_l_MenuShortcut)
												Case of 
													: ($_t_MenuType="4D menu")
														SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048+512)
													: ($_t_MenuType="menu string")
														DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
														DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
												End case 
												APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
											Else 
												//dont add the short cut
											End if 
										Else 
											$_t_Character:=Char:C90($_l_MenuShortcut)
											Case of 
												: ($_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_t_Character; 2048)
												: ($_t_MenuType="menu string")
													DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
													DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
										End if 
									Else 
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference; -1; $_l_MenuShortcut)
											: ($_t_MenuType="menu string")
												$_t_Character:=Char:C90($_l_MenuShortcut)
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_Character
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
									End if 
							End case 
						End if 
						
						
					End if 
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ExportOrdertoDisk")
					$_t_MenuMethod:="Orders_PPTextEx"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048+Shift key mask )
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TakeDeposit")
					$_t_MenuMethod:="ORD_TakeDeposit"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut;2048+Shift key mask )
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_SwitchAccess")
					$_t_MenuMethod:="Orders_InAS"
					$_l_MenuShortcut:=Character code:C91("-")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$_l_Shortcut)  `;2048+Shift key mask )
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=Character code:C91(";")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$CharCode)
					
				: ($3="Jobs_TCIn")
					
					
			End case 
		Else 
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_InvoiceAllocatedItems")
			$_t_MenuMethod:="Orders_PPInvL"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_InvoiceByInvNum")
			$_t_MenuMethod:="Orders_PPInvN"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_Invoicenotinvoiced")
			$_t_MenuMethod:="Orders_PPInvA"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_InvoiceProForma")
			$_t_MenuMethod:="Orders_PPProf"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
			
			
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_PurchaseOrder")
			$_t_MenuMethod:="Orders_PPPO"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
		End if 
		
	: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Period_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="PersonnelGroup_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Personnel_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Picture_In")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ImportPicture")
					$_t_MenuMethod:="DS_importPicture"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
	: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="PriceGroup_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="PriceTable_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Problems_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Products_in2009")
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CalcPrices")
					$_t_MenuMethod:="Prod_CompRecalc"
					$_l_MenuShortcut:=Character code:C91("P")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
					
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;$CharCode;2048)
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=Character code:C91(";")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Projects_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Projects_In")
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="PurchaseOrder_In")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:="Set Selected to Completed"
			$_t_MenuMethod:="PO_CancelPurchaseOrder"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Items_in")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Purchases_in")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyPrevious")
					$_t_MenuMethod:="Purchases_Dup"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyPurchaseOrder")
					$_t_MenuMethod:="Purchase_PO"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyStockMovement")
					$_t_MenuMethod:="Purchase_SMI"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					If (False:C215)  //should only be on a new set up
						
						
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_OpeningBalance")
						$_t_MenuMethod:="Purchases_Postd"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=""
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
						
					End if 
					
					
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
				: ($3="Purchases_inP")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_BatchPrintName:=Get localized string:C991("MenuItem_PIBatchPost")
			$_t_MenuMethod:="ZPurchases_Nom"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_BatchPrintName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
		
		
		$_t_MenuReference:=Create menu:C408
		$_l_MenuItemCount:=$_l_MenuItemCount+1
		$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
		$_t_MenuMethod:="DB_Applytoselected"
		$_l_MenuShortcut:=0
		$_t_MenuParameter:=String:C10($_l_TableNumber)
		
		DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
		
		
	: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Results_in")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ROLES:87]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Roles_In")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
		
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Calls_in")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Solutions_in")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Sources_In")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STAGES:45]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Stages_in")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STATUS:4]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Status_in")
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="StockAss_in")
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialAssembly")
					$_t_MenuMethod:="StockAss_Calc"
					$_l_MenuShortcut:=Character code:C91("T")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialAssenblyDisplay")
					$_t_MenuMethod:="StockAss_CalcD"
					$_l_MenuShortcut:=Character code:C91("D")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
				: ($3="StockAss_Disassemble")
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialDisassembly")
					$_t_MenuMethod:="StockAss_DisIte"
					$_l_MenuShortcut:=Character code:C91("T")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_TrialDisassemblyDIsplay")
					$_t_MenuMethod:="StockAss_DisDis"
					$_l_MenuShortcut:=Character code:C91("D")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
					
				: ($3="Stock_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:="Cancel Remainder on selected"
			
			$_t_MenuMethod:="STK_CancelReceiptFromList"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="StockLev_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
		
		$_t_MenuReference:=Create menu:C408
		
		If ($2="Input")
			Case of 
				: ($3="Movements_in")
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_MenuItemName:=Get localized string:C991("MenuItem_CopyCurrentStock")
					$_t_MenuMethod:="StockI_CurrButt"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=Character code:C91("S")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_CopyPreviousMovement")
					$_t_MenuMethod:="StockI_CopyPrev"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=Character code:C91("M")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_DuplicateItem")
					$_t_MenuMethod:="StockI_Dup"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=Character code:C91("U")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_QuickAddItems")
					$_t_MenuMethod:="Movements_QAdd"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=Character code:C91("D")
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_MenuItemName:="Set Expected Receipt on Selected"
					$_t_MenuMethod:="STK_AssignDeliverySelected"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					$_t_MenuItemName:="Set Expected Receipt on Remaining Lines"
					$_t_MenuMethod:="STK_AssignDelivery"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					$_t_MenuItemName:="Receive Stock"
					$_t_MenuMethod:="STK_ReceiveFromOnOrder"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_t_MenuItemName:="Cancel Remainder"
					$_t_MenuMethod:="STK_CancelFromOnOrder"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					$_t_MenuItemName:="Undo Receipt Items"
					$_t_MenuMethod:="STK_CancelReceipt"
					$_t_MenuParameter:=""
					$_l_MenuShortcut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
					
					
					
					
					
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="StockTypes_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_IssueDeliveries")
			$_t_MenuMethod:="ZSubscript_Del"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_SubBilling")
			$_t_MenuMethod:="ZSubscript_Inv"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_RenewalMailing")
			$_t_MenuMethod:="ZMail_Subs"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=""
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Vat_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Term_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="TransB_in")
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CopyPreviousBatch")
					$_t_MenuMethod:="TransB_SkelGet"
					$_l_MenuShortcut:=Character code:C91("T")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;"T";2048+512)
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					
					
					$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_UpdateSingleSIded")
					$_t_MenuMethod:="TransB_InCalc"
					$_l_MenuShortcut:=Character code:C91("U")
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_ExtendTextName:=Get localized string:C991("MenuItem_ExpandText")
					$_t_MenuMethod:="Text_ExpandL"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=""
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ExtendTextName; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut; True:C214)
					
					
					
					
			End case 
		Else 
			If ($2="Check")
				$_bo_OverrideFunctions:=True:C214
			End if 
			If (Not:C34($_bo_OverrideFunctions))
				$_t_MenuReference:=Create menu:C408
				//$_l_MenuItemCount:=$_l_MenuItemCount+1
				//$`Applytoselection:=Get localized string("MenuItem_BatchPosttoLedger")
				//$_t_MenuMethod:="ZTransB_Nom"
				//DB_MenuAppendItem ($_t_MenuReference;$_t_MenuType;$_t_ApplytoSelectionItem)`
				//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod;$_t_MenuParameter;$_l_MenuShortcut)
				//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
				
				
				
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ReverseBatches")
				$_t_MenuMethod:="ACC_ReverseSelectedBatches"
				$_l_MenuShortcut:=0
				$_t_MenuParameter:=String:C10($_l_TableNumber)
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
				
			Else 
				Case of 
					: ($2="xxx")
						
				End case 
				
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			
			
			
			
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="TransT_in")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
		
		If ($2="Input")
			$_t_MenuReference:=Create menu:C408
			Case of 
				: ($3="Trans_in")
					
			End case 
		Else 
			$_bo_OverrideFunctions:=False:C215
			If ($2="Check")
				$_bo_OverrideFunctions:=True:C214
			End if 
			If (Not:C34($_bo_OverrideFunctions))
				$_t_MenuReference:=Create menu:C408
				//$_l_MenuItemCount:=$_l_MenuItemCount+1
				//$_t_ApplytoSelectionItem:=Get localized string("MenuItem_BankRecon")
				//$_t_MenuMethod:="ZTrans_Rec"
				//DB_MenuAppendItem ($_t_MenuReference;$_t_MenuType;$_t_ApplytoSelectionItem)
				//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)`
				//SET MENU ITEM PARAMETER($_t_MenuReference;-1;String($_l_TableNumber))
				
			Else 
				Case of 
					: ($2="Check")
						$_t_MenuReference:=Create menu:C408
						$_l_MenuItemCount:=$_l_MenuItemCount+1
						$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_CheckTransactions")
						$_t_MenuMethod:="ACC_TransactionsCheck"
						$_l_MenuShortcut:=0
						$_t_MenuParameter:=String:C10($_l_TableNumber)
						
						DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
						
				End case 
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[TYPES:5]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Types_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
	: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
		
		$_t_MenuReference:=Create menu:C408
		If ($2="Input")
			Case of 
				: ($3="Workflow_Control_In")
					
			End case 
		Else 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_ApplytoSelectionItem:=Get localized string:C991("MenuItem_ApplytoSelection")
			$_t_MenuMethod:="DB_Applytoselected"
			$_l_MenuShortcut:=0
			$_t_MenuParameter:=String:C10($_l_TableNumber)
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_ApplytoSelectionItem; $_t_MenuMethod; $_t_MenuParameter; $_l_MenuShortcut)
			
		End if 
		
End case 
//TRACE
If ($_t_MenuReference#"")
	If (Not:C34($_bo_OverrideFunctions))
		If ($_l_TableNumber#Table:C252(->[SCRIPTS:80]))
			
			
			
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber)
			
			
			$_l_CountRecords:=Records in selection:C76([SCRIPTS:80])
			If (Count parameters:C259>=2)
				$_t_MenuTime:=$2
			Else 
				$_t_MenuTime:=""
			End if 
			If ($_t_MenuTime="Input")
				
				
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddToDataEntryFunctionsMenu:18=True:C214)
				
				
				
			Else 
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]AddtoFunctionsMenu:16=True:C214)
				
				
			End if 
			$_l_CountRecords2:=Records in selection:C76([SCRIPTS:80])
			
			If (<>FindMy)
				QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
				
				
			End if 
			QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1#"-"+"@")
			
			
			
			
			
			If (Records in selection:C76([SCRIPTS:80])>0)
				If ($_l_MenuItemCount>0)
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
					
				End if 
				
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; $_at_ScriptCodes; [SCRIPTS:80]Script_Name:2; $_at_ScriptNames)
				For ($_l_Index; 1; Size of array:C274($_at_ScriptCodes))
					$_t_MenuItem:=Uppers2($_at_ScriptNames{$_l_Index})
					$_t_MenuMethod:="DB_RunScript"
					$_l_MenuShortcut:=0
					$_t_MenuParameter:=$_at_ScriptCodes{$_l_Index}
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItem; $_t_MenuMethod; $_t_MenuParameter)
					
				End for 
			End if 
			If ($_l_CountRecords-$_l_CountRecords2>0)
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "Scripts Palette"; "SCPT_LaunchPalette")
			End if 
		End if 
		
		
	End if 
	If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
		DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; "(-"; ""; ""; 0)
		
		
		DB_MenuAppendItem($_t_MenuReference; Db_t_MenuType; "Export Data"; "EXP_CurrentData")
		
		//DB_MenuAppendItem ($_t_MenuReference;Db_t_MenuType;"Import Data";"IMP_CurrentData")
	End if 
	
	If ($_l_MenuItemCount>0)
		
		$0:=$_t_MenuReference
	Else 
		RELEASE MENU:C978($_t_MenuReference)
		$0:=""
	End if 
	
Else 
	$0:=""
End if 
//Funct
ERR_MethodTrackerReturn("DB_MenuCreateFunctionsMenu"; $_t_oldMethodName)
