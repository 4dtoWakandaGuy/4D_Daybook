//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCreateReportsMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2012 18:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
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
	C_BOOLEAN:C305(<>FindMy; $_bo_NoReports; $_bo_OverrideFunctions; DB_bo_DisplayStats; DB_bo_MenusInited; DB_bo_ModuleArrayInited)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_MenuItemCount; $_l_MenuShortCut; $_l_Row; $_l_ShortcutRow; $_l_SizeofArray; $_l_TableNumber; $1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_MenuItemName; $_t_MenuItemParameter; $_t_MenuMethod; $_t_MenuReference; $_t_MenuType; $_t_oldMethodName; $_t_ReportType; $_t_ShortcutCharacter; $_t_SubMenuName; $_t_SubMenuReference2)
	C_TEXT:C284($_t_ViewsMenuReference; $0; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCreateReportsMenu")
$0:=""
$_bo_NoReports:=False:C215
$_bo_OverrideFunctions:=False:C215
$_l_MenuItemCount:=0

If (Not:C34(DB_bo_ModuleArrayInited))
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
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
	: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
		If ($2="Input")
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408
				: ($_t_MenuType="menu string")
					$_t_MenuReference:=""
			End case 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintCompanywithDiaryItems")
			$_t_MenuMethod:="Companies_PrinD"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("P")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintCompanywithinfo")
			$_t_MenuMethod:="Companies_PrinQ"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("R")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; False:C215)
		Else 
			If ($2="Renumber") | ($2="Deduplicate")
				$_bo_NoReports:=True:C214
			End if 
			If (Not:C34($_bo_NoReports))
				Case of 
					: ($_t_MenuType="4D menu")
						$_t_MenuReference:=Create menu:C408
					: ($_t_MenuType="menu string")
						$_t_MenuReference:=""
				End case 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_ListCompanies")
				$_t_MenuMethod:="CO_PrintCoList"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_ProspectsReport")
				$_t_MenuMethod:="CO_prospectReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_Developmentreport")
				$_t_MenuMethod:="CO_PrintDevelopmentReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_Addressbook")
				$_t_MenuMethod:="CO_PrintAddressBook"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; False:C215)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
				QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
				If (Records in selection:C76([DOCUMENTS:7])>0)
					If (Count menu items:C405($_t_MenuReference)>0)
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
					$_t_MenuMethod:="DB_PrintReport"
					$_t_MenuItemParameter:=""
					$_l_MenuShortCut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				Else 
					If (Count menu items:C405($_t_MenuReference)>0)
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					End if 
				End if 
				
				$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
				$_t_MenuMethod:="DB_CreateReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
		If ($2="Input")
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408
				: ($_t_MenuType="menu string")
					$_t_MenuReference:=""
			End case 
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; False:C215)
		Else 
			If ($2="Renumber") | ($2="Deduplicate")
				$_bo_NoReports:=True:C214
			End if 
			If (Not:C34($_bo_NoReports))
				Case of 
					: ($_t_MenuType="4D menu")
						$_t_MenuReference:=Create menu:C408
					: ($_t_MenuType="menu string")
						$_t_MenuReference:=""
				End case 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_ListContacts")
				$_t_MenuMethod:="CONT_ContactsReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=Character code:C91("5")
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; False:C215)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
				QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
				If (Records in selection:C76([DOCUMENTS:7])>0)
					If (Count menu items:C405($_t_MenuReference)>0)
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
					$_t_MenuMethod:="DB_PrintReport"
					$_t_MenuItemParameter:=""
					$_l_MenuShortCut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				Else 
					If (Count menu items:C405($_t_MenuReference)>0)
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					End if 
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
				$_t_MenuMethod:="DB_CreateReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; False:C215)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PeriodBalancesList")
			$_t_MenuMethod:="ACC_PrintBalances"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			//$_t_MenuItemName:=Get localized string("MenuItem_PeriodBalancesReport") `this is not a report its a function to display the balances at the end of each period
			//$_t_MenuMethod:="ACC_PrintPeriodBalancesReport"
			//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuItemName)
			//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)
			//SET MENU ITEM PARAMETER($_t_MenuReference;-1;"Print")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TrialBalance")
			$_t_MenuMethod:="ACC_PrintTrialBalance"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLoss")
			$_t_MenuMethod:="ACC_PrintProfitLoss"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLossvsBudgets")
			$_t_MenuMethod:="ACC_PrintProfitLossVsBudgets"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLoss12Periods")
			$_t_MenuMethod:="ACC_PrintProfitLossoneyear"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_balanceSheet")
			$_t_MenuMethod:="ACC_PrintBalanceSheet"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			//$_t_MenuItemName:=Get localized string("MenuItem_balanceSheet")
			//$_t_MenuMethod:="ACC_PrintBalanceSheet"
			//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuItemName)
			//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)
			//SET MENU ITEM PARAMETER($_t_MenuReference;-1;"Print")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TaxReport")
			$_t_MenuMethod:="ACC_PrintTaxReturn"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TaxList")
			$_t_MenuMethod:="ACC_PrintTaxListing"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			//$_t_MenuItemName:=Get localized string("MenuItem_TaxListing")
			//$_t_MenuMethod:="ACC_PrintTaxListing"
			//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuItemName)
			//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)
			//SET MENU ITEM PARAMETER($_t_MenuReference;-1;"Print")
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; False:C215)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
		End if 
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				//MenuItem_PrintReport
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS_ANALYSES:157]))
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
	: ($_l_TableNumber=Table:C252(->[ACCOUNTS_LAYERS:156]))
	: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ADDRESS_FORMATS:74]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[AddressRecords:125]))
	: ($_l_TableNumber=Table:C252(->[ANALYSES:36]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[AREAS:3]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCT_BRANDS:8]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CONTRACT_TYPES:19]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListContracts")
			$_t_MenuMethod:="CON_PrintContractsList"
			$_t_MenuItemParameter:="Print"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[COUNTRIES:73]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CREDIT_STAGES:54]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				
			End if 
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
	: ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListCurrentStock")
			$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
			$_t_MenuMethod:="STK_CurrentStockReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
	: ($_l_TableNumber=Table:C252(->[DIARY:12]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			//TRACE  //`---the contect is wrong
			If (Count parameters:C259>=3)
				Case of 
					: ($3="Diary_PDTEditor")
						DB_MenuGetSRreports(Table:C252(->[ORDER_ITEMS:25]); True:C214; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
						
					Else 
						DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
				End case 
			Else 
				DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			End if 
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			
			$_t_MenuMethod:="DB_CreateReport"
			If (Count parameters:C259>=3)
				Case of 
					: ($3="Diary_PDTEditor")
						$_t_MenuItemParameter:=String:C10(Table:C252(->[ORDER_ITEMS:25]))
					Else 
						$_t_MenuItemParameter:=""
				End case 
			Else 
				$_t_MenuItemParameter:=""
			End if 
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListtimeManager")
			$_t_MenuMethod:="SD2_DiaryListReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_DiaryCallSummaries")
			$_t_MenuMethod:="SD2_DiaryCallSummaries"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			//DB_MenuGetSRreports ($_l_TableNumber;True;False;$_t_MenuType;$_t_MenuReference;False;True)
			//$_t_MenuItemName:=Get localized string("MenuItem_CreateReport")
			//$_t_MenuMethod:="DB_CreateReport"
			//$_t_MenuItemParameter:=""
			//$_l_MenuShortCut:=0
			//DB_MenuAppendItem ($_t_MenuReference;$_t_MenuType;$_t_MenuItemName;$_t_MenuMethod;$_t_MenuItemParameter;$_l_MenuShortCut)
		Else 
			If ($2#"Reports")
				COPY NAMED SELECTION:C331([DOCUMENTS:7]; "$Temp")
				DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
				
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
				$_t_MenuMethod:="DB_CreateReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				USE NAMED SELECTION:C332("$Temp")
			End if 
		End if 
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))  //only dispalyed in the context of a personnel record
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))  //not displayed in this form
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))  //not displayed in this form
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))  //not displayed in this form
	: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))  //not displayed in this form
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCT_GROUPS:10]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[HEADINGS:84]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
	: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_Print")
			$_t_MenuMethod:="Invoices_PPrint"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("P")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			//SET MENU ITEM PARAMETER($_t_MenuReference;-1;$SRCOde{$_l_Index})
			
			
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_SalesDaybook")
			$_t_MenuMethod:="INV_SalesDaybook"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListSalesLedger")
			$_t_MenuMethod:="INV_ListSalesLedger"
			
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_StatementsDueAmount")
			$_t_MenuMethod:="INV_StatementDueAmounts"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			If (False:C215)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_Statementofaccount")
				$_t_MenuMethod:="INV_SatementofAccount"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedDebtors")
			$_t_MenuMethod:="INV_PrintAgedDebtors"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedDebtorsAsAt")
			$_t_MenuMethod:="INV_PrintAgedDebtorsasat"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_EUSalesList")
			$_t_MenuMethod:="INV_PrintEUSalesList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[INVOICES_ITEMS:161]))
		If ($2="Input")
		Else 
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408
				: ($_t_MenuType="menu string")
					$_t_MenuReference:=""
			End case 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobPersonnel")
			$_t_MenuMethod:="JOB_PrintJobPersonnel"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Case of 
				: ($_t_MenuType="4D menu")
					$_t_MenuReference:=Create menu:C408
				: ($_t_MenuType="menu string")
					$_t_MenuReference:=""
			End case 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobTimesheets")
			$_t_MenuMethod:="JOB_PrintJobTimeSheets"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobTime")
			$_t_MenuMethod:="JOB_PrintJobTime"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobProductivity")
			$_t_MenuMethod:="JOB_PrintJobProductivity"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobStages")
			$_t_MenuMethod:="JOB_PrintJobStages"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[JOB_TYPES:65]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[JOBS:26]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListJobs")
			$_t_MenuMethod:="JOB_PrintJobs"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[LAYERS:76]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[LOCATIONS:61]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[SCRIPTS:80]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[MOVEMENT_TYPES:60]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Else 
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			If (Count menu items:C405($_t_MenuReference)>0)
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
			End if 
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListOrderitems")
			$_t_MenuMethod:="ORD_PrintOrderItemsList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_OutstandingOrderItems")
			$_t_MenuMethod:="ORD_PrintOutstandingItemsList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_l_MenuItemCount:=0
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)
				$_l_MenuItemCount:=$_l_MenuItemCount+1
				$_t_MenuItemName:=Get localized string:C991("MenuItem_QuotationForm")
				$_t_MenuMethod:="Orders_PPQtnF"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=Character code:C91("1")
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214)
				
				If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4)) & (False:C215)
					$_l_MenuItemCount:=$_l_MenuItemCount+1
					$_t_MenuItemName:=Get localized string:C991("MenuItem_QuotationWP")
					$_t_MenuMethod:="Orders_PPQtn"
					$_t_MenuItemParameter:=""
					$_l_MenuShortCut:=0
					DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)  //$CHar:=Character code("1")
					//SET MENU ITEM SHORTCUT($_t_MenuReference;-1;2;Shift key mask+512)
				End if 
			End if 
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_OrderAuthorisation")
			$_t_MenuMethod:="Orders_PPAuth"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("5")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214)
			$_t_MenuItemName:="-)"
			$_t_MenuMethod:=""
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_OrderAcknowledgement")
			$_t_MenuMethod:="Orders_PPAck"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("6")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_FullOrderDetails")
			$_t_MenuMethod:="Orders_PPFull"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("7")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ProFormaInvoice")
			$_t_MenuMethod:="Orders_PPProf"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("8")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CustomerLabel")
			$_t_MenuMethod:="Order_CustomerLabel"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=Character code:C91("9")
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			
			$_l_MenuItemCount:=$_l_MenuItemCount+1
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PackingLabels")
			$_t_MenuMethod:="Order_PrintLabels"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut; True:C214; 0)
			Case of 
				: ($_t_MenuType="4D menu")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; "")
				: ($_t_MenuType="menu string")
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			End case 
			If (False:C215)
				$_t_SubMenuName:=""
				$_t_SubMenuName:=Get localized string:C991("MenuItem_DeliveryNoteUC")
				Case of 
					: ($_t_MenuType="4D menu")
						$_t_SubMenuReference2:=Create menu:C408
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_SubMenuName; $_t_SubMenuReference2)
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
				$_l_MenuShortCut:=Character code:C91("1")
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_SubMenuReference2; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_SubMenuReference2; -1; $_t_MenuMethod)
						//SET MENU ITEM SHORTCUT($_t_SubMenuReference2;-1;"1";2048+512)
						$_l_MenuShortCut:=Character code:C91("1")
					: ($_t_MenuType="menu string")
						$_l_SizeofArray:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
						INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_SizeofArray; 1)
						DB_at_Submenuitem{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemName
						DB_at_SubMenuShortCut{$_l_Row}{$_l_SizeofArray}:=""
						DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_SizeofArray}:=0
						DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_SizeofArray}:=$_t_MenuMethod
						DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemParameter
						$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
						$_l_MenuShortCut:=Character code:C91("1")
				End case 
				//```
				//cant use the generic validation here-different arrays
				If ($_l_MenuShortCut>0)
					Case of 
						: ($_l_MenuShortCut=Character code:C91("F"))
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_ShortcutRow<0)
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; "F"; 2048)
									: ($_t_MenuType="menu string")
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							End if 
						Else 
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_ShortcutRow>0)
									$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_ShortcutRow<0)
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_l_MenuShortCut)
									: ($_t_MenuType="menu string")
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							End if 
					End case 
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_ItemsbyDate")
				$_t_MenuMethod:="Orders_PPDelD"
				$_l_MenuShortCut:=Character code:C91("2")
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_SubMenuReference2; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_SubMenuReference2; -1; $_t_MenuMethod)
						//SET MENU ITEM SHORTCUT($_t_SubMenuReference2;-1;"1";2048+512)
						$_l_MenuShortCut:=Character code:C91("2")
					: ($_t_MenuType="menu string")
						$_l_SizeofArray:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
						INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_SizeofArray; 1)
						DB_at_Submenuitem{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemName
						DB_at_SubMenuShortCut{$_l_Row}{$_l_SizeofArray}:=""
						DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_SizeofArray}:=0
						DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_SizeofArray}:=$_t_MenuMethod
						DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemParameter
						$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
						$_l_MenuShortCut:=Character code:C91("2")
				End case 
				//```
				//cant use the generic validation here-different arrays
				If ($_l_MenuShortCut>0)
					Case of 
						: ($_l_MenuShortCut=Character code:C91("F"))
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_ShortcutRow<0)
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; "F"; 2048)
									: ($_t_MenuType="menu string")
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							End if 
						Else 
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_ShortcutRow>0)
									$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_ShortcutRow<0)
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_l_MenuShortCut)
									: ($_t_MenuType="menu string")
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							End if 
					End case 
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_allnotDelivered")
				$_t_MenuMethod:="Orders_PPDelA"
				$_l_MenuShortCut:=Character code:C91("3")
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_SubMenuReference2; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_SubMenuReference2; -1; $_t_MenuMethod)
						//SET MENU ITEM SHORTCUT($_t_SubMenuReference2;-1;"1";2048+512)
						$_l_MenuShortCut:=Character code:C91("3")
					: ($_t_MenuType="menu string")
						$_l_SizeofArray:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
						INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_SizeofArray; 1)
						DB_at_Submenuitem{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemName
						DB_at_SubMenuShortCut{$_l_Row}{$_l_SizeofArray}:=""
						DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_SizeofArray}:=0
						DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_SizeofArray}:=$_t_MenuMethod
						DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemParameter
						$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
						$_l_MenuShortCut:=Character code:C91("3")
				End case 
				//```
				//cant use the generic validation here-different arrays
				If ($_l_MenuShortCut>0)
					Case of 
						: ($_l_MenuShortCut=Character code:C91("F"))
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_ShortcutRow<0)
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; "F"; 2048)
									: ($_t_MenuType="menu string")
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							End if 
						Else 
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_ShortcutRow>0)
									$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_ShortcutRow<0)
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_l_MenuShortCut)
									: ($_t_MenuType="menu string")
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							End if 
					End case 
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_SelectedItems")
				$_t_MenuMethod:="Orders_PPDelS"
				$_l_MenuShortCut:=Character code:C91("4")
				Case of 
					: ($_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_SubMenuReference2; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_SubMenuReference2; -1; $_t_MenuMethod)
						//SET MENU ITEM SHORTCUT($_t_SubMenuReference2;-1;"1";2048+512)
						$_l_MenuShortCut:=Character code:C91("4")
					: ($_t_MenuType="menu string")
						$_l_SizeofArray:=Size of array:C274(DB_at_Submenuitem{$_l_Row})+1
						INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_Row}; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_Row}; $_l_SizeofArray; 1)
						DB_at_Submenuitem{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemName
						DB_at_SubMenuShortCut{$_l_Row}{$_l_SizeofArray}:=""
						DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_SizeofArray}:=0
						DB_at_SubMenu1Item4DFunction{$_l_Row}{$_l_SizeofArray}:=$_t_MenuMethod
						DB_at_SubMenu1ItemParameter{$_l_Row}{$_l_SizeofArray}:=$_t_MenuItemParameter
						$_l_Column:=Size of array:C274(DB_at_SubMenuShortCut{$_l_Row})
						$_l_MenuShortCut:=Character code:C91("4")
				End case 
				//```
				//cant use the generic validation here-different arrays
				If ($_l_MenuShortCut>0)
					Case of 
						: ($_l_MenuShortCut=Character code:C91("F"))
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_ShortcutRow<0)
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; "F"; 2048)
									: ($_t_MenuType="menu string")
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:="F"
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							End if 
						Else 
							$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							If ($_l_ShortcutRow>0)
								$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_ShortcutRow>0)
									$_l_ShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_ShortcutRow<0)
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: ($_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048+512)
											: ($_t_MenuType="menu string")
												DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									Else 
										//dont add the short cut
									End if 
								Else 
									$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: ($_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_t_ShortcutCharacter; 2048)
										: ($_t_MenuType="menu string")
											DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								End if 
							Else 
								Case of 
									: ($_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_SubMenuReference2; -1; $_l_MenuShortCut)
									: ($_t_MenuType="menu string")
										$_t_ShortcutCharacter:=Char:C90($_l_MenuShortCut)
										DB_at_SubMenuShortCut{$_l_Row}{$_l_Column}:=$_t_ShortcutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_Row}{$_l_Column}:=2048
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							End if 
					End case 
				End if 
			End if 
			
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListEnquiryWriter")
			$_t_MenuMethod:="ORD_PrintEnquiries"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_SourcesStatistics")
			$_t_MenuMethod:="ORD_PrintSource"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListOrders")
			$_t_MenuMethod:="ORD_PrintOrderList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_GrossMarginReport")
			$_t_MenuMethod:="ORD_PrintOrdersMargins"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_OrdersForecasts")
			$_t_MenuMethod:="ORD_PrintOrdersForecast"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:="-)"
			$_t_MenuMethod:=""
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			If (DB_GetModuleSettingByNUM(Module_WPManager)>=2) & (DB_GetModuleSettingByNUM(Module_WPManager)#3)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintQuotationsWP")
				$_t_MenuMethod:="Orders_PPQtnN"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintQuotations")
			$_t_MenuMethod:="Orders_PPQtnF"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintAuthorisation")
			$_t_MenuMethod:="Orders_PPAuth"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintAcknowledgment")
			$_t_MenuMethod:="Orders_PPAck"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintFullOrderDetaiils")
			$_t_MenuMethod:="Orders_PPFull"
			
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			If (False:C215)
				$_t_MenuItemName:="-)"
				$_t_MenuMethod:=""
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintDeliveryNotAllocated")
				$_t_MenuMethod:="Orders_PPDelL"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintDeliveryByDate")
				$_t_MenuMethod:="Orders_PPDelD"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintDeliverynotDelivered")
				$_t_MenuMethod:="Orders_PPDelA"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PERIODS:33]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PERSONNEL_GROUPS:92]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PERSONNEL:11]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PICTURES:85]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[POSTAL_CODES:50]))
	: ($_l_TableNumber=Table:C252(->[PRICE_GROUPS:18]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PRICE_TABLE:28]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PriceList")
			$_t_MenuMethod:="PRD_PrintPriceList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Case of 
				: ($_t_MenuType="4D menu")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; "")
				: ($_t_MenuType="menu string")
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			End case 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PROBLEMS:22]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListProducts")
			$_t_MenuMethod:="PRD_PrintProductsList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			Case of 
				: ($_t_MenuType="4D menu")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "")
					SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; "")
				: ($_t_MenuType="menu string")
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			End case 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ReorderingReport")
			$_t_MenuMethod:="STK_PrintStockReorderingReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PriceList")
			$_t_MenuMethod:="PRD_PrintProductsPriceList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			If (DB_GetModuleSettingByNUM(Module_WPManager)>=2) & (DB_GetModuleSettingByNUM(Module_WPManager)#3)
				$_t_MenuItemName:=Get localized string:C991("MenuItem_QuotationWP")
				$_t_MenuMethod:="Projects_PPQtn"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PUBLICATIONS:52]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintPurchaseOrder")
			$_t_MenuMethod:="PurchOrd_PPrint"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ListPurchaseOrders")
			$_t_MenuMethod:="PO_PrintPurchaseOrdersList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_OutstandingPurchaseOrderItems")
			$_t_MenuMethod:="PO_PrintOutstandingPOItemsList"  //Note this report does not exist at the moment!
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_Print")
			$_t_MenuMethod:="Purch_PPrint"  //Note this report does not exist at the moment!
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PurchasesDaybook")
			$_t_MenuMethod:="PUR_PrintPIDaybook"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PurchasesList")
			$_t_MenuMethod:="PUR_PrintPIList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedCreditorsReport")
			$_t_MenuMethod:="PUR_PrintAgedCreditors"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedCreditorsasatReport")
			$_t_MenuMethod:="PUR_PrintAgedasatCreditors"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[RECURRING_JOURNALS:38]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[RESULTS:14]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[ROLES:87]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
	: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CallSheets")
			$_t_MenuMethod:="SVS_PrintCallSheets"
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CallsList")
			$_t_MenuMethod:="SVS_PrintCallsList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[SOLUTIONS:23]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[SOURCES:6]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STAGES:45]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STATUS:4]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_StockItemsList")
			$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
			$_t_MenuMethod:="STK_PrintItemsList"  //²
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_LevelsValues")
			$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
			$_t_MenuMethod:="STK_PrintStockLevels"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintMovement")
			$_t_MenuMethod:="Movements_Print"  //Note this report does not exist at the moment!
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_MovementsList")
			$_t_MenuMethod:="STK_PrintStockMovementsList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AssembliesBOM")
			$_t_MenuMethod:="STK_PrintBOM"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[STOCK_TYPES:59]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TAX_CODES:35]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TIME_BUDGETS:49]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintTransactionsBatch")
			$_t_MenuMethod:="TransB_Print"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)  //SET MENU ITEM SHortcut($_t_MenuReference;-1;$SRCOde{$_l_Index})
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_AuditTrail")
			$_t_MenuMethod:="ACC_PrintAuditTrail"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)  //$_t_MenuItemName:=Get localized string("MenuItem_TransBatches")
			//$_t_MenuMethod:="ACC_PrintTransBatchList"
			//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuItemName)
			//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TransBatches")
			$_t_MenuMethod:="ACC_PrintTransBatchList"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTION_TYPES:31]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			//TRACE
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TransByDate")
			$_t_MenuMethod:="ACC_PrintTrans"
			$_t_MenuItemParameter:="1"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TransByType")
			$_t_MenuMethod:="ACC_PrintTrans"
			$_t_MenuItemParameter:="2"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_TransByAcct")
			$_t_MenuMethod:="ACC_PrintTrans"
			$_t_MenuItemParameter:="3"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			$_t_MenuItemName:="Transactions By.."
			$_t_MenuMethod:="ACC_PrintTrans"
			$_t_MenuItemParameter:="4"
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			//$_t_MenuItemName:=Get localized string("MenuItem_TransactionsReport")
			//$_t_MenuMethod:="ACC_PrintTrans"
			//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuItemName)
			//SET MENU ITEM METHOD($_t_MenuReference;-1;$_t_MenuMethod)
			//SET MENU ITEM PARAMETER($_t_MenuReference;-1;"4")
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; True:C214; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[TYPES:5]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
	: ($_l_TableNumber=Table:C252(->[WORKFLOW_CONTROL:51]))
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		Case of 
			: ($_t_MenuType="4D menu")
				$_t_MenuReference:=Create menu:C408
			: ($_t_MenuType="menu string")
				$_t_MenuReference:=""
		End case 
		If ($2="Input")
			DB_MenuGetSRreports($_l_TableNumber; True:C214; False:C215; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		Else 
			DB_MenuGetSRreports($_l_TableNumber; False:C215; True:C214; $_t_MenuType; $_t_MenuReference; False:C215; True:C214)
			
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
			QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=$_l_TableNumber)
			If (Records in selection:C76([DOCUMENTS:7])>0)
				If (Count menu items:C405($_t_MenuReference)>0)
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				End if 
				$_t_MenuItemName:=Get localized string:C991("MenuItem_PrintReport")
				$_t_MenuMethod:="DB_PrintReport"
				$_t_MenuItemParameter:=""
				$_l_MenuShortCut:=0
				DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
			End if 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_CreateReport")
			$_t_MenuMethod:="DB_CreateReport"
			$_t_MenuItemParameter:=""
			$_l_MenuShortCut:=0
			DB_MenuAppendItem($_t_MenuReference; $_t_MenuType; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuItemParameter; $_l_MenuShortCut)
		End if 
