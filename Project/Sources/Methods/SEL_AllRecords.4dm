//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_AllRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       17/05/2010 10:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_AD_FinancialYearTo;0)
	C_BOOLEAN:C305(DB_bo_DisplayStats)
	C_DATE:C307($_d_CurrentDate; $_d_FinYearFrom; $_d_FinYearTo)
	C_LONGINT:C283($_l_Index; $_l_NumericParameter; $_l_UnderscorePosition; DB_l_CurrentDisplayedForm; DB_l_MaxRecords)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284(<>DefRole; <>PER_t_CurrentUserInitials; $_t_FinYearPeriodCodeFrom; $_t_FinYearPeriodCodeTo; $_t_MenuItemParameter; $_t_NumericPartofMenuItem; $_t_oldMethodName; $1; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEL_AllRecords")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter="") & (Count parameters:C259>0)
	$_t_MenuItemParameter:=$1
	$_l_UnderscorePosition:=Position:C15("_"; $_t_MenuItemParameter)
	If ($_l_UnderscorePosition>0)
		$_t_NumericPartofMenuItem:=Substring:C12($_t_MenuItemParameter; 1; $_l_UnderscorePosition-1)
	Else 
		$_t_NumericPartofMenuItem:=$_t_MenuItemParameter
	End if 
	
	$_l_NumericParameter:=Num:C11($_t_NumericPartofMenuItem)
Else 
	$_l_UnderscorePosition:=Position:C15("_"; $_t_MenuItemParameter)
	If ($_l_UnderscorePosition>0)
		$_t_NumericPartofMenuItem:=Substring:C12($_t_MenuItemParameter; 1; $_l_UnderscorePosition-1)
	Else 
		$_t_NumericPartofMenuItem:=$_t_MenuItemParameter
	End if 
	$_l_NumericParameter:=Num:C11($_t_NumericPartofMenuItem)
End if 

If (DB_l_CurrentDisplayedForm>0)
	Case of 
		: ($_l_NumericParameter=1)  // All Records
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
					ALL RECORDS:C47([COMPANIES:2])
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
					ALL RECORDS:C47([CONTACTS:1])
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
					ALL RECORDS:C47([PRODUCTS:9])
					QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
					ALL RECORDS:C47([PERSONNEL:11])
					QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
					ALL RECORDS:C47([DIARY:12])
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
					
				Else 
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					ALL RECORDS:C47($_ptr_Table->)
					
					
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=2)  //
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
					//All records Exclude private
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Private:37=False:C215)
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Role:11=<>DefRole)
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
					ALL RECORDS:C47([PRODUCTS:9])
					QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
					ALL RECORDS:C47([PERSONNEL:11])
					QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
					ALL RECORDS:C47([DIARY:12])
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDER_ITEMS:25]))  //uninvoiced order items
					
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))  //discount based price groups
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Based:3=False:C215; *)
					QUERY:C277([PRICE_GROUPS:18];  | ; [PRICE_GROUPS:18]Price_Based:3=3)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))  //current' stock movements
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
					RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
					
					
				Else 
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					ALL RECORDS:C47($_ptr_Table->)
					
					
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=3)  //
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
					//All records Exclude private
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Based:3=True:C214; *)
					QUERY:C277([PRICE_GROUPS:18];  | ; [PRICE_GROUPS:18]Price_Based:3=1)
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=4)  //
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
					//All records Exclude private
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Sales_Person:29=<>PER_t_CurrentUserInitials)
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
					//
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Sales_Person:25=<>PER_t_CurrentUserInitials)
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
					//
					QUERY:C277([DIARY:12]; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials)
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
					//
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Person:11=<>PER_t_CurrentUserInitials)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
					//
					QUERY:C277([SOURCES:6]; [SOURCES:6]Person:9=<>PER_t_CurrentUserInitials)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TIME_BUDGETS:49]))
					//
					QUERY:C277([TIME_BUDGETS:49]; [TIME_BUDGETS:49]Person:1=<>PER_t_CurrentUserInitials)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
					//
					QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Person:7=<>PER_t_CurrentUserInitials)
					
					
					
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=5)  //
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
					$_d_CurrentDate:=Current date:C33(*)
					$_d_FinYearFrom:=$_d_CurrentDate-365
					$_d_FinYearTo:=$_d_CurrentDate
					ACC_LoadFinancialYears(True:C214)
					For ($_l_Index; Size of array:C274(ACC_ad_FinancialYearFrom); 1; -1)
						If (ACC_ad_FinancialYearFrom{$_l_Index}<=$_d_CurrentDate)
							$_d_FinYearFrom:=ACC_ad_FinancialYearFrom{$_l_Index}
							$_d_FinYearTo:=ACC_AD_FinancialYearTo{$_l_Index}
							$_l_Index:=0
						End if 
						
					End for 
					QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Posted_Date:16>=$_d_FinYearFrom; *)
					QUERY:C277([TRANSACTION_BATCHES:30];  & ; [TRANSACTION_BATCHES:30]Posted_Date:16>=$_d_FinYearTo)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
					$_d_CurrentDate:=Current date:C33(*)
					$_d_FinYearFrom:=$_d_CurrentDate-365
					$_d_FinYearTo:=$_d_CurrentDate
					ACC_LoadFinancialYears(True:C214)
					For ($_l_Index; Size of array:C274(ACC_ad_FinancialYearFrom); 1; -1)
						If (ACC_ad_FinancialYearFrom{$_l_Index}<=$_d_CurrentDate)
							$_d_FinYearFrom:=ACC_ad_FinancialYearFrom{$_l_Index}
							$_d_FinYearTo:=ACC_AD_FinancialYearTo{$_l_Index}
							$_l_Index:=0
						End if 
						
					End for 
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3=$_d_FinYearFrom)
					//QUERY([PERIODS]; & ;[PERIODS]To Date<=$_d_FinYearFrom+30)
					$_t_FinYearPeriodCodeFrom:=[PERIODS:33]Period_Code:1
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3=$_d_FinYearTo)
					//QUERY([PERIODS]; & ;[PERIODS]To Date<=$_d_FinYearFrom+30)
					$_t_FinYearPeriodCodeTo:=[PERIODS:33]Period_Code:1
					
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11>=$_t_FinYearPeriodCodeFrom; *)
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11<=$_t_FinYearPeriodCodeTo)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
					$_d_CurrentDate:=Current date:C33(*)
					$_d_FinYearFrom:=$_d_CurrentDate-365
					$_d_FinYearTo:=$_d_CurrentDate
					ACC_LoadFinancialYears(True:C214)
					For ($_l_Index; Size of array:C274(ACC_ad_FinancialYearFrom); 1; -1)
						If (ACC_ad_FinancialYearFrom{$_l_Index}<=$_d_CurrentDate)
							$_d_FinYearFrom:=ACC_ad_FinancialYearFrom{$_l_Index}
							$_d_FinYearTo:=ACC_AD_FinancialYearTo{$_l_Index}
							$_l_Index:=0
						End if 
						
					End for 
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3=$_d_FinYearFrom)
					//QUERY([PERIODS]; & ;[PERIODS]To Date<=$_d_FinYearFrom+30)
					$_t_FinYearPeriodCodeFrom:=[PERIODS:33]Period_Code:1
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3=$_d_FinYearTo)
					//QUERY([PERIODS]; & ;[PERIODS]To Date<=$_d_FinYearFrom+30)
					$_t_FinYearPeriodCodeTo:=[PERIODS:33]Period_Code:1
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12>=$_t_FinYearPeriodCodeFrom; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12<=$_t_FinYearPeriodCodeTo)
					
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=6)  //
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SUBSCRIPTIONS:93]))
					QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=Current date:C33(*))
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=7)
			$_t_MenuItemParameter:=Replace string:C233($_t_MenuItemParameter; "7_"; "")
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6=$_t_MenuItemParameter)
					
					
					
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=8)
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Free_Level:3>0)
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
		: ($_l_NumericParameter=9)  //
			$_t_MenuItemParameter:=Replace string:C233($_t_MenuItemParameter; "9_"; "")
			Case of 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
					
					Case of 
						: ($_t_MenuItemParameter="CreditNotes")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
							
						: ($_t_MenuItemParameter="Deposits")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-2)
						: ($_t_MenuItemParameter="Receipts")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-3)
						: ($_t_MenuItemParameter="Proformas") | ($_t_MenuItemParameter="Proforma")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-1)
						: ($_t_MenuItemParameter="Invoices")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0)
						: ($_t_MenuItemParameter="UnpaidInvoices")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7>0)
						: ($_t_MenuItemParameter="overdueInvoices")
							QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7>0; *)
							QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Due_Date:18<Current date:C33(*))
							
							
						Else 
							ALL RECORDS:C47([INVOICES:39])
							
					End case 
					
					DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
				: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
					QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Type_Code:4=$_t_MenuItemParameter)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
					Case of 
						: ($_t_MenuItemParameter="open")
							QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215)
						Else 
							$_t_MenuItemParameter:=Replace string:C233($_t_MenuItemParameter; "Open"; "")
							QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
							QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials)
					End case 
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
					
				: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
					Case of 
						: ($_t_MenuItemParameter="LetterTemplates")
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
						: ($_t_MenuItemParameter="EmailTemplates")
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template)
					End case 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
					QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="024"+$_t_MenuItemParameter)
				: (DB_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
					Case of 
						: ($_t_MenuItemParameter="Company")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8#"")
						: ($_t_MenuItemParameter="Brand")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7#"")
						: ($_t_MenuItemParameter="ProductGroup")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Group_Code:6#"")
						: ($_t_MenuItemParameter="Product")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1#"")
						: ($_t_MenuItemParameter="Currency")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Currency_Code:13#"")
						: ($_t_MenuItemParameter="Discount")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Pricing_Basis:17=3)
						: ($_t_MenuItemParameter="Price")
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Pricing_Basis:17=1)
						Else 
							QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_t_MenuItemParameter)
					End case 
				: (DB_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215)
					
			End case 
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	End case 
	$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
	SRCH_Applyfilterstoselection($_ptr_Table)
	DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetFormMenuoptions
	
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	If (DB_bo_DisplayStats)
		//stats are displayed
		StatsView_Cal1
		StatsView_Cal2
	End if 
End if 
ERR_MethodTrackerReturn("SEL_AllRecords"; $_t_oldMethodName)
