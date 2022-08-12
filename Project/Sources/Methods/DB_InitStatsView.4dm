//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_InitStatsView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   18/04/2011 08:12 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_stats;0)
	//ARRAY BOOLEAN(SV_lb_LBFooters;0)
	//ARRAY BOOLEAN(SV_lb_LBheaders;0)
	//ARRAY LONGINT(<>SV_al_Calc3;0)
	//ARRAY LONGINT(<>SV_al_Calc4;0)
	//ARRAY LONGINT(<>SV_al_Field3;0)
	//ARRAY LONGINT(<>SV_al_Field4;0)
	//ARRAY LONGINT(<>SV_al_TableNums;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_Calc3FieldPop;0)
	//ARRAY LONGINT(SV_al_Calc4FieldPop;0)
	//ARRAY LONGINT(SV_al_FieldNumPop;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>SV_at_FieldName1;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_Calc3Pop;0)
	//ARRAY TEXT(SV_at_CalcOption3;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_CalcOption4Pop;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	//ARRAY TEXT(SV_at_FieldsPop;0)
	//ARRAY TEXT(SV_at_Footer1;0)
	//ARRAY TEXT(SV_at_Footer2;0)
	//ARRAY TEXT(SV_at_Footer3;0)
	//ARRAY TEXT(SV_at_Footer4;0)
	//ARRAY TEXT(SV_at_Footer5;0)
	//ARRAY TEXT(SV_at_Label1;0)
	//ARRAY TEXT(SV_at_Label2;0)
	//ARRAY TEXT(SV_at_Label3;0)
	//ARRAY TEXT(SV_at_Label4;0)
	//ARRAY TEXT(SV_at_Label5;0)
	C_BOOLEAN:C305(<>Stats_bo_Arraysinited; $0; SYS_bo_StatsView)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; $_l_FieldNumberRow; $_l_Index; $_l_TableNumberRow; COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7)
	C_LONGINT:C283(COM_l_BUT8; COM_l_BUT9; SF_l_BUT1; SF_l_But2; SF_l_BUT3; SF_l_BUT4; SF_l_BUT5; SF_l_BUT6; SF_l_BUT7; SF_l_BUT8; SF_l_BUT9)
	C_LONGINT:C283(SV_l_BUT1; SV_l_But2; SV_l_BUT3; SV_l_BUT4; SV_l_BUT5; SV_l_BUT6; SV_l_BUT7; SV_l_BUT8; SV_l_BUT9)
	C_POINTER:C301(FilePtr; vFilePtr)
	C_REAL:C285($1)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; $_t_oldMethodName; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7; COM_t_COL8; COM_t_COL9)
	C_TEXT:C284(COM_t_HED1; COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9; SF_t_COL1; SF_t_COL2)
	C_TEXT:C284(SF_t_COL3; SF_t_COL4; SF_t_COL5; SF_t_COL6; SF_t_COL7; SF_t_COL8; SF_t_COL9; SF_t_HED1; SF_t_HED2; SF_t_HED3; SF_t_HED4)
	C_TEXT:C284(SF_t_HED5; SF_t_HED6; SF_t_HED7; SF_t_HED8; SF_t_HED9; SV_t_COL1; SV_t_COL2; SV_t_COL3; SV_t_COL4; SV_t_COL5; SV_t_COL6)
	C_TEXT:C284(SV_t_COL7; SV_t_COL8; SV_t_COL9; SV_t_HED1; SV_t_HED2; SV_t_HED3; SV_t_HED4; SV_t_HED5; SV_t_HED6; SV_t_HED7; SV_t_HED8)
	C_TEXT:C284(SV_t_HED9; vSVCF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_InitStatsView")
If (Not:C34(<>Stats_bo_Arraysinited))
	StatsView_Setup
End if 
$0:=True:C214
Case of 
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		vFilePtr:=->[ACCOUNT_BALANCES:34]
		SYS_bo_StatsView:=True:C214
		vSVCF:="ACC_BalSVCallsFile"
		StatsView_ArFiS("Balances/34/ACC_BalSelect/"+"Transactions/29/Trans_Sel/Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel"+"/Jobs/26/Jobs_Sel/")
		StatsView_ArF1S("1.36/2.32.2,3/4.33/5.76/6.71/")
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		vFilePtr:=->[SERVICE_CALLS:20]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Calls_SVCF"
		StatsView_ArFiS("Service Calls/20/Calls_Sel/Diary/12/Diary_Sel/")
		StatsView_ArF1S("1.2/2.1.2,5/8/9/10/11.11/13.11/14.22/16.23/")
	: ($1=Table:C252(->[COMPANIES:2]))
		vFilePtr:=->[COMPANIES:2]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Companies_SVCF"
		StatsView_ArFiS("Companies/2/Comp_Sel/Contacts/1/Cont_Sel/Qualities/55/Qualities_Sel/"+"Diary/12/Diary_Sel/Sales Orders/24/Orders_Sel/"+"Order Items/25/OrderI_Sel/Purchase Orders/57/PurchOrd_Sel/"+"Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel/Nominal Ledger/29/Trans_Sel/"+"Service Calls/20/Calls_Sel/Jobs/26/Jobs_Sel/")
		StatsView_ArF1S("5/6/8/11.3/12.4/13.5/14.6/17/26.11/29.11")
	: ($1=Table:C252(->[CONTACTS:1]))
		vFilePtr:=->[CONTACTS:1]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Contacts_SVCF"
		StatsView_ArFiS("Contacts/1/Cont_Sel/Companies/2/Comp_Sel/Qualities/55/Qualities_Sel/"+"Diary/12/Diary_Sel/Sales Orders/24/Orders_Sel/"+"Order Items/25/OrderI_Sel/"+"Sales Ledger/39/Invoices_Sel/"+"Service Calls/20/Calls_Sel/Jobs/26/Jobs_Sel/")
		StatsView_ArF1S("6/11.87/14.4/15.5/16.6/20/25.11/26")
	: ($1=Table:C252(->[CONTRACTS:17]))
		vFilePtr:=->[CONTRACTS:17]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Contracts/17/Contracts_Sel/")
		StatsView_ArF1S("1.2/2.1.2,5/4.19/9.2/")
	: ($1=Table:C252(->[DIARY:12]))
		vFilePtr:=->[DIARY:12]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Diary_SVCF"
		StatsView_ArFiS("Diary/12/Diary_Sel/Companies/2/Comp_Sel/Contacts/1/Cont_Sel/"+"Sales Orders/24/Orders_Sel/"+"Service Centre/20/Calls_Sel/Jobs/26/Jobs_Sel/")
		StatsView_ArF1S("1.2/2.1.2,5/8.11/9.13/11.14/13.9/14/15.7/17/18.41/19.26/21.47/23.11/"+"25/26/27/29/30.4/")
	: ($1=Table:C252(->[INVOICES:39]))
		vFilePtr:=->[INVOICES:39]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Invoices_SVCF"
		StatsView_ArFiS("Sales Ledger/39/Invoices_Sel/General Ledger/29/Trans_Sel/")
		StatsView_ArF1S("2.2/3.1.2,5/10/13.33/17.36/21/22.54/27.71/29.3/38.76/39.41/42.11/")
	: ($1=Table:C252(->[JOB PERSONNEL:48]))
		vFilePtr:=->[JOB PERSONNEL:48]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Job Personnel/48/JobPers_Sel/")
		StatsView_ArF1S("1.26/2.45/3.11/")
	: ($1=Table:C252(->[JOBS:26]))
		vFilePtr:=->[JOBS:26]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Jobs_SVCF"
		StatsView_ArFiS("Jobs/26/Jobs_Sel/Job Stages/47/JobStages_Sel/Job Personnel/48/JobPers_Sel/"+"Cost Items/25/OrderI_Sel/")
		StatsView_ArF1S("3.2/4.1.2,5/9.90.4,2/18.45/19.11/21.65/24.36/25.71/26.76/27.89/")
	: ($1=Table:C252(->[JOB_STAGES:47]))
		vFilePtr:=->[JOB_STAGES:47]
		SYS_bo_StatsView:=True:C214
		vSVCF:="JobStages_SVCF"
		StatsView_ArFiS("Job Stages/47/JobStages_Sel/Job Personnel/48/JobPers/"+"Cost Items/25/OrderI_Sel/")
		StatsView_ArF1S("1.26/2.45/")
	: ($1=Table:C252(->[DOCUMENTS:7]))
		vFilePtr:=->[DOCUMENTS:7]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Letters_SVCF"
		StatsView_ArFiS("Documents/7/Letters_Sel/Diary/12/Diary_Sel/")
		StatsView_ArF1S("9/10.11/")
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		vFilePtr:=->[STOCK_MOVEMENTS:40]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Movements_SVCF"
		StatsView_ArFiS("Stock Movements/40/Movements_Sel/Stock Items/27/Stock_Sel/")
		StatsView_ArF1S("2.2/6.60/9.36/10.71/11.76/")
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		vFilePtr:=->[ORDER_ITEMS:25]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Order Items/25/OrderI_Sel/")
		StatsView_ArF1S("2.9/14.11/20.2/29/34/35.45/36/46/")
	: ($1=Table:C252(->[ORDERS:24]))
		vFilePtr:=->[ORDERS:24]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Orders_SVCF"
		StatsView_ArFiS("Orders/24/Orders_Sel/Order Items/25/OrderI_Sel/Diary/12/Diary_Sel/")
		StatsView_ArF1S("1.2/2.1.2,5/5.11/15.90.4,2/17.11/18.5/32.71/33.36/35.3/42.33/43.65/47.76/48.41/")
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		vFilePtr:=->[PRICE_TABLE:28]
		SYS_bo_StatsView:=True:C214
		vSVCF:="PriceT_SVCF"
		StatsView_ArFiS("Price Table/28/PriceT_Sel/Order Items/25/OrderI_Sel/")
		StatsView_ArF1S("1.9/2.18/6.10/7.8/8.2/13.71/")
	: ($1=Table:C252(->[PRODUCTS:9]))
		vFilePtr:=->[PRODUCTS:9]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Products_SVCF"
		StatsView_ArFiS("Products/9/Prod_Sel/Diary/12/Diary_Sel/"+"Order Items/25/OrderI_Sel/Stock Items/27/Stock_Sel/"+"Current Stock/62/StockCurr_Sel/Stock Levels/58/StockLev_Sel/")
		StatsView_ArF1S("3.10/4.8/8/14/15/17/19/")
	: ($1=Table:C252(->[PROJECTS:89]))
		vFilePtr:=->[PROJECTS:89]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Projects_SVCF"
		StatsView_ArFiS("Projects/89/Projects_Sel/Jobs/26/Jobs_Sel/")
		StatsView_ArF1S("3.2/4.1.2,5/7.65/9.90.4,2/")
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		vFilePtr:=->[PURCHASE_INVOICES:37]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Purchases_SVCF"
		StatsView_ArFiS("Purchase Ledger/37/Purchases_Sel/General Ledger/29/Trans_Sel/")
		
		StatsView_ArF1S("2.2/3.33/15.36/18/21.3/25.71/26/30.76/31.41/")
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		vFilePtr:=->[PURCHASE_ORDERS:57]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Purchase Orders/57/PurchOrd_Sel")
		StatsView_ArF1S("1.2/5.1.2,5/6.2/14/15.36/16.71/17.76/")
	: ($1=Table:C252(->[INFORMATION:55]))
		FilePtr:=->[INFORMATION:55]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Qualities/55/Qualities_Sel/")
		StatsView_ArF1S("1.1.2,5/2/4/5/6/7.2/")
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		vFilePtr:=->[STOCK_MOVEMENT_ITEMS:27]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Stock Items/27/Stock_Sel/")
		StatsView_ArF1S("1.9/2.2/7.61/")
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		vFilePtr:=->[CURRENT_STOCK:62]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Current Stock/62/StockCurr_Sel/")
		StatsView_ArF1S("1.9/3.59/8.61/10.36/11.71/12.76/")
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		vFilePtr:=->[STOCK_LEVELS:58]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Stock Levels/58/StockLev_Sel/")
		StatsView_ArF1S("1.9/2.59/7.36/8.71/9.76/")
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		vFilePtr:=->[TRANSACTIONS:29]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Trans_SVCF"
		StatsView_ArFiS("Transactions/29/Trans_Sel/Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel"+"/Jobs/26/Jobs_Sel/")
		
		StatsView_ArF1S("1.31/2.36/3.32.2,3/9.2/12.33/14/18/21/22.71/23.76/26.41/")
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		vFilePtr:=->[TRANSACTION_BATCHES:30]
		SYS_bo_StatsView:=True:C214
		vSVCF:=""
		StatsView_ArFiS("Batches/30/TransB_Sel/")
		StatsView_ArF1S("11/14/15/")
		
	Else 
		$0:=False:C215
		
End case 
If ($0)
	StatsView_Arr(0; 0)
	$_l_TableNumberRow:=Find in array:C230(<>SV_al_TableNums; $1)
	If ($_l_TableNumberRow>0)
		$_l_FieldNumberRow:=Find in array:C230(SV_at_FieldName1; <>SV_at_FieldName1{$_l_TableNumberRow})
		If ($_l_FieldNumberRow>0)
			SV_at_FieldName1:=$_l_FieldNumberRow
			If (<>SV_al_Field3{$_l_TableNumberRow}>0)
				SV_at_FieldName3:=<>SV_al_Field3{$_l_TableNumberRow}
			End if 
			If (<>SV_al_Field4{$_l_TableNumberRow}>0)
				SV_at_FieldName4:=<>SV_al_Field4{$_l_TableNumberRow}
			End if 
			If (<>SV_al_Calc3{$_l_TableNumberRow}>0)
				SV_at_CalcOption3:=<>SV_al_Calc3{$_l_TableNumberRow}
			End if 
			If (<>SV_al_Calc4{$_l_TableNumberRow}>0)
				SV_at_CalcOption4:=<>SV_al_Calc4{$_l_TableNumberRow}
			End if 
		End if 
	End if 
	DB_at_TableName:=1
	SV_al_TableNumber:=1
	StatsView_ArF3(SV_al_TableNumber{SV_al_TableNumber})  //Is the one selected
	ARRAY TEXT:C222(SV_at_CalcOption3; 4)
	SV_at_CalcOption3{1}:="Sum of"
	SV_at_CalcOption3{2}:="Average"
	SV_at_CalcOption3{3}:="Highest"
	SV_at_CalcOption3{4}:="Lowest"
	SV_at_CalcOption3:=1
	COPY ARRAY:C226(SV_at_CalcOption3; SV_at_CalcOption4)
	SV_at_CalcOption4:=1
	
	
	ARRAY TEXT:C222(SV_at_Label1; 1)
	ARRAY TEXT:C222(SV_at_Label2; 1)
	ARRAY TEXT:C222(SV_at_Label3; 1)
	ARRAY TEXT:C222(SV_at_Label4; 1)
	ARRAY TEXT:C222(SV_at_Label5; 1)
	
	ARRAY TEXT:C222(SV_at_Footer1; 1)
	ARRAY TEXT:C222(SV_at_Footer2; 1)
	ARRAY TEXT:C222(SV_at_Footer3; 1)
	ARRAY TEXT:C222(SV_at_Footer4; 1)
	ARRAY TEXT:C222(SV_at_Footer5; 1)
	
	SV_at_Label1{1}:=SV_at_FieldName1{1}
	SV_at_Label2{1}:="Line Count"
	SV_at_Label3{1}:=SV_at_CalcOption3{1}+" "+SV_at_FieldName3{1}
	SV_at_Label4{1}:=SV_at_CalcOption4{1}+" "+SV_at_FieldName4{1}
	
	LB_SetupListbox(->SV_lb_LBheaders; "SV_t"; "SV_L"; 1; ->SV_at_Label1; ->SV_at_Label2; ->SV_at_Label3; ->SV_at_Label4; ->SV_at_Label5)
	//->SV_at_Label5)
	LB_SetColumnHeaders(->SV_lb_LBheaders; "SV_L"; 1; "COL1"; "COl2"; "COl3"; "COL4"; "COL5")
	COPY ARRAY:C226(SV_at_FieldName1; SV_at_FieldsPop)
	ARRAY LONGINT:C221(SV_al_FieldNumPop; Size of array:C274(SV_at_FieldsPop))
	
	APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
	APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
	APPEND TO ARRAY:C911(SV_at_FieldsPop; "All Fields")
	APPEND TO ARRAY:C911(SV_al_FieldNumPop; -2)
	APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
	APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
	For ($_l_Index; 1; Size of array:C274(DB_at_TableName))
		APPEND TO ARRAY:C911(SV_at_FieldsPop; DB_at_TableName{$_l_Index})
		APPEND TO ARRAY:C911(SV_al_FieldNumPop; -3)
	End for 
	LB_SetChoiceList("SVFields"; ->SV_at_FieldsPop; ->SV_at_Label1)
	COPY ARRAY:C226(SV_at_CalcOption3; SV_at_Calc3Pop)
	ARRAY LONGINT:C221(SV_al_Calc3FieldPop; Size of array:C274(SV_at_Calc3Pop))
	APPEND TO ARRAY:C911(SV_at_Calc3Pop; " ")
	APPEND TO ARRAY:C911(SV_al_Calc3FieldPop; -1)
	For ($_l_Index; 1; Size of array:C274(SV_at_FieldName3))
		APPEND TO ARRAY:C911(SV_at_Calc3Pop; SV_at_FieldName3{$_l_Index})
		APPEND TO ARRAY:C911(SV_al_Calc3FieldPop; -3)
	End for 
	LB_SetChoiceList("SVCalc3"; ->SV_at_Calc3Pop; ->SV_at_Label3)
	COPY ARRAY:C226(SV_at_CalcOption4; SV_at_CalcOption4Pop)
	ARRAY LONGINT:C221(SV_al_Calc4FieldPop; Size of array:C274(SV_at_CalcOption4Pop))
	APPEND TO ARRAY:C911(SV_at_CalcOption4Pop; "-")
	APPEND TO ARRAY:C911(SV_al_Calc4FieldPop; -1)
	For ($_l_Index; 1; Size of array:C274(SV_at_FieldName4))
		APPEND TO ARRAY:C911(SV_at_CalcOption4Pop; SV_at_FieldName4{$_l_Index})
		APPEND TO ARRAY:C911(SV_al_Calc4FieldPop; -3)
	End for 
	LB_SetChoiceList("SVCalc4"; ->SV_at_CalcOption4Pop; ->SV_at_Label4)
	
	
	
	
	LB_SetColumnWidths(->SV_lb_LBheaders; "SV_t"; 1; 375; 107; 109; 125; 10)
	LB_SetEnterable(->SV_lb_LBheaders; True:C214; 0)
	LB_SetScroll(->SV_lb_LBheaders; -3; -3)
	LB_SETENTRYOPTIONS
	LB_StyleSettings(->SV_lb_LBheaders; "Black"; 10; "SV_t"; Table:C252($1))
	LB_SETFONT(->SV_lb_LBheaders; "SV_t"; 2; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)
	
	LB_SetupListbox(->SV_lb_LBFooters; "SF_t"; "SF_L"; 1; ->SV_at_Footer1; ->SV_at_Footer2; ->SV_at_Footer3; ->SV_at_Footer4; ->SV_at_Footer5)
	LB_SetColumnHeaders(->SV_lb_LBFooters; "SF_L"; 1; "COL1"; "COl2"; "COl3"; "COL4")
	LB_SetColumnWidths(->SV_lb_LBFooters; "SF_t"; 1; 375; 107; 109; 125; 10)
	LB_SetEnterable(->SV_lb_LBFooters; False:C215; 0)
	LB_SetScroll(->SV_lb_LBFooters; -3; -3)
	LB_SETENTRYOPTIONS
	LB_StyleSettings(->SV_lb_LBFooters; "Black"; 9; "SF_t"; Table:C252($1))
	LB_SETFONT(->SV_lb_LBFooters; "SF_t"; 2; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)
	
	ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
	
	LB_SetupListbox(->COM_lb_stats; "COM_t"; "COM_L"; 1; ->aSVN1; ->aSV2; ->aSV3; ->aSV4; ->aSV5)
	LB_SetColumnHeaders(->COM_lb_stats; "COM_L"; 1; "COl1"; "COl2"; "COl3"; "COL4")
	
	LB_SetColumnWidths(->COM_lb_stats; "COM_t"; 1; 375; 107; 109; 125; 10)
	
	LB_SetEnterable(->COM_lb_stats; False:C215; 0)
	LB_SetScroll(->COM_lb_stats; -3; -2)
	LB_SETENTRYOPTIONS
	LB_StyleSettings(->COM_lb_stats; "Black"; 9; "COM_t"; Table:C252($1))
	
	
	
	
End if 
ERR_MethodTrackerReturn("DB_InitStatsView"; $_t_oldMethodName)