End case 
If ($_t_MenuReference#"")
	//``
	If ($2#"input")
		Case of 
			: ($_t_MenuType="4D menu")
				INSERT MENU ITEM:C412($_t_MenuReference; -1; "Print Current Form")
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_PrintForm")
			: ($_t_MenuType="menu string")
				APPEND TO ARRAY:C911(DB_at_menuitem; "Print Current Form")
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_PrintForm")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
		End case 
	End if 
	If (Not:C34($_bo_OverrideFunctions))
		If ($_l_TableNumber#Table:C252(->[SCRIPTS:80]))
			
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_TableNumber; *)
			If (Count parameters:C259>=2)
				$_t_ReportType:=$2
			Else 
				$_t_ReportType:=""
			End if 
			If ($_t_ReportType="Input")
				QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]Same_Process:6=True:C214; *)
				QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]AddtoDataEntryReportsMenu:17=True:C214; *)
			Else 
				QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]AddtoReportsMenu:15=True:C214; *)
			End if 
			If (<>FindMy)
				QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials; *)
			End if 
			QUERY SELECTION:C341([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"-"+"@")
			If (Records in selection:C76([SCRIPTS:80])>0)
				If ($_l_MenuItemCount>0)
					Case of 
						: ($_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; $_at_ScriptCodes; [SCRIPTS:80]Script_Name:2; $_at_ScriptNames)
				For ($_l_Index; 1; Size of array:C274($_at_ScriptCodes))
					Case of 
						: ($_t_MenuType="4D menu")
							$_l_MenuItemCount:=$_l_MenuItemCount+1
							INSERT MENU ITEM:C412($_t_MenuReference; -1; Uppers2($_at_ScriptNames{$_l_Index}))
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_RunScript")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_at_ScriptCodes{$_l_Index})
						: ($_t_MenuType="menu string")
							APPEND TO ARRAY:C911(DB_at_menuitem; Uppers2($_at_ScriptNames{$_l_Index}))
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_RunScript")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_at_ScriptCodes{$_l_Index})
					End case 
				End for 
			End if 
		End if 
	End if 
	If (DB_bo_DisplayStats)
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "Print Statistics")
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "StatsView_Print")
		INSERT MENU ITEM:C412($_t_MenuReference; -1; "Export Statistics")
		SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "StatsView_Exp")
	End if 
	$0:=$_t_MenuReference
Else 
	$0:=""
End if 
$0:=$_t_MenuReference
ERR_MethodTrackerReturn("DB_MenuCreateReportsMenu"; $_t_oldMethodName)