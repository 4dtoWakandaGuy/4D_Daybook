//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BuildModuleMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/05/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>StatesLoaded)
	ARRAY BOOLEAN:C223($_abo_HeadersDone; 0)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	//ARRAY LONGINT(DB_al_SubMenuShortCutmodifier;0;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_MenuElements; 0)
	ARRAY TEXT:C222($_at_MenuHeaders; 0)
	ARRAY TEXT:C222($_at_SubMenuReference; 0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	//ARRAY TEXT(DB_at_SubMenu1Item4DFunction;0;0)
	//ARRAY TEXT(DB_at_SubMenu1ItemParameter;0;0)
	//ARRAY TEXT(DB_at_Submenuitem;0;0)
	//ARRAY TEXT(DB_at_SubMenuReference;0)
	//ARRAY TEXT(DB_at_SubMenuShortCut;0;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_BatchBreakSet; $_bo_InsertBreak; $_bo_MenuNewProcess; $_bo_ProspectsEnabled; DB_bo_MenusInited; DB_bo_ModuleArrayInited; <>OneEntry; $_bo_BatchBreakSet; $_bo_InsertBreak; $_bo_MenuNewProcess)
	C_BOOLEAN:C305($_bo_ProspectsEnabled; DB_bo_MenusInited; DB_bo_ModuleArrayInited)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_MenuArraySize; $_l_MenuShortCut; $_l_MenuShortCutPosition; $_l_MenuShortCutPositionSub; $_l_NumberofColumns; DB_l_CurrentDisplayedForm; <>PER_l_AccessLevel; $_l_CurrentRow; $_l_Index)
	C_LONGINT:C283($_l_MenuArraySize; $_l_MenuShortCut; $_l_MenuShortCutPosition; $_l_MenuShortCutPositionSub; $_l_NumberofColumns; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_Companies; $_t_Contacts; $_t_Contracts; $_t_CreditNotes; $_t_Deposits; $_t_dissassembly; $_t_EnquiriesName; $_t_Invoices; $_t_Jobs; $_t_MenuHeaderName; $_t_MenuName)
	C_TEXT:C284($_t_MenuParameter; $_t_MenuReference; $_t_MethodName; $_t_NewOrderName; $_t_oldMethodName; $_t_Prices; $_T_Products; $_t_Proformas; $_t_Projects; $_t_PurchaseCredits; $_t_PurchaseOrders)
	C_TEXT:C284($_t_PurchasePayment; $_t_PurchasePrePayment; $_t_Purchases; $_t_QuotationsName; $_t_ServiceCalls; $_t_ShortCutCharacter; $_t_StockMovements; $_t_Transin; $1; Db_t_MenuType; $_t_Assembly)
	C_TEXT:C284($_t_Companies; $_t_Contacts; $_t_Contracts; $_t_CreditNotes; $_t_Deposits; $_t_dissassembly; $_t_EnquiriesName; $_t_Invoices; $_t_Jobs; $_t_MenuHeaderName; $_t_MenuItemName)
	C_TEXT:C284($_t_MenuName; $_t_MenuParameter; $_t_MenuReference; $_t_MethodName; $_t_NewOrderName; $_t_oldMethodName; $_t_Prices; $_T_Products; $_t_Proformas; $_t_Projects; $_t_Prospects)
	C_TEXT:C284($_t_PurchaseCredits; $_t_PurchaseOrders; $_t_PurchasePayment; $_t_PurchasePrePayment; $_t_Purchases; $_t_QuotationsName; $_t_ServiceCalls; $_t_ShortCutCharacter; $_t_StockMovements; $_t_Transin; $0)
	C_TEXT:C284($1; Db_t_MenuType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BuildModuleMenu"; Form event code:C388)
$_bo_MenuNewProcess:=False:C215
If (Db_t_MenuType="")
	Db_t_MenuType:="4D menu"
End if 
If (<>OneEntry)
	$_T_Products:=Get localized string:C991("MenuItem_Product")
	$_t_Companies:=Get localized string:C991("MenuItem_Company")
	$_t_Contacts:=Get localized string:C991("MenuItem_Contact")
	$_t_Prices:=Get localized string:C991("MenuItem_Price")
	$_t_StockMovements:=Get localized string:C991("MenuItem_StockMovement")
	$_t_Assembly:=Get localized string:C991("MenuItem_Assembly")
	$_t_dissassembly:=Get localized string:C991("MenuItem_Disassembly")
	$_t_Proformas:=Get localized string:C991("MenuItem_Proforma")
	$_t_Invoices:=Get localized string:C991("MenuItem_Invoice")
	$_t_CreditNotes:=Get localized string:C991("MenuItem_CreditNote")
	$_t_CreditNotes:=Term_SLPLWT($_t_CreditNotes)
	$_t_Deposits:=Get localized string:C991("MenuItem_Deposit")
	$_t_Transin:=Get localized string:C991("MenuItem_TransBatch")
	$_t_ServiceCalls:=Get localized string:C991("MenuItem_ServiceCall")
	$_t_Contracts:=Get localized string:C991("MenuItem_Contract")
	$_t_Prospects:=Get localized string:C991("MenuItem_Prospect")
	$_t_Projects:=Get localized string:C991("MenuItem_Project")
	$_t_Jobs:=Get localized string:C991("MenuItem_Job")
	$_t_Purchases:=Get localized string:C991("MenuItem_PurchaseInvoice")
	$_t_PurchaseCredits:=Get localized string:C991("MenuItem_PurchaseCredit")
	$_t_PurchasePrePayment:=Get localized string:C991("MenuItem_PurchasePrepayment")
	$_t_PurchasePayment:=Get localized string:C991("MenuItem_PurchasePayment")
	$_t_PurchaseOrders:=Get localized string:C991("MenuItem_PurchaseOrder")
	
Else 
	$_T_Products:=Get localized string:C991("MenuItem_Products")
	$_t_Companies:=Get localized string:C991("MenuItem_Companies")
	$_t_Contacts:=Get localized string:C991("MenuItem_Contacts")
	$_t_Prices:=Get localized string:C991("MenuItem_Prices")
	$_t_StockMovements:=Get localized string:C991("MenuItem_StockMovements")
	$_t_Assembly:=Get localized string:C991("MenuItem_Assemblies")
	$_t_dissassembly:=Get localized string:C991("MenuItem_Disassemblies")
	$_t_Invoices:=Get localized string:C991("MenuItem_Invoices")
	$_t_Proformas:=Get localized string:C991("MenuItem_Proformas")
	$_t_CreditNotes:=Get localized string:C991("MenuItem_CreditNotes")
	$_t_CreditNotes:=Term_SLPLWT($_t_CreditNotes)
	$_t_Deposits:=Get localized string:C991("MenuItem_Deposits")
	$_t_Transin:=Get localized string:C991("MenuItem_TransBatches")
	$_t_ServiceCalls:=Get localized string:C991("MenuItem_ServiceCalls")
	$_t_Contracts:=Get localized string:C991("MenuItem_Contracts")
	$_t_Prospects:=Get localized string:C991("MenuItem_Prospects")
	$_t_Projects:=Get localized string:C991("MenuItem_Projects")
	$_t_Jobs:=Get localized string:C991("MenuItem_Jobs")
	$_t_Purchases:=Get localized string:C991("MenuItem_PurchaseInvoices")
	$_t_PurchaseCredits:=Get localized string:C991("MenuItem_PurchaseCredit")
	$_t_PurchasePrePayment:=Get localized string:C991("MenuItem_PurchasePrepayments")
	$_t_PurchasePayment:=Get localized string:C991("MenuItem_PurchasePayment")
	$_t_PurchaseOrders:=Get localized string:C991("MenuItem_PurchaseOrders")
	
End if 
If (Not:C34(DB_bo_ModuleArrayInited))
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	DB_bo_ModuleArrayInited:=True:C214
	DB_bo_MenusInited:=False:C215
End if 

$_t_MenuName:=$1
ARRAY TEXT:C222($_at_MenuElements; 0)

For ($_l_Index; 2; Count parameters:C259)
	APPEND TO ARRAY:C911($_at_MenuElements; ${$_l_Index})
End for 
Case of 
	: (Db_t_MenuType="4D menu")
		$_t_MenuReference:=Create menu:C408
	: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
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
		
		
		//``
		$_t_MenuReference:=""  //this will be a textual representation of the menu
		
		
	Else 
		//TRACE
End case 
Case of 
	: ($_t_MenuName="Companies")
		
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Companies")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_Companies
					$_t_MethodName:="DB_MenuNewRecord"
					
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[COMPANIES:2])
					
					$_l_MenuShortCut:=Character code:C91("[")
					
					
				: ($_at_MenuElements{$_l_Index}="View Companies")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Companies")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[COMPANIES:2])
					$_l_MenuShortCut:=Character code:C91("]")
				: ($_at_MenuElements{$_l_Index}="Enter Contacts")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_Contacts
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTACTS:1])
					
					$_l_MenuShortCut:=Character code:C91("\\")
				: ($_at_MenuElements{$_l_Index}="View Contacts")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contacts")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTACTS:1])
					$_l_MenuShortCut:=Character code:C91("/")
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				
				
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
	: ($_t_MenuName="Products")
		
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MethodName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Products")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_T_Products
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRODUCTS:9])
					$_l_MenuShortCut:=Character code:C91("P")
					
					
				: ($_at_MenuElements{$_l_Index}="View Products")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Products")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRODUCTS:9])
					
					$_l_MenuShortCut:=Character code:C91("R")
				: ($_at_MenuElements{$_l_Index}="Enter to Price Table")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
						
						
						$_bo_InsertBreak:=True:C214
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_Prices
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRICE_TABLE:28])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="View Price Table")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_PriceTable")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRICE_TABLE:28])
						$_l_MenuShortCut:=0
					End if 
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
	: ($_t_MenuName="Time Management")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter in Time Manager")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Enterincalendar")
					//$_t_MethodName:="zDiary_InCalendar"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryCalendar"
					$_l_MenuShortCut:=Character code:C91("D")
					
				: ($_at_MenuElements{$_l_Index}="Enter in Workflow")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterinWorkflow")
					//$_t_MethodName:="zDiary_inWorkflow"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryWorkflow"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Enter Completed Activity")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Entercompleted")
					//$_t_MethodName:="ZDiary_In"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryCompleted"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Automated Action")
					//$_t_MenuItemName:=Get localized string("MenuItem_Automatedactions")
					//$_t_MethodName:="DB_MenuNewRecord"
					//$_t_MenuParameter:="DiaryAutomated"
					
					//$_t_MethodName:="ZDiary_In"
					//$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="View Workflow Tasks")
					//$_bo_InsertBreak:=True
					//$_t_MenuItemName:=Get localized string("MenuItem_ViewWorkflow")
					//$_t_MethodName:="SD_l_ShowWorkflow"
					//$_l_MenuShortCut:=Character code("G")
					//$_t_MenuParameter:=""
				: ($_at_MenuElements{$_l_Index}="VIew Calendar")
					//$_t_MenuItemName:=Get localized string("MenuItem_ViewCalendar")
					//$_t_MethodName:="ZDiary_Mod"
					//$_l_MenuShortCut:=Character code("H")
					//$_t_MenuParameter:=""
				: ($_at_MenuElements{$_l_Index}="VIew Time Mangaer")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewHistory")
					$_t_MethodName:="SD_l_ShowHistory"
					$_l_MenuShortCut:=Character code:C91("I")
					$_t_MenuParameter:=""
				: ($_at_MenuElements{$_l_Index}="View Automated Actions")
					//$_t_MenuItemName:=Get localized string("MenuItem_ViewAutomatedActions")
					//$_t_MethodName:=""
					//$_l_MenuShortCut:=0
					//$_t_MenuParameter:=""
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
	: ($_t_MenuName="Enquiries")
		If (Not:C34(<>StatesLoaded))
			States_Load
		End if 
		$_bo_ProspectsEnabled:=False:C215
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Prospects")
					If (DB_GetModuleSettingByNUM(14)>=2)
						$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterProspects")
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTACTS:1])
						$_l_MenuShortCut:=0
						$_bo_ProspectsEnabled:=True:C214
					End if 
					
				: ($_at_MenuElements{$_l_Index}="View Prospects")
					If (DB_GetModuleSettingByNUM(14)>=2)
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewProspects")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="ContactsProspects"
						//$_t_MethodName:="ZContacts_ModE"
						$_l_MenuShortCut:=0
						$_bo_ProspectsEnabled:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="Enter Enquiries")
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
						
						
						If ($_bo_ProspectsEnabled)
							$_bo_InsertBreak:=True:C214
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterEnquiries")
						If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=1)
							$_t_EnquiriesName:=Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 25)
							$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_EnquiriesName
						Else 
							$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterEnquiries")
						End if 
						$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:="OrdersEnquiries"
						
						//$_t_MethodName:="ZOrders_InE"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Enter Quotations")
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
						
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterEnquiries")
						If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
							$_t_QuotationsName:=Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 25)
							$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_QuotationsName
						Else 
							$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterQuotations")
						End if 
						$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
						//$_t_MethodName:="ZOrders_InQ"
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:="OrdersQuotations"
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Enter New Orders")
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
						
						
						
						
						If (Size of array:C274(<>SYS_at_RecStateCodes{24})>3)
							$_t_NewOrderName:=Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 25)
							$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_NewOrderName
						Else 
							$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterNewOrders")
						End if 
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[ORDERS:24])
						
						//$_t_MethodName:="ZOrders_InV"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="View Enquiry Writer")
					
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
						
						
						
						$_bo_InsertBreak:=True:C214
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewEnquiryWriter")
						
						$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="OrdersEnquiries"
						
						
						$_l_MenuShortCut:=0
					End if 
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
	: ($_t_MenuName="Documents")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Letters")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterLetters")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryLetter"
					//$_t_MethodName:="ZDiary_InL"
					$_l_MenuShortCut:=Character code:C91("S")
					
					
				: ($_at_MenuElements{$_l_Index}="Enter Quotations")
					If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2))
						
						
					Else 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterQuotations")
						$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
						//$_t_MethodName:="ZDiary_InQ"
						$_t_MethodName:="DB_MenuNewRecord"
						$_t_MenuParameter:="DiaryQuotations"
						
						$_l_MenuShortCut:=Character code:C91("T")
					End if 
				: ($_at_MenuElements{$_l_Index}="Enter Emai") | ($_at_MenuElements{$_l_Index}="Enter E-mail")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterEmail")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryEmail"
					//$_t_MethodName:="zDiary_InEmail"
					$_l_MenuShortCut:=Character code:C91("U")
				: ($_at_MenuElements{$_l_Index}="View Letters & Quotes")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewLetters")
					$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DiaryLetters"
					
					//$_t_MethodName:="ZDiary_ModL"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Letter Templates")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterLetTemplates")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DocumentsLetters"
					//$_t_MethodName:="ZLetters_In"
					$_l_MenuShortCut:=Character code:C91("D")
				: ($_at_MenuElements{$_l_Index}="Enter Report Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterSRTemplates")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DocumentsReports"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Email Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnteremailTemplates")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DocumentsEmails"
					
					//$_t_MethodName:="ZSuperReport_In"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Letter Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewLetTemplates")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DocumentsLetterTemplates"
					
					//$_t_MethodName:="ZLetters_Mod_1"
					$_l_MenuShortCut:=Character code:C91("E")
				: ($_at_MenuElements{$_l_Index}="View Report Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewReportTemplates")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DocumentsReportTemplates"
					
					//$_t_MethodName:="zLetters_Mod_2"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Email Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewEmailTemplates")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DocumentsEmailTemplates"
					
					//$_t_MethodName:="zLetters_Mod_3"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="VIew Other Templates")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewOtherTemplates")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DocumentsTemplatesOthers"
					//$_t_MethodName:="ZLetters_Mod"
					$_l_MenuShortCut:=0
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
	: ($_t_MenuName="Mailing")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Mail_Companies")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_MailCompanies")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="CompaniesMailing"
					//$_t_MethodName:="ZMail_Comp"
					$_l_MenuShortCut:=Character code:C91("*")
					
					
				: ($_at_MenuElements{$_l_Index}="Mail_Contacts")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_MailContacts")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="ContactsMailing"
					
					
					$_l_MenuShortCut:=Character code:C91("-")
				: ($_at_MenuElements{$_l_Index}="Mail_Diary")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_MailDiary")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DiaryMailing"
					
					$_l_MenuShortCut:=Character code:C91("+")
				: ($_at_MenuElements{$_l_Index}="Enquiries Qtns, Orders") | ($_at_MenuElements{$_l_Index}="Quotations")
					
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_QTnOrders")
					$_t_MenuItemName:=Term_OrdWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="OrdersMailing"
					//$_t_MethodName:="ZMail_Ord"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Payments Chasing")
					If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)  //Sales Ledger"
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_PaymentsChasing")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="InvoicesChasing"
						//$_t_MethodName:="ZMail_InvA"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Statements")
					If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Statements")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="InvoicesStatementMailing"
						
						//$_t_MethodName:="ZMail_State"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Contracts")
					If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>=2)
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Contracts")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="ContractsMailing"
						
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Subscription Renewals") | ($_at_MenuElements{$_l_Index}="Renewals Mailing")
					If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>=2)  //Subscriptions"
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_SubscriptionRenewal")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="SubscriptionsRenewalMailing"
						
						//$_t_MethodName:="ZMail_Subs"
						$_l_MenuShortCut:=0
					End if 
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
	: ($_t_MenuName="Inventory")  //(Stock)
		
		
		
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Movements")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterMovements")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[STOCK_MOVEMENTS:40])
					
					$_l_MenuShortCut:=Character code:C91("S")
					
					
				: ($_at_MenuElements{$_l_Index}="View Movements")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewMovements")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[STOCK_MOVEMENTS:40])
					$_l_MenuShortCut:=Character code:C91("T")
				: ($_at_MenuElements{$_l_Index}="View Inventory Items")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewMovementItems")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[STOCK_MOVEMENT_ITEMS:27])
					$_l_MenuShortCut:=Character code:C91("I")
				: ($_at_MenuElements{$_l_Index}="View Inventory History")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewStockHistory")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Stock ItemsHistory"
					//$_t_MethodName:="ZStock_Hist"
					$_l_MenuShortCut:=Character code:C91("H")
				: ($_at_MenuElements{$_l_Index}="View Current Inventory")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewCurrentStock")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CURRENT_STOCK:62])
					
					$_l_MenuShortCut:=Character code:C91("J")
				: ($_at_MenuElements{$_l_Index}="View Inventory Levels")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewConsolidatedLevels")
					$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
					//$_t_MethodName:="ZStockLev_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[STOCK_LEVELS:58])
					
					$_l_MenuShortCut:=Character code:C91("L")
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
			End if 
		End for 
		
		
	: ($_t_MenuName="Assemblies")
		$_bo_InsertBreak:=False:C215
		$_t_MenuItemName:=""
		$_t_MenuParameter:=""
		$_l_MenuShortCut:=0
		$_t_MethodName:=""
		
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Assembly")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Assembly")
					
					
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="StockMovementsAssembly"
					
					$_l_MenuShortCut:=Character code:C91("A")
					
					
				: ($_at_MenuElements{$_l_Index}="Dissassembly")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Disassembly")
					
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="StockMovementsDissasembly"
					
					$_l_MenuShortCut:=Character code:C91("D")
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
			End if 
		End for 
		
	: ($_t_MenuName="Subscriptions")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Issue Deliveries")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_IssueDeliveries")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="OrderItemsSubsDelivery"
					
					//$_t_MethodName:="ZSubscript_Del"
					$_l_MenuShortCut:=Character code:C91("Y")
					
					
				: ($_at_MenuElements{$_l_Index}="Subscription Billing")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SubBilling")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="OrderItemsSubsBilling"
					
					//$_t_MethodName:="ZSubscript_Inv"
					$_l_MenuShortCut:=Character code:C91("U")
				: ($_at_MenuElements{$_l_Index}="Subscription Renewal") | ($_at_MenuElements{$_l_Index}="Renewals Mailing")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_SubscriptionRenewal")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="OrderItemsSubsRenewal"
					
					//$_t_MethodName:="ZMail_Subs"
					$_l_MenuShortCut:=0
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
	: ($_t_MenuName="Purchase Orders")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Purchase Orders")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterPO")
					//$_t_MethodName:="ZPurchOrd_In"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PURCHASE_ORDERS:57])
					
					$_l_MenuShortCut:=Character code:C91("O")
					
					
				: ($_at_MenuElements{$_l_Index}="View Purchase Orders")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewPO")
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PURCHASE_ORDERS:57])
					
					
					$_l_MenuShortCut:=Character code:C91("E")
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
	: ($_t_MenuName="Sales Orders")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter New Orders")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterNewOrders")
					//$_t_MethodName:="ZOrders_In"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ORDERS:24])
					
					$_l_MenuShortCut:=Character code:C91("O")
					
					
				: ($_at_MenuElements{$_l_Index}="View Sales Orders")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewSalesOrders")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ORDERS:24])
					
					$_l_MenuShortCut:=Character code:C91("E")
				: ($_at_MenuElements{$_l_Index}="View Order Items")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewOrderItems")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ORDER_ITEMS:25])
					
					$_l_MenuShortCut:=Character code:C91("F")
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
						
						
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
			End if 
		End for 
	: ($_t_MenuName="Sales Ledger") | ($_t_MenuName="Sales") | ($_t_MenuName="Invoices")
		$_bo_BatchBreakSet:=False:C215
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Proforma")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterProforma")
					
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="InvoicesProForma"
					$_l_MenuShortCut:=Character code:C91("F")
				: ($_at_MenuElements{$_l_Index}="Enter Sales Credit Notes")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterSalesCM")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="InvoicesCreditNote"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Enter Sales Invoices")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterSalesInv")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[INVOICES:39])
					$_l_MenuShortCut:=Character code:C91("I")
					
				: ($_at_MenuElements{$_l_Index}="Enter Invoice")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterInvoice")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[INVOICES:39])
					$_l_MenuShortCut:=Character code:C91("I")
				: ($_at_MenuElements{$_l_Index}="Enter Credit Note")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterCreditNote")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="InvoicesCreditNote"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="View Sales Ledger")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewSalesLedger")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[INVOICES:39])
					
					$_l_MenuShortCut:=Character code:C91("J")
					
				: ($_at_MenuElements{$_l_Index}="View Credit Notes")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewCreditNotes")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="CreditNotes"
					
					//$_l_MenuShortCut:=Character code("J")
				: ($_at_MenuElements{$_l_Index}="View Receipts")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewReceipts")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Receipts"
					
				: ($_at_MenuElements{$_l_Index}="View Deposits")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewDeposits")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Deposits"
					
				: ($_at_MenuElements{$_l_Index}="View ProFormas")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewProFormas")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="ProFormas"
					
					
				: ($_at_MenuElements{$_l_Index}="View Invoice & Credit Notes")
					$_t_MenuItemName:="View Invoice & Credit Notes"
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesInvoices"
					
					//$_t_MethodName:="ZInvoices_Mod"
					$_l_MenuShortCut:=Character code:C91("J")
					
					
				: ($_at_MenuElements{$_l_Index}="Batch Invoice Orders")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BatchInvoiceOrders")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_bo_InsertBreak:=True:C214
					$_bo_BatchBreakSet:=True:C214
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="OrdersInvoice"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Batch Print Invoices")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BatchPrintInvoices")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					If (Not:C34($_bo_BatchBreakSet))
						$_bo_InsertBreak:=True:C214
					End if 
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesPrint"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Batch Post to Ledgers")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BatchPost")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZInvoices_Nom"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesPost"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Deposit Receipt")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_DepositReceipt")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_bo_InsertBreak:=True:C214
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="InvoicesDeposit"
					$_l_MenuShortCut:=Character code:C91("D")
					
				: ($_at_MenuElements{$_l_Index}="Deposit Refund")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_DepositRefund")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesDepositRefund"
					//$_t_MethodName:="INV_DepositRefund"
					$_l_MenuShortCut:=0
					//DBI_MenuDisplayRecords ("InvoicesDepRefund")
				: ($_at_MenuElements{$_l_Index}="Invoice Receipt")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_InvoiceReceipt")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesReceipt"
					//$_t_MethodName:="ZInvoices_Pay"
					$_l_MenuShortCut:=Character code:C91("K")
				: ($_at_MenuElements{$_l_Index}="Undo Receipt")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_UndoReceipt")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MenuParameter:="InvoicesReceiptRefund"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					//$_t_MethodName:="INV_ReceiptsRefund"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Remittance Receipt Forms")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_RemRec")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_bo_InsertBreak:=True:C214
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="InvoicesPrintRemittance"
					//$_t_MethodName:="ZInvoices_Rec"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Debtors Screen Report")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_DebtorsScreen")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_bo_InsertBreak:=True:C214
					$_t_MethodName:="Zinvoices_ADScr"
					$_l_MenuShortCut:=0
					//`
				: ($_at_MenuElements{$_l_Index}="Aged Debtors")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedDebtors")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=True:C214
						$_t_MenuParameter:="NoCurrentSelection"
						$_t_MethodName:="INV_PrintAgedDebtors"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="Aged Debtors as at")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedDebtorsAsAt")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=False:C215
						$_t_MenuParameter:="NoCurrentSelection"
						$_t_MethodName:="INV_PrintAgedDebtorsasat"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="Sales Daybook")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_SalesDaybook")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=False:C215
						$_t_MenuParameter:="NoCurrentSelection"
						//INV_SalesDaybook
						$_t_MethodName:="INV_SalesDaybook"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="List Sales Ledger")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ListSalesLedger")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=False:C215
						$_t_MenuParameter:="NoCurrentSelection"
						//INV_SalesDaybook
						$_t_MethodName:="INV_ListSalesLedger"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="Print Statements of Due Amounts")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_StatementsDueAmount")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=False:C215
						$_t_MenuParameter:="NoCurrentSelection"
						//INV_SalesDaybook
						$_t_MethodName:="INV_StatementDueAmounts"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
				: ($_at_MenuElements{$_l_Index}="Print Statements of account")
				: ($_at_MenuElements{$_l_Index}="EU Sales List")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_EUSalesList")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_bo_InsertBreak:=False:C215
						$_t_MenuParameter:="NoCurrentSelection"
						//INV_SalesDaybook
						$_t_MethodName:="INV_PrintEUSalesList"
						$_l_MenuShortCut:=0
						$_bo_MenuNewProcess:=True:C214
					End if 
					
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
	: ($_t_MenuName="Purchase Ledger")
		$_bo_InsertBreak:=False:C215
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Invoices")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Enter")+" "+$_t_Purchases
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZPurchases_In"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PURCHASE_INVOICES:37])
					$_l_MenuShortCut:=Character code:C91("I")
				: ($_at_MenuElements{$_l_Index}="Enter Credit Notes")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterCreditNotes")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZPurchases_InCr"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="PurchasesCredit"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Ledger")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewLedger")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZPurchases_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PURCHASE_INVOICES:37])
					
					
					$_l_MenuShortCut:=Character code:C91("J")
				: ($_at_MenuElements{$_l_Index}="Batch Post to Ledgers") | ($_at_MenuElements{$_l_Index}="Batch Post")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BatchPost")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="PurchasesPost"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Pre-Payment")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_PrePayment")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					//$_t_MethodName:="ZPurchases_InP"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="PurchasesPrePayment"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Payment")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterPayment")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="PurchasesPayment"
					$_l_MenuShortCut:=Character code:C91("K")
					
				: ($_at_MenuElements{$_l_Index}="Undo Payment")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_UndoPayment")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="PurchasesRefundPayment"
					//$_l_MenuShortCut:=Character code("K")
				: ($_at_MenuElements{$_l_Index}="Remittances & Cheques")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Remit")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="PurchasesCheques"
					
					
					
					$_l_MenuShortCut:=Character code:C91("H")
					
				: ($_at_MenuElements{$_l_Index}="Autopay List")
					$_bo_InsertBreak:=False:C215
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AutopayList")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="PurchasesAutopay"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Creditors Screen Report")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_CreditorsScreen")
					$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
					$_t_MethodName:="ZPurchases_ACSc"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Aged Creditors Report")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedCreditorsReport")
						$_t_MethodName:="PUR_PrintAgedCreditors"
						
						$_bo_InsertBreak:=True:C214
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_l_MenuShortCut:=0
						
						$_t_MenuParameter:="NoCurrentSelection"
					End if 
				: ($_at_MenuElements{$_l_Index}="Aged Creditors as at Report")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[INVOICES:39]))
						$_bo_InsertBreak:=False:C215
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AgedCreditorsasatReport")
						$_t_MenuItemName:=Term_SLPLWT($_t_MenuItemName)
						$_t_MethodName:="PUR_PrintAgedasatCreditors"
						$_l_MenuShortCut:=0
						$_t_MenuParameter:="NoCurrentSelection"
					End if 
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
			End if 
		End for 
		
	: ($_t_MenuName="Nominal")
		$_bo_InsertBreak:=False:C215
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Transaction Batch")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterBatch")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[TRANSACTION_BATCHES:30])
					$_l_MenuShortCut:=Character code:C91("T")
				: ($_at_MenuElements{$_l_Index}="View Batches")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewBatch")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[TRANSACTION_BATCHES:30])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Batch Post to Ledger")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BatchPost")
					//$_t_MethodName:="ZTransB_Nom"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Trans inPost"
					//DBI_MenuDisplayRecords
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Account Balances")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AccBals")
					//$_t_MethodName:="ZAccBal Bal"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ACCOUNT_BALANCES:34])
					
					//$_l_MenuShortCut:=Character code("T")
				: ($_at_MenuElements{$_l_Index}="Set-up-Budgets")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Setupbudgets")
					//$_t_MethodName:="ZAccBal Bud"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="ACC BALANCESBUDGETS"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Bank Reconcilliation")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_BankRecon")
					//$_t_MethodName:="ZTrans_Rec"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="TransactionsBankReconcilliation"
					$_l_MenuShortCut:=Character code:C91("R")
				: ($_at_MenuElements{$_l_Index}="Recurring Journals")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_RecurJournals")
					//$_t_MethodName:="ZStanding_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[RECURRING_JOURNALS:38])
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Reverse Batches")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ReverseBatch")
					//$_t_MethodName:="ZTransB_Rev"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Trans inREVERSE"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Currency Rates")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_CurrencyRates")
					$_t_MethodName:="ZCurrRates_Mod"
					$_l_MenuShortCut:=0
					
					
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				Case of 
					: ($_l_MenuShortCut=Character code:C91("U"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "U"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					: ($_l_MenuShortCut=Character code:C91("T"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "T"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					Else 
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
				End case 
			End if 
		End for 
		
	: ($_t_MenuName="Accounts")  //meaning account reports is reports menu on nominal ledger menu bar (5)
		
		
		$_bo_InsertBreak:=False:C215
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Audit Trail")
					//$_t_MenuItemName:=Get localized string("MenuItem_AuditTrail")
					//$_t_MethodName:="ZTransB_Audit"
					//$_t_MethodName:="DBI_MenuDisplayRecords"
					//$_t_MenuParameter:="Trans inAudit"
					
					//$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Transaction Batches")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_TransBatches")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[TRANSACTION_BATCHES:30])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Transactions by Date")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Transactions")
					//$_t_MethodName:="ZTrans_Date"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[TRANSACTIONS:29])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Transactions by Type")
					
					//$_t_MenuItemName:=Get localized string("MenuItem_TransByType")
					//$_t_MethodName:="ZTrans_Types"
					//$_t_MethodName:="DBI_MenuDisplayRecords"
					//$_t_MenuParameter:=DB_GetNormalisedTableName (->[TRANSACTIONS])
					
					
					//$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Transactions by Account")
					//$_t_MenuItemName:=Get localized string("MenuItem_TransByAcct")
					//$_t_MethodName:="ZTrans_Accs"
					//$_t_MethodName:="DBI_MenuDisplayRecords"
					//$_t_MenuParameter:="Transactionst"
					
					//$`MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Transactions Report")
					
					//$_t_MenuItemName:=Get localized string("MenuItem_TransactionsReport")
					//$_t_MethodName:="ZTrans_Report"
					//$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Period Balances List")  //this should be on the reports menu
					
					
					//$_bo_InsertBreak:=True
					//MenuItemName:=Get localized string("MenuItem_PeriodBalList")
					//$_t_MethodName:="ACC_PrintBalances"
					
					//$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Period Balances Reports")
					//$_t_MenuItemName:=Get localized string("MenuItem_PeriodBalRep")
					//$_t_MethodName:="ZAccBal_Report"
					//$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Trial Balance")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_bo_InsertBreak:=True:C214
						$_t_MenuItemName:=Get localized string:C991("MenuItem_TrialBalance")
						$_t_MethodName:="ACC_PrintTrialBalance"
						$_l_MenuShortCut:=0
						$_t_MenuParameter:="NoCurrentSelection"
					End if 
				: ($_at_MenuElements{$_l_Index}="Profit & Loss")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLoss")
						$_t_MenuItemName:=Term_NLWT($_t_MenuItemName)
						$_t_MethodName:="ACC_PrintProfitLoss"
						$_l_MenuShortCut:=0
						$_t_MenuParameter:="NoCurrentSelection"
					End if 
				: ($_at_MenuElements{$_l_Index}="Profit & Loss Vs Budgets")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLossvsBudgets")
						$_t_MenuItemName:=Term_NLWT($_t_MenuItemName)
						$_t_MethodName:="ACC_PrintProfitLossVsBudgets"
						$_t_MenuParameter:="NoCurrentSelection"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Profit & Loss 12 Periods")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ProfitLoss12Periods")
						$_t_MenuItemName:=Term_NLWT($_t_MenuItemName)
						$_t_MethodName:="ACC_PrintProfitLossoneyear"
						$_t_MenuParameter:="NoCurrentSelection"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Balance Sheet")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_BalanceSheet")
						$_t_MethodName:="ACC_PrintBalanceSheet"
						$_t_MenuParameter:="NoCurrentSelection"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="VAT Return")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_TaxReport")
						$_t_MenuItemName:=Term_VATWT($_t_MenuItemName)  //
						
						
						
						$_t_MethodName:="ACC_PrintTaxReturn"
						$_t_MenuParameter:="NoCurrentSelection"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="VAT Listing")
					If (DB_l_CurrentDisplayedForm#Table:C252(->[ACCOUNT_BALANCES:34]))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_VATlisting")
						$_t_MenuItemName:=Term_VATWT($_t_MenuItemName)
						$_t_MethodName:="ACC_PrintTaxListing"
						$_t_MenuParameter:="NoCurrentSelection"
						$_l_MenuShortCut:=0
					End if 
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
		End for 
		
		
	: ($_t_MenuName="Call Centre")
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Calls")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterCalls")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[SERVICE_CALLS:20])
					$_l_MenuShortCut:=Character code:C91("S")
					
					
				: ($_at_MenuElements{$_l_Index}="View Calls")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewCalls")
					//$_t_MethodName:="ZCalls_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[SERVICE_CALLS:20])
					
					$_l_MenuShortCut:=Character code:C91("T")
				: ($_at_MenuElements{$_l_Index}="Outstanding Calls")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_OutstandingCalls")
					//`$_t_MethodName:="ZCalls_ModO"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="Service CallsOutstanding"
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Start Checking Calls")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_StartCheckingCalls")
					$_t_MethodName:="ZCalls_CheckLau"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Contracts")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterContracts")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTRACTS:17])
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Contracts")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewContracts")
					//$_t_MethodName:="ZContracts_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTRACTS:17])
					
					$_l_MenuShortCut:=0
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				Case of 
					: ($_l_MenuShortCut=Character code:C91("U"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "U"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					: ($_l_MenuShortCut=Character code:C91("T"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "T"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					Else 
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							End if 
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						End if 
				End case 
				
			End if 
		End for 
		
		
	: ($_t_MenuName="Jobs")
		$_t_MenuItemName:=""
		$_t_MenuItemName:=""
		$_t_MenuParameter:=""
		$_l_MenuShortCut:=0
		$_t_MethodName:=""
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Enter Projects")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterProjects")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PROJECTS:89])
					
					$_l_MenuShortCut:=Character code:C91("D")
				: ($_at_MenuElements{$_l_Index}="View Projects")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewProjects")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PROJECTS:89])
					
					$_l_MenuShortCut:=Character code:C91("E")
				: ($_at_MenuElements{$_l_Index}="Enter Jobs")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterJobs")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[JOBS:26])
					
					$_l_MenuShortCut:=Character code:C91("J")
				: ($_at_MenuElements{$_l_Index}="View Jobs")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewJobs")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[JOBS:26])
					
					$_l_MenuShortCut:=Character code:C91("K")
				: ($_at_MenuElements{$_l_Index}="View Job Stages")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewJobStages")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[JOB_STAGES:47])
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="View Job Personnel")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewJobPersonnel")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[JOB PERSONNEL:48])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Enter Time & Costs")
					$_bo_InsertBreak:=True:C214
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterTimeCosts")
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryTimeCosts"
					//$_t_MethodName:="ZJobs_TCIn"
					$_l_MenuShortCut:=Character code:C91("C")
				: ($_at_MenuElements{$_l_Index}="Enter Time")
					$_t_MenuItemName:=Get localized string:C991("MenuItem_EnterTime")
					//$_t_MethodName:="ZTime_In"
					$_t_MethodName:="DB_MenuNewRecord"
					$_t_MenuParameter:="DiaryTime"
					$_l_MenuShortCut:=Character code:C91("T")
					
				: ($_at_MenuElements{$_l_Index}="View Time")
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_ViewTime")
					//$_t_MethodName:="ZTime_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:="DiaryJobTime"
					
					$_l_MenuShortCut:=Character code:C91("U")
					
					
			End case 
			If ($_t_MenuItemName#"")
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				Case of 
					: ($_l_MenuShortCut=Character code:C91("C"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "C"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					: ($_l_MenuShortCut=Character code:C91("U"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "U"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
					: ($_l_MenuShortCut=Character code:C91("T"))
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
							
							
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; "T"; 2048)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
						
					Else 
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						End if 
				End case 
				
			End if 
		End for 
		
		
	: ($_t_MenuName="Core")
		ARRAY TEXT:C222($_at_MenuHeaders; 0)
		ARRAY BOOLEAN:C223($_abo_HeadersDone; 0)
		APPEND TO ARRAY:C911($_at_MenuHeaders; "CONTACTS & COMPANIES")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "SECURITY")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "PRODUCTS")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "CONFIGURATION")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "STOCK MANAGEMENT")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "SALES CREDIT CONTROL")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "LEDGERS")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "TIME MANAGEMENT")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "JOB COSTINGS")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "SERVICE CONTROL")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "TIME MANAGEMENT")
		ARRAY BOOLEAN:C223($_abo_HeadersDone; Size of array:C274($_at_MenuHeaders))
		ARRAY TEXT:C222($_at_SubMenuReference; 0)
		ARRAY TEXT:C222($_at_SubMenuReference; Size of array:C274($_at_MenuHeaders))
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Areas")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Areas")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[AREAS:3])
					
					$_l_MenuShortCut:=0
					
					
				: ($_at_MenuElements{$_l_Index}="Postcodes")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Postcodes")
					$_t_MenuItemName:=Term_FSWT($_t_MenuItemName)
					//$_t_MethodName:="ZPostcodes_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[POSTAL_CODES:50])
					
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Countries")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Countries")
					//$_t_MethodName:="ZCountries_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[COUNTRIES:73])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Address Formats")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_AddressFormats")
					//$_t_MethodName:="ZAddTypes_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ADDRESS_FORMATS:74])
					
					
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Status")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Status")
					//$_t_MethodName:="ZStatus_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[STATUS:4])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Types")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Types")
					//$_t_MethodName:="ZTypes Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[TYPES:5])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Sources")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Sources")
					//$_t_MethodName:="ZSources_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[SOURCES:6])
					
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Publications")
					If ((DB_GetModuleSettingByNUM(14)<2) & (DB_GetModuleSettingByNUM(Module_SalesManager)<2))
						
						
					Else 
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Publications")
						//$_t_MethodName:="ZPublic Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PUBLICATIONS:52])
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Further Analyses")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_FurtherAnalyses")
					//$_t_MethodName:="ZFurthers_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ADDITIONAL_RECORD_ANALYSIS:53])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Roles")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "CONTACTS & COMPANIES")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Roles")
					$_t_MethodName:="ZRoles_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[ROLES:87])
					
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Change Password")
					If (Not:C34(((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)>=2)) | (<>PER_l_AccessLevel=0)))
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Security")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ChangePassword")
						$_t_MethodName:="Edit_Pass"
						$_l_MenuShortCut:=0
						
					End if 
				: ($_at_MenuElements{$_l_Index}="Personnel Groups")
					If (((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_DataManager)#2)) & (<>PER_l_AccessLevel#0))
						
						
					Else 
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Security")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_PersonnelGroups")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PERSONNEL_GROUPS:92])
						
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Personnel & Resources")
					If (((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_DataManager)#2)) & (<>PER_l_AccessLevel#0))
						
						
					Else 
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Security")
						If ($_l_MenuShortCutPositionSub>0)
							
							
							If ($_l_MenuShortCutPositionSub>0)
								
								$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
								If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
									$_bo_InsertBreak:=True:C214
								End if 
							End if 
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Personnel")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PERSONNEL:11])
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Groups")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Products")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Groups")
					//$_t_MethodName:="ZGroups_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRODUCT_GROUPS:10])
					
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Brands")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Products")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Brands")
					
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRODUCT_BRANDS:8])
					
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Collections")
					If ((DB_GetModuleSettingByNUM(Module_Products))>=2)  //Price Tables   "
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Products")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
							
						End if 
						$_t_MenuItemName:="Collections"  // Get localized string("MenuItem_PriceGroups")
						
						
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[CATALOGUE:108])
						$_l_MenuShortCut:=0
					End if 
					
				: ($_at_MenuElements{$_l_Index}="Price Groups")
					If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Tables   "
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Products")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_PriceGroups")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PRICE_GROUPS:18])
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Macros")
					If ((DB_GetModuleSettingByNUM(Module_Macros))>=2)  //Macros"
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Macros")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[SCRIPTS:80])
						
						
						$_l_MenuShortCut:=Character code:C91("M")
					End if 
				: ($_at_MenuElements{$_l_Index}="Pictures")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Pictures")
					//$_t_MethodName:="ZPictures_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[PICTURES:85])
					
					$_l_MenuShortCut:=Character code:C91("T")
				: ($_at_MenuElements{$_l_Index}="Terminology")
					If ((DB_GetModuleSettingByNUM(40))=0)  //not international
						
						
					Else 
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
							
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Terminology")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[TERMINOLOGY:75])
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Record States")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_FileStates")
					$_t_MethodName:="ZStates_Mod"
					$_l_MenuShortCut:=0
					
				: ($_at_MenuElements{$_l_Index}="Lists")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Listmanager")
					$_t_MethodName:="ZLists_Mod"
					$_l_MenuShortCut:=Character code:C91("L")
					
				: ($_at_MenuElements{$_l_Index}="Further Fields")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_FurtherFields")
					//$_t_MethodName:="ZFurthFldD_Mod"
					$_t_MethodName:="DBI_MenuDisplayRecords"
					//$_t_MenuParameter:="Further Fields"
					$_t_MenuParameter:=DB_GetNormalisedTableName(->[CUSTOM_FIELD_DEFINITiONS:99])
					
					$_l_MenuShortCut:=Character code:C91("F")
					
				: ($_at_MenuElements{$_l_Index}="Update Licence")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_UpdateLicence")
					$_t_MethodName:="ZUser_Licence"
					$_l_MenuShortCut:=0
				: ($_at_MenuElements{$_l_Index}="Preferences")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Configuration")
					If ($_l_MenuShortCutPositionSub>0)
						
						$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_bo_InsertBreak:=True:C214
						End if 
						
					End if 
					$_t_MenuItemName:=Get localized string:C991("MenuItem_Preferences")
					$_t_MethodName:="ZUser_Mod"
					$_l_MenuShortCut:=0
					
					
			End case 
			If ($_t_MenuItemName#"")
				
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				If ($_t_MenuHeaderName#"")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; $_t_MenuHeaderName)
					If ($_l_MenuShortCutPositionSub>0)
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							
							$_abo_HeadersDone{$_l_MenuShortCutPositionSub}:=True:C214
							Case of 
								: ($_t_MenuHeaderName="Contacts & Companies")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_Contactscompanies")
								: ($_t_MenuHeaderName="Security")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_SECURITY")
								: ($_t_MenuHeaderName="Products")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_ProductsHeader")
								: ($_t_MenuHeaderName="Configuration")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_Settings")
									
							End case 
							Case of 
								: (Db_t_MenuType="4D menu")
									$_at_SubMenuReference{$_l_MenuShortCutPositionSub}:=Create menu:C408
									INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuHeaderName; $_at_SubMenuReference{$_l_MenuShortCutPositionSub})
									
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuHeaderName)
									APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
									APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
									APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
									APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
									
									ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resuze this here and at the end!
									
									
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)+1
									DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_CurrentRow)
									
									//``
									//APPEND TO ARRAY(DB_at_SubMenuReference;DB_at_SubMenuReference{Size of array(DB_at_SubMenuReference)})  //tells us the row
									//$_l_CurrentRow:=Size of array(DB_at_Submenuitem)+1
									INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_CurrentRow; 1)
									//INSERT IN ARRAY(DB_at_Submenuitem;$_l_CurrentRow;1)
									INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_CurrentRow; 1)
									
									INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_CurrentRow; 1)
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)
								Else 
									//TRACE
							End case 
							//DISABLE MENU ITEM($_t_MenuReference;-1)
							
						End if 
					End if 
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MethodName)
							SET MENU ITEM PARAMETER:C1004($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuParameter)
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							$_l_MenuArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_CurrentRow})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							DB_at_Submenuitem{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_MenuArraySize}:=""
							DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_MenuArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MethodName
							DB_at_SubMenu1ItemParameter{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuParameter
							$_l_NumberofColumns:=Size of array:C274(DB_at_SubMenuShortCut{$_l_CurrentRow})
					End case 
					If ($_l_MenuShortCut>0)
						Case of 
							: ($_l_MenuShortCut=Character code:C91("F"))
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_MenuShortCutPosition>0)
									$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_MenuShortCutPosition<0)
										$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: (Db_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048+512)
												
											: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
												DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048+512
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
										
									Else 
										//dont add the short cut
									End if 
									
									
									
								Else 
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; "F"; 2048)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:="F"
											DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
									End case 
									
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								End if 
							Else 
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
								If ($_l_MenuShortCutPosition>0)
									$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
									If ($_l_MenuShortCutPosition>0)
										$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
										If ($_l_MenuShortCutPosition<0)
											$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
											
											Case of 
												: (Db_t_MenuType="4D menu")
													SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048+512)
												: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
													DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
													DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048+512
											End case 
											APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
										Else 
											//dont add the short cut
										End if 
										
									Else 
										$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: (Db_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048)
											: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
												DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
												DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
										End case 
										
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
										
									End if 
								Else 
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_l_MenuShortCut)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
											DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
								End if 
						End case 
						
					End if 
				Else 
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
							If ($_t_MenuParameter#"")
								SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
							End if 
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
							
					End case 
					If ($_l_MenuShortCut>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
											DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
											
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						End if 
					End if 
				End if 
			End if 
		End for 
		
	: ($_t_MenuName="Financials")
		ARRAY TEXT:C222($_at_MenuHeaders; 0)
		ARRAY BOOLEAN:C223($_abo_HeadersDone; 0)
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Stock Management")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Sales Credit Control")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Ledgers")
		
		ARRAY BOOLEAN:C223($_abo_HeadersDone; Size of array:C274($_at_MenuHeaders))
		ARRAY TEXT:C222($_at_SubMenuReference; 0)
		ARRAY TEXT:C222($_at_SubMenuReference; Size of array:C274($_at_MenuHeaders))
		
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_t_MethodName:=""
			$_t_MenuItemName:=""
			$_l_MenuShortCut:=0
			$_bo_InsertBreak:=False:C215
			$_t_MenuHeaderName:=""
			
			$_t_MenuParameter:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Stock Types")
					If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Stock Management")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_StockTypes")
						$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[STOCK_TYPES:59])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Stock Locations")
					If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Stock Management")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_StockLocations")
						$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[LOCATIONS:61])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Movement Types")
					If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Stock Management")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_MovementTypes")
						$_t_MenuItemName:=Term_StoWT($_t_MenuItemName)
						//$_t_MethodName:="ZMoveTypes_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[MOVEMENT_TYPES:60])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Credit Stages")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Sales Credit Control")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_CreditStages")
						//$_t_MethodName:="ZInvStages_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[CREDIT_STAGES:54])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Credit Card Provision")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Sales Credit Control")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_CreditCardProvision")
						$_t_MethodName:="zCards_Mod"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Accounts")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Accounts")
						//$_t_MethodName:="ZAccounts_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[ACCOUNTS:32])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Account Headings")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_AccountsHeadings")
						//$_t_MethodName:="ZHeadings_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[HEADINGS:84])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Years & Periods")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Yearsperiods")
						$_t_MethodName:="ZPeriods_Mod"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Transaction Types")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_TransactionTypes")
						//$_t_MethodName:="ZTransT Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[TRANSACTION_TYPES:31])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Analyses")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Analyses")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[ANALYSES:36])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Layers")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //Multi-Layer"
							
							
							
							
							$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
							If ($_l_MenuShortCutPositionSub>0)
								
								$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							End if 
							
							
							$_t_MenuItemName:=Get localized string:C991("MenuItem_Layers")
							//$_t_MethodName:="ZLayers_Mod"
							$_t_MethodName:="DBI_MenuDisplayRecords"
							$_t_MenuParameter:=DB_GetNormalisedTableName(->[LAYERS:76])
							$_l_MenuShortCut:=0
						End if 
					End if 
					
				: ($_at_MenuElements{$_l_Index}="Tax Codes")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_TaxCodes")
						//$_t_MethodName:="ZVAT Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[TAX_CODES:35])
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Currencies")
					If (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)>=2)
						If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //Multi-Currency"
							
							
							
							
							$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "LEDGERS")
							If ($_l_MenuShortCutPositionSub>0)
								
								$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
								
							End if 
							
							$_t_MenuItemName:=Get localized string:C991("MenuItem_Currencies")
							$_t_MethodName:="DBI_MenuDisplayRecords"
							$_t_MenuParameter:=DB_GetNormalisedTableName(->[CURRENCIES:71])
							$_l_MenuShortCut:=0
						End if 
					End if 
			End case 
			If ($_t_MenuItemName#"")
				
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				If ($_t_MenuHeaderName#"")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; $_t_MenuHeaderName)
					If ($_l_MenuShortCutPositionSub>0)
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_abo_HeadersDone{$_l_MenuShortCutPositionSub}:=True:C214
							
							Case of 
								: ($_t_MenuHeaderName="Stock Managment")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_STOCKMANAGEMENT")
								: ($_t_MenuHeaderName="Sales Credit Control")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_SalesCreditControl")
								: ($_t_MenuHeaderName="Ledgers")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_Ledgers")
									
							End case 
							Case of 
								: (Db_t_MenuType="4D menu")
									$_at_SubMenuReference{$_l_MenuShortCutPositionSub}:=Create menu:C408
									INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuHeaderName; $_at_SubMenuReference{$_l_MenuShortCutPositionSub})
									
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuHeaderName)
									APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
									APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
									APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
									APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
									ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resuze this here and at the end!
									
									
									
									//``
									//APPEND TO ARRAY(DB_at_SubMenuReference;DB_at_SubMenuReference{Size of array(DB_at_SubMenuReference)})  //tells us the row
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)+1
									DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_CurrentRow)
									INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_CurrentRow; 1)
									//INSERT IN ARRAY(DB_at_Submenuitem;$_l_CurrentRow;1)
									INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_CurrentRow; 1)
									
									INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_CurrentRow; 1)
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)
								Else 
									//TRACE
							End case 
							//INSERT MENU ITEM($_t_MenuReference;-1;$_t_MenuHeaderName;$_at_SubMenuReference{$_l_MenuShortCutPositionSub})
							//DISABLE MENU ITEM($_t_MenuReference;-1)
						Else 
							
						End if 
					End if 
					
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MethodName)
							SET MENU ITEM PARAMETER:C1004($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuParameter)
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							$_l_MenuArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_CurrentRow})+1
							INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_CurrentRow}; $_l_MenuArraySize; 1)
							DB_at_Submenuitem{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuItemName
							DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_MenuArraySize}:=""
							DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_MenuArraySize}:=0
							DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MethodName
							DB_at_SubMenu1ItemParameter{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuParameter
							$_l_NumberofColumns:=Size of array:C274(DB_at_SubMenuShortCut{$_l_CurrentRow})
					End case 
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048+512
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
									DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
							End case 
							
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
								DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				Else 
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
							If ($_t_MenuParameter#"")
								SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
							End if 
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
							
					End case 
					
					If ($_l_MenuShortCut>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
											DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
											
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						End if 
					End if 
				End if 
			End if 
			
		End for 
	: ($_t_MenuName="Others")
		
		
		ARRAY TEXT:C222($_at_MenuHeaders; 0)
		ARRAY BOOLEAN:C223($_abo_HeadersDone; 0)
		ARRAY TEXT:C222($_at_SubMenuReference; 0)
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Time Management")
		
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Job Costings")
		APPEND TO ARRAY:C911($_at_MenuHeaders; "Service Control")
		ARRAY BOOLEAN:C223($_abo_HeadersDone; Size of array:C274($_at_MenuHeaders))
		
		ARRAY TEXT:C222($_at_SubMenuReference; Size of array:C274($_at_MenuHeaders))
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuHeaderName:=""
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Actions")
					If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>=2)  //Diary"
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Time Management")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							
						End if 
						//TRACE
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Actions")
						//$_t_MethodName:="ZActions_Mod
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[ACTIONS:13])
						
						$_l_MenuShortCut:=0
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
					End if 
				: ($_at_MenuElements{$_l_Index}="Results")
					If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>=2)  //Diary
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Time Management")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Results")
						//$_t_MethodName:="ZResults_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[RESULTS:14])
						
						$_l_MenuShortCut:=0
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
					End if 
				: ($_at_MenuElements{$_l_Index}="Workflow") | ($_at_MenuElements{$_l_Index}="Workflow Manager")
					
					If ((DB_GetModuleSettingByNUM(Module_DiaryManager)>=2) & (DB_GetModuleSettingByNUM(Module_Sequences)>=2))  //Sequences     Diary"
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Time Management")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_WorkflowManager")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[WORKFLOW_CONTROL:51])
						
						$_l_MenuShortCut:=0
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
					End if 
				: ($_at_MenuElements{$_l_Index}="Personnel Catagories")
					If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Job Costings")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_PersonnelCategories")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[TIME_BILLING_CATEGORIES:46])
						//$_t_MethodName:="ZCategories_Mod"
						$_l_MenuShortCut:=0
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
					End if 
				: ($_at_MenuElements{$_l_Index}="Job Stages")
					If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Job Costings")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_JobStages")
						
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[CREDIT_STAGES:54])
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Job Types")
					If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2)
						
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Job Costings")
						If ($_l_MenuShortCutPositionSub>0)
							
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_JobTypes")
						//$_t_MethodName:="ZJTypes_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[JOB_TYPES:65])
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Problems")
					If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Service Control")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Problems")
						//$_t_MethodName:="ZProblems_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[PROBLEMS:22])
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Solutions")
					If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Service Control")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						$_t_MenuItemName:=Get localized string:C991("MenuItem_Solutions")
						//$_t_MethodName:="ZSolutions_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[SOLUTIONS:23])
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
						
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Contract Types")
					If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
						
						
						$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; "Service Control")
						If ($_l_MenuShortCutPositionSub>0)
							$_t_MenuHeaderName:=$_at_MenuHeaders{$_l_MenuShortCutPositionSub}
							If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
								$_bo_InsertBreak:=True:C214
							End if 
						End if 
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ContractTypes")
						//$_t_MethodName:="ZContTypes_Mod"
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:=DB_GetNormalisedTableName(->[CONTRACT_TYPES:19])
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						$_t_MethodName:=""
						$_t_MenuItemName:=""
						
						$_l_MenuShortCut:=0
						
					End if 
			End case 
			If ($_t_MenuItemName#"")
				
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				If ($_t_MenuHeaderName#"")
					$_l_MenuShortCutPositionSub:=Find in array:C230($_at_MenuHeaders; $_t_MenuHeaderName)
					If ($_l_MenuShortCutPositionSub>0)
						
						
						
						If (Not:C34($_abo_HeadersDone{$_l_MenuShortCutPositionSub}))
							$_abo_HeadersDone{$_l_MenuShortCutPositionSub}:=True:C214
							Case of 
									
								: ($_t_MenuHeaderName="Time Management")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_TimeManagement")
								: ($_t_MenuHeaderName="Job Costings")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_JobCostings")
								: ($_t_MenuHeaderName="Service Control")
									$_t_MenuHeaderName:=Get localized string:C991("MenuItem_ServiceControl")
									
							End case 
							Case of 
								: (Db_t_MenuType="4D menu")
									$_at_SubMenuReference{$_l_MenuShortCutPositionSub}:=Create menu:C408
									INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuHeaderName; $_at_SubMenuReference{$_l_MenuShortCutPositionSub})
									
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuHeaderName)
									APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
									APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
									APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
									APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
									ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resuze this here and at the end!
									
									
									
									//``
									//APPEND TO ARRAY(DB_at_SubMenuReference;DB_at_SubMenuReference{Size of array(DB_at_SubMenuReference)})  //tells us the row
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)+1
									DB_at_SubMenuReference{Size of array:C274(DB_at_SubMenuReference)}:=String:C10($_l_CurrentRow)
									INSERT IN ARRAY:C227(DB_at_Submenuitem; $_l_CurrentRow; 1)
									//INSERT IN ARRAY(DB_at_Submenuitem;$_l_CurrentRow;1)
									INSERT IN ARRAY:C227(DB_at_SubMenuShortCut; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier; $_l_CurrentRow; 1)
									
									INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction; $_l_CurrentRow; 1)
									INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter; $_l_CurrentRow; 1)
									$_l_CurrentRow:=Size of array:C274(DB_at_Submenuitem)
								Else 
									//TRACE
							End case 
							//`DISABLE MENU ITEM($_t_MenuReference;-1)
						Else 
						End if 
						Case of 
							: (Db_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MethodName)
								SET MENU ITEM PARAMETER:C1004($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_MenuParameter)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_l_MenuArraySize:=Size of array:C274(DB_at_Submenuitem{$_l_CurrentRow})+1
								INSERT IN ARRAY:C227(DB_at_Submenuitem{$_l_CurrentRow}; $_l_MenuArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenuShortCut{$_l_CurrentRow}; $_l_MenuArraySize; 1)
								INSERT IN ARRAY:C227(DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}; $_l_MenuArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}; $_l_MenuArraySize; 1)
								INSERT IN ARRAY:C227(DB_at_SubMenu1ItemParameter{$_l_CurrentRow}; $_l_MenuArraySize; 1)
								DB_at_Submenuitem{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuItemName
								DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_MenuArraySize}:=""
								DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_MenuArraySize}:=0
								DB_at_SubMenu1Item4DFunction{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MethodName
								DB_at_SubMenu1ItemParameter{$_l_CurrentRow}{$_l_MenuArraySize}:=$_t_MenuParameter
								$_l_NumberofColumns:=Size of array:C274(DB_at_SubMenuShortCut{$_l_CurrentRow})
						End case 
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048+512)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
											DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048+512
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_t_ShortCutCharacter; 2048)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
										DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
								End case 
								
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_at_SubMenuReference{$_l_MenuShortCutPositionSub}; -1; $_l_MenuShortCut)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									DB_at_SubMenuShortCut{$_l_CurrentRow}{$_l_NumberofColumns}:=$_t_ShortCutCharacter
									DB_al_SubMenuShortCutmodifier{$_l_CurrentRow}{$_l_NumberofColumns}:=2048
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						End if 
						
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
								SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
								If ($_t_MenuParameter#"")
									SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
								End if 
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
								APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
								APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
								APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
								APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
								
						End case 
						If ($_l_MenuShortCut>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								If ($_l_MenuShortCutPosition>0)
									$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									If ($_l_MenuShortCutPosition<0)
										$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
										Case of 
											: (Db_t_MenuType="4D menu")
												SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
											: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
												DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
												DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
												
										End case 
										APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
									Else 
										//dont add the short cut
									End if 
									
								Else 
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
											DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
											
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
									
								End if 
							Else 
								
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
							End if 
						End if 
					End if 
				Else 
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
							SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
							If ($_t_MenuParameter#"")
								SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
							End if 
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
							
					End case 
					If ($_l_MenuShortCut>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							If ($_l_MenuShortCutPosition>0)
								$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								If ($_l_MenuShortCutPosition<0)
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									Case of 
										: (Db_t_MenuType="4D menu")
											SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
										: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
											DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
											DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
											
									End case 
									APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
								Else 
									//dont add the short cut
								End if 
								
							Else 
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
								
							End if 
						Else 
							
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
						End if 
					End if 
				End if 
				
				
			End if 
			
		End for 
		
	: ($_t_MenuName="Utilities")
		//ARRAY BOOLEAN($_abo_HeadersDone;Size of array($_at_MenuHeaders))
		For ($_l_Index; 1; Size of array:C274($_at_MenuElements))
			$_bo_InsertBreak:=False:C215
			$_t_MenuHeaderName:=""
			$_t_MethodName:=""
			$_t_MenuItemName:=""
			$_t_MenuParameter:=""
			$_l_MenuShortCut:=0
			$_t_MethodName:=""
			Case of 
				: ($_at_MenuElements{$_l_Index}="Recode Companies")
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_RecodeCompanies")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="CompaniesRenum"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Recode Contacts")
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_RecodeContacts")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="ContactsRenum"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="De-Duplicate Companies")
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_DedupCompanies")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="CompaniesDedup"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="De-Duplicate Contacts")
					If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
						$_t_MenuItemName:=Get localized string:C991("MenuItem_DedupContacts")
						$_t_MethodName:="DBI_MenuDisplayRecords"
						$_t_MenuParameter:="ContactsDedup"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Close Period")
					If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
						
						
						
						$_bo_InsertBreak:=True:C214
						$_t_MenuItemName:=Get localized string:C991("MenuItem_ClosePeriod")
						$_t_MethodName:="ZPeriod_Close"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Close Financial Years")
					If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
						
						
						$_t_MenuItemName:=Get localized string:C991("MenuItem_CloseFinYear")
						$_t_MethodName:="ZYear_Close"
						$_l_MenuShortCut:=0
					End if 
				: ($_at_MenuElements{$_l_Index}="Reset Data")
					If (Current user:C182="Administrator") | (Current user:C182="Designer")
						$_t_MenuItemName:="Reset Data"
						//$_t_MethodName:="ZYear_Close"
						$_l_MenuShortCut:=0
						
						
					End if 
			End case 
			If ($_t_MenuItemName#"")
				
				If ($_bo_InsertBreak)
					Case of 
						: (Db_t_MenuType="4D menu")
							INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
						: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
							APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
							APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
							APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
							APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
							APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
					End case 
				End if 
				
				Case of 
					: (Db_t_MenuType="4D menu")
						INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
						SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MethodName)
						If ($_t_MenuParameter#"")
							SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
						End if 
					: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
						APPEND TO ARRAY:C911(DB_at_menuitem; $_t_MenuItemName)
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; $_t_MethodName)
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_t_MenuParameter)
						
				End case 
				If ($_l_MenuShortCut>0)
					$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					If ($_l_MenuShortCutPosition>0)
						$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
						If ($_l_MenuShortCutPosition>0)
							$_l_MenuShortCutPosition:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							If ($_l_MenuShortCutPosition<0)
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								Case of 
									: (Db_t_MenuType="4D menu")
										SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048+512)
									: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
										DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
										DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
										
								End case 
								APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048+512)
							Else 
								//dont add the short cut
							End if 
							
						Else 
							$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
							Case of 
								: (Db_t_MenuType="4D menu")
									SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_ShortCutCharacter; 2048)
								: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
									DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
									DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
									
							End case 
							APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut+2048)
							
						End if 
					Else 
						
						Case of 
							: (Db_t_MenuType="4D menu")
								SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortCut)
							: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
								$_t_ShortCutCharacter:=Char:C90($_l_MenuShortCut)
								DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_ShortCutCharacter
								
						End case 
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortCut)
					End if 
				End if 
				
			End if 
			
		End for 
		
End case 
Case of 
	: (Db_t_MenuType="menu string") | (Db_t_MenuType="JSON")
		ARRAY TEXT:C222(DB_at_SubMenuReference; Size of array:C274(DB_at_MenuItemParameter))  //<-note we only resuze this here and at the end!
		
		
		
End case 
//Commentary
COPY ARRAY:C226(DB_al_MenuShortCutsUsed; DB_al_ModuleMenuShortCuts)
//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)  `Copied to at the bottom of this method

$0:=$_t_MenuReference
ERR_MethodTrackerReturn("DB_BuildModuleMenu"; $_t_oldMethodName)
