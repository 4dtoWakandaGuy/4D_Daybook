//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_BUILDREPORTSLIST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aREPORTFILE;0)
	//ARRAY TEXT(REP_at_ReportFunctions;0)
	//ARRAY TEXT(REP_at_ReportTitles;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_BUILDREPORTSLIST")

ARRAY LONGINT:C221(aREPORTFILE; 180)
ARRAY TEXT:C222(REP_at_ReportTitles; 180)
ARRAY TEXT:C222(REP_at_ReportFunctions; 180)
aREPORTFILE{1}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{2}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{3}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{4}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{5}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{6}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{7}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{8}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{9}:=Table:C252(->[COMPANIES:2])
aREPORTFILE{10}:=Table:C252(->[COMPANIES:2])
REP_at_ReportTitles{1}:="List Companies"
REP_at_ReportTitles{2}:="Prospects Report"
REP_at_ReportTitles{3}:="Development Report"
REP_at_ReportTitles{4}:="Address Book"
REP_at_ReportTitles{5}:=""
REP_at_ReportTitles{6}:=""
REP_at_ReportTitles{7}:=""
REP_at_ReportTitles{8}:=""
REP_at_ReportTitles{9}:=""
REP_at_ReportTitles{10}:=""
REP_at_ReportFunctions{1}:="ZCompanies_List"
REP_at_ReportFunctions{2}:="ZCompanies_Pros"
REP_at_ReportFunctions{3}:="ZCompanies_Devl"
REP_at_ReportFunctions{4}:="ZCompanies_Cont"
REP_at_ReportFunctions{5}:=""
REP_at_ReportFunctions{6}:=""
REP_at_ReportFunctions{7}:=""
REP_at_ReportFunctions{8}:=""
REP_at_ReportFunctions{9}:=""
REP_at_ReportFunctions{10}:=""
//`````
aREPORTFILE{11}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{12}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{13}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{14}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{15}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{16}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{17}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{18}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{19}:=Table:C252(->[CONTACTS:1])
aREPORTFILE{20}:=Table:C252(->[CONTACTS:1])
REP_at_ReportTitles{11}:="List Contacts"
REP_at_ReportTitles{12}:=""
REP_at_ReportTitles{13}:=""
REP_at_ReportTitles{14}:=""
REP_at_ReportTitles{15}:=""
REP_at_ReportTitles{16}:=""
REP_at_ReportTitles{17}:=""
REP_at_ReportTitles{18}:=""
REP_at_ReportTitles{19}:=""
REP_at_ReportTitles{20}:=""
REP_at_ReportFunctions{11}:="Zcontacts_List"
REP_at_ReportFunctions{12}:=""
REP_at_ReportFunctions{13}:=""
REP_at_ReportFunctions{14}:=""
REP_at_ReportFunctions{15}:=""
REP_at_ReportFunctions{16}:=""
REP_at_ReportFunctions{17}:=""
REP_at_ReportFunctions{18}:=""
REP_at_ReportFunctions{19}:=""
REP_at_ReportFunctions{20}:=""
//```````````````````````
aREPORTFILE{21}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{22}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{23}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{24}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{25}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{26}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{27}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{28}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{29}:=Table:C252(->[PRODUCTS:9])
aREPORTFILE{30}:=Table:C252(->[PRODUCTS:9])
REP_at_ReportTitles{21}:="List Products"
REP_at_ReportTitles{22}:="Price List"
REP_at_ReportTitles{23}:="Re-Ordering Report"
REP_at_ReportTitles{24}:=""
REP_at_ReportTitles{25}:=""
REP_at_ReportTitles{26}:=""
REP_at_ReportTitles{27}:=""
REP_at_ReportTitles{28}:=""
REP_at_ReportTitles{29}:=""
REP_at_ReportTitles{20}:=""
REP_at_ReportFunctions{21}:="Zproducts_List"
REP_at_ReportFunctions{22}:="Prod_Price_PL"
REP_at_ReportFunctions{23}:="Zproducts Record"
REP_at_ReportFunctions{24}:=""
REP_at_ReportFunctions{25}:=""
REP_at_ReportFunctions{26}:=""
REP_at_ReportFunctions{27}:=""
REP_at_ReportFunctions{28}:=""
REP_at_ReportFunctions{29}:=""
REP_at_ReportFunctions{30}:=""
//```````````````````````
aREPORTFILE{31}:=Table:C252(->[DIARY:12])
aREPORTFILE{32}:=Table:C252(->[DIARY:12])
aREPORTFILE{33}:=Table:C252(->[DIARY:12])
aREPORTFILE{34}:=Table:C252(->[DIARY:12])
aREPORTFILE{35}:=Table:C252(->[DIARY:12])
aREPORTFILE{36}:=Table:C252(->[DIARY:12])
aREPORTFILE{37}:=Table:C252(->[DIARY:12])
aREPORTFILE{38}:=Table:C252(->[DIARY:12])
aREPORTFILE{39}:=Table:C252(->[DIARY:12])
aREPORTFILE{40}:=Table:C252(->[DIARY:12])
REP_at_ReportTitles{31}:="List Diary"
REP_at_ReportTitles{32}:="Call_Summaries"
REP_at_ReportTitles{33}:=""
REP_at_ReportTitles{34}:=""
REP_at_ReportTitles{35}:=""
REP_at_ReportTitles{36}:=""
REP_at_ReportTitles{37}:=""
REP_at_ReportTitles{38}:=""
REP_at_ReportTitles{39}:=""
REP_at_ReportTitles{40}:=""
REP_at_ReportFunctions{31}:="ZDiary_List"
REP_at_ReportFunctions{32}:="ZDiary_Summ"
REP_at_ReportFunctions{33}:=""
REP_at_ReportFunctions{34}:=""
REP_at_ReportFunctions{35}:=""
REP_at_ReportFunctions{36}:=""
REP_at_ReportFunctions{37}:=""
REP_at_ReportFunctions{38}:=""
REP_at_ReportFunctions{39}:=""
REP_at_ReportFunctions{40}:=""
//```````````````````````
aREPORTFILE{41}:=Table:C252(->[ORDERS:24])
aREPORTFILE{42}:=Table:C252(->[ORDERS:24])
aREPORTFILE{43}:=Table:C252(->[ORDERS:24])
aREPORTFILE{44}:=Table:C252(->[ORDERS:24])
aREPORTFILE{45}:=Table:C252(->[ORDERS:24])
aREPORTFILE{46}:=Table:C252(->[ORDERS:24])
aREPORTFILE{47}:=Table:C252(->[ORDERS:24])
aREPORTFILE{48}:=Table:C252(->[ORDERS:24])
aREPORTFILE{49}:=Table:C252(->[ORDERS:24])
aREPORTFILE{50}:=Table:C252(->[ORDERS:24])
REP_at_ReportTitles{41}:="List EnquiryWriter"
REP_at_ReportTitles{42}:="Sources Statistics"
REP_at_ReportTitles{43}:="Order Forecasts"
REP_at_ReportTitles{44}:="List Orders"
REP_at_ReportTitles{45}:=""
REP_at_ReportTitles{46}:=""
REP_at_ReportTitles{47}:=""
REP_at_ReportTitles{48}:=""
REP_at_ReportTitles{49}:=""
REP_at_ReportTitles{50}:=""
REP_at_ReportFunctions{41}:="ZOrders_ListV"
REP_at_ReportFunctions{42}:="ZSourcesStats"
REP_at_ReportFunctions{43}:="Zorders_Fore"
REP_at_ReportFunctions{44}:="ZOrders_List"
REP_at_ReportFunctions{45}:=""
REP_at_ReportFunctions{46}:=""
REP_at_ReportFunctions{47}:=""
REP_at_ReportFunctions{48}:=""
REP_at_ReportFunctions{49}:=""
REP_at_ReportFunctions{50}:=""
//```````````````````````
aREPORTFILE{51}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{52}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{53}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{54}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{55}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{56}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{57}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{58}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{59}:=Table:C252(->[STOCK_MOVEMENTS:40])
aREPORTFILE{60}:=Table:C252(->[STOCK_MOVEMENTS:40])
REP_at_ReportTitles{51}:="Movements_List"
REP_at_ReportTitles{52}:="Current Stock_List"
REP_at_ReportTitles{53}:="Consolidated Levels & Values"
REP_at_ReportTitles{54}:="Re-Ordering Report"
REP_at_ReportTitles{55}:=""
REP_at_ReportTitles{56}:=""
REP_at_ReportTitles{57}:=""
REP_at_ReportTitles{58}:=""
REP_at_ReportTitles{59}:=""
REP_at_ReportTitles{60}:=""
REP_at_ReportFunctions{51}:="ZMovements_List"
REP_at_ReportFunctions{52}:="ZStockCurr_List"
REP_at_ReportFunctions{53}:="ZStockLev_List"
REP_at_ReportFunctions{54}:="ZProducts Record"
REP_at_ReportFunctions{55}:=""
REP_at_ReportFunctions{56}:=""
REP_at_ReportFunctions{57}:=""
REP_at_ReportFunctions{58}:=""
REP_at_ReportFunctions{59}:=""
REP_at_ReportFunctions{60}:=""
//[STOCK ITEMS]
//```````````````````````
aREPORTFILE{61}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{62}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{63}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{64}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{65}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{66}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{67}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{68}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{69}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
aREPORTFILE{70}:=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])
REP_at_ReportTitles{61}:="Stock Items List"
REP_at_ReportTitles{62}:="Bill of Materials"
REP_at_ReportTitles{63}:=""
REP_at_ReportTitles{64}:=""
REP_at_ReportTitles{65}:=""
REP_at_ReportTitles{66}:=""
REP_at_ReportTitles{67}:=""
REP_at_ReportTitles{68}:=""
REP_at_ReportTitles{69}:=""
REP_at_ReportTitles{70}:=""
REP_at_ReportFunctions{61}:="ZStock_List"
REP_at_ReportFunctions{62}:="Zstock Ass BoM"
REP_at_ReportFunctions{63}:=""
REP_at_ReportFunctions{64}:=""
REP_at_ReportFunctions{65}:=""
REP_at_ReportFunctions{66}:=""
REP_at_ReportFunctions{67}:=""
REP_at_ReportFunctions{68}:=""
REP_at_ReportFunctions{69}:=""
REP_at_ReportFunctions{70}:=""
//[CURRENT STOCK]
//```````````````````````
aREPORTFILE{71}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{72}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{73}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{74}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{75}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{76}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{77}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{78}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{79}:=Table:C252(->[CURRENT_STOCK:62])
aREPORTFILE{80}:=Table:C252(->[CURRENT_STOCK:62])
REP_at_ReportTitles{71}:="Current Stock_List"
REP_at_ReportTitles{72}:=""
REP_at_ReportTitles{73}:=""
REP_at_ReportTitles{74}:=""
REP_at_ReportTitles{75}:=""
REP_at_ReportTitles{76}:=""
REP_at_ReportTitles{77}:=""
REP_at_ReportTitles{78}:=""
REP_at_ReportTitles{79}:=""
REP_at_ReportTitles{80}:=""
REP_at_ReportFunctions{71}:="ZStockCurr_List"
REP_at_ReportFunctions{72}:=""
REP_at_ReportFunctions{73}:=""
REP_at_ReportFunctions{74}:=""
REP_at_ReportFunctions{75}:=""
REP_at_ReportFunctions{76}:=""
REP_at_ReportFunctions{77}:=""
REP_at_ReportFunctions{88}:=""
REP_at_ReportFunctions{79}:=""
REP_at_ReportFunctions{80}:=""
//[CURRENT STOCK]
//```````````````````````
aREPORTFILE{81}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{82}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{83}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{84}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{85}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{86}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{87}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{88}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{89}:=Table:C252(->[STOCK_LEVELS:58])
aREPORTFILE{90}:=Table:C252(->[STOCK_LEVELS:58])
REP_at_ReportTitles{81}:="Stock Levels & Values"
REP_at_ReportTitles{82}:=""
REP_at_ReportTitles{83}:=""
REP_at_ReportTitles{84}:=""
REP_at_ReportTitles{85}:=""
REP_at_ReportTitles{86}:=""
REP_at_ReportTitles{87}:=""
REP_at_ReportTitles{88}:=""
REP_at_ReportTitles{89}:=""
REP_at_ReportTitles{90}:=""
REP_at_ReportFunctions{81}:="ZstockLev_List"
REP_at_ReportFunctions{82}:=""
REP_at_ReportFunctions{83}:=""
REP_at_ReportFunctions{84}:=""
REP_at_ReportFunctions{85}:=""
REP_at_ReportFunctions{86}:=""
REP_at_ReportFunctions{87}:=""
REP_at_ReportFunctions{88}:=""
REP_at_ReportFunctions{89}:=""
REP_at_ReportFunctions{90}:=""
//```````````````````````
aREPORTFILE{91}:=Table:C252(->[INVOICES:39])
aREPORTFILE{92}:=Table:C252(->[INVOICES:39])
aREPORTFILE{93}:=Table:C252(->[INVOICES:39])
aREPORTFILE{94}:=Table:C252(->[INVOICES:39])
aREPORTFILE{95}:=Table:C252(->[INVOICES:39])
aREPORTFILE{96}:=Table:C252(->[INVOICES:39])
aREPORTFILE{97}:=Table:C252(->[INVOICES:39])
aREPORTFILE{98}:=Table:C252(->[INVOICES:39])
aREPORTFILE{99}:=Table:C252(->[INVOICES:39])
aREPORTFILE{100}:=Table:C252(->[INVOICES:39])
REP_at_ReportTitles{91}:="Sales Daybook"
REP_at_ReportTitles{92}:="List Sales Ledger"
REP_at_ReportTitles{93}:="Statements - Due Amounts"
REP_at_ReportTitles{94}:="Statements - of Account"
REP_at_ReportTitles{95}:="Aged Debtors"
REP_at_ReportTitles{96}:="Aged Debtors As at"
REP_at_ReportTitles{97}:="EU Sales List"
REP_at_ReportTitles{98}:=""
REP_at_ReportTitles{99}:=""
REP_at_ReportTitles{100}:=""
REP_at_ReportFunctions{91}:="ZInvoices_Day"
REP_at_ReportFunctions{92}:="ZInvoices_List"
REP_at_ReportFunctions{93}:="ZInvoices_State"
REP_at_ReportFunctions{94}:="ZInvoices_SOA"
REP_at_ReportFunctions{95}:="ZInvoices_AD"
REP_at_ReportFunctions{96}:="ZInvoices_ADAA"
REP_at_ReportFunctions{97}:="ZInvoices_VAT10"
REP_at_ReportFunctions{98}:=""
REP_at_ReportFunctions{99}:=""
REP_at_ReportFunctions{100}:=""
//```````````````````````
aREPORTFILE{101}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{102}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{103}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{104}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{105}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{106}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{107}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{108}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{109}:=Table:C252(->[TRANSACTION_BATCHES:30])
aREPORTFILE{110}:=Table:C252(->[TRANSACTION_BATCHES:30])
REP_at_ReportTitles{101}:="Audit Trail"
REP_at_ReportTitles{102}:="Transaction Batches"
REP_at_ReportTitles{103}:=""
REP_at_ReportTitles{104}:=""
REP_at_ReportTitles{105}:=""
REP_at_ReportTitles{106}:=""
REP_at_ReportTitles{107}:="t"
REP_at_ReportTitles{108}:=""
REP_at_ReportTitles{109}:=""
REP_at_ReportTitles{110}:=""
REP_at_ReportFunctions{101}:="ZTransB_Audit"
REP_at_ReportFunctions{102}:="ZTransB_ListP"
REP_at_ReportFunctions{103}:=""
REP_at_ReportFunctions{104}:=""
REP_at_ReportFunctions{105}:=""
REP_at_ReportFunctions{106}:=""
REP_at_ReportFunctions{107}:=""
REP_at_ReportFunctions{108}:=""
REP_at_ReportFunctions{109}:=""
REP_at_ReportFunctions{110}:=""

//[TRANSACTIONS]

//```````````````````````
aREPORTFILE{111}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{112}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{113}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{114}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{115}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{116}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{117}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{118}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{119}:=Table:C252(->[TRANSACTIONS:29])
aREPORTFILE{120}:=Table:C252(->[TRANSACTIONS:29])
REP_at_ReportTitles{111}:="Transactions by Date"
REP_at_ReportTitles{112}:="Transaction  by Type"
REP_at_ReportTitles{113}:="Transactions by Account"
REP_at_ReportTitles{114}:="Transactions Reports"
REP_at_ReportTitles{115}:=""
REP_at_ReportTitles{116}:=""
REP_at_ReportTitles{117}:=""
REP_at_ReportTitles{118}:=""
REP_at_ReportTitles{119}:=""
REP_at_ReportTitles{120}:=""
REP_at_ReportFunctions{111}:="ZTrans_Date"
REP_at_ReportFunctions{112}:="ZTrans_Types"
REP_at_ReportFunctions{113}:="ZTrans_Accs"
REP_at_ReportFunctions{114}:="ZTrans_Report"
REP_at_ReportFunctions{115}:=""
REP_at_ReportFunctions{116}:=""
REP_at_ReportFunctions{117}:=""
REP_at_ReportFunctions{118}:=""
REP_at_ReportFunctions{119}:=""
REP_at_ReportFunctions{120}:=""
//[TRANSACTIONS]

//```````````````````````
aREPORTFILE{121}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{122}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{123}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{124}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{125}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{126}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{127}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{128}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{129}:=Table:C252(->[ACCOUNT_BALANCES:34])
aREPORTFILE{130}:=Table:C252(->[ACCOUNT_BALANCES:34])
REP_at_ReportTitles{121}:="Period Balances List"
REP_at_ReportTitles{122}:="Period Balances Reports"
REP_at_ReportTitles{123}:="Trial Balance"
REP_at_ReportTitles{124}:="Profit & Loss"
REP_at_ReportTitles{125}:="Profit & Loss V Budgets"
REP_at_ReportTitles{126}:="Profit & Loss 12 Periods"
REP_at_ReportTitles{127}:="Balance Sheet"
REP_at_ReportTitles{128}:="Vat Return"
REP_at_ReportTitles{129}:="Vat Listing"
REP_at_ReportTitles{130}:=""
REP_at_ReportFunctions{121}:="ZaccBal_List"
REP_at_ReportFunctions{122}:="ZaccBal_Report"
REP_at_ReportFunctions{123}:="ZAccBal_PL_B"
REP_at_ReportFunctions{124}:="ZAccBal_PL12"
REP_at_ReportFunctions{125}:="ZAccBal_BS"
REP_at_ReportFunctions{126}:="ZAccBal VAT2"
REP_at_ReportFunctions{127}:="ZTrans_IO"
REP_at_ReportFunctions{128}:=""
REP_at_ReportFunctions{129}:=""
REP_at_ReportFunctions{130}:=""
//`
//[PURCHASES]

//```````````````````````
aREPORTFILE{131}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{132}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{133}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{134}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{135}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{136}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{137}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{138}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{139}:=Table:C252(->[PURCHASE_INVOICES:37])
aREPORTFILE{140}:=Table:C252(->[PURCHASE_INVOICES:37])
REP_at_ReportTitles{131}:="Purchase Daybook"
REP_at_ReportTitles{132}:="List Purchase Ledger"
REP_at_ReportTitles{133}:="Aged Creditors"
REP_at_ReportTitles{134}:="Aged Creditors as at"
REP_at_ReportTitles{135}:=""
REP_at_ReportTitles{136}:=""
REP_at_ReportTitles{137}:=""
REP_at_ReportTitles{138}:=""
REP_at_ReportTitles{139}:=""
REP_at_ReportTitles{140}:=""
REP_at_ReportFunctions{131}:="Zpurchases_Day"
REP_at_ReportFunctions{132}:="Zpurchases_List"
REP_at_ReportFunctions{133}:="ZPurchases_AC"
REP_at_ReportFunctions{134}:="ZPurchases_ACAA"
REP_at_ReportFunctions{135}:=""
REP_at_ReportFunctions{136}:=""
REP_at_ReportFunctions{137}:=""
REP_at_ReportFunctions{138}:=""
REP_at_ReportFunctions{139}:=""
REP_at_ReportFunctions{140}:=""

//ORDER ITEMS

//```````````````````````
aREPORTFILE{141}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{142}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{143}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{144}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{145}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{146}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{147}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{148}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{149}:=Table:C252(->[ORDER_ITEMS:25])
aREPORTFILE{150}:=Table:C252(->[ORDER_ITEMS:25])
REP_at_ReportTitles{141}:="List Order Items"
REP_at_ReportTitles{142}:=""
REP_at_ReportTitles{143}:=""
REP_at_ReportTitles{144}:=""
REP_at_ReportTitles{145}:=""
REP_at_ReportTitles{146}:=""
REP_at_ReportTitles{147}:=""
REP_at_ReportTitles{148}:=""
REP_at_ReportTitles{149}:=""
REP_at_ReportTitles{150}:=""
REP_at_ReportFunctions{141}:="ZOrders_List"
REP_at_ReportFunctions{142}:=""
REP_at_ReportFunctions{143}:=""
REP_at_ReportFunctions{144}:=""
REP_at_ReportFunctions{145}:=""
REP_at_ReportFunctions{146}:=""
REP_at_ReportFunctions{147}:=""
REP_at_ReportFunctions{148}:=""
REP_at_ReportFunctions{149}:=""
REP_at_ReportFunctions{150}:=""

//Purchase orders

//```````````````````````
aREPORTFILE{151}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{152}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{153}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{154}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{155}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{156}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{157}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{158}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{159}:=Table:C252(->[PURCHASE_ORDERS:57])
aREPORTFILE{160}:=Table:C252(->[PURCHASE_ORDERS:57])
REP_at_ReportTitles{151}:="List Purchase orders"
REP_at_ReportTitles{152}:="Outstantding order Items"
REP_at_ReportTitles{153}:="Batch Purchase orders"
REP_at_ReportTitles{154}:=""
REP_at_ReportTitles{155}:=""
REP_at_ReportTitles{156}:=""
REP_at_ReportTitles{157}:=""
REP_at_ReportTitles{158}:=""
REP_at_ReportTitles{159}:=""
REP_at_ReportTitles{160}:=""
REP_at_ReportFunctions{151}:="ZPurchOrd_List"
REP_at_ReportFunctions{152}:="ZOrderI_Outstdg"
REP_at_ReportFunctions{153}:="ZOrders_Purch"
REP_at_ReportFunctions{154}:=""
REP_at_ReportFunctions{155}:=""
REP_at_ReportFunctions{156}:=""
REP_at_ReportFunctions{157}:=""
REP_at_ReportFunctions{158}:=""
REP_at_ReportFunctions{159}:=""
REP_at_ReportFunctions{160}:=""

//```
aREPORTFILE{161}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{162}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{163}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{164}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{165}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{166}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{167}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{168}:=Table:C252(->[SERVICE_CALLS:20])
aREPORTFILE{169}:=Table:C252(->[SERVICE_CALLS:20])

aREPORTFILE{170}:=Table:C252(->[SERVICE_CALLS:20])

REP_at_ReportTitles{161}:="Call Sheets"
REP_at_ReportTitles{162}:="Calls_List"
REP_at_ReportTitles{163}:="Calls Analysis"
REP_at_ReportTitles{164}:="Contracts_List"
REP_at_ReportTitles{165}:=""
REP_at_ReportTitles{166}:=""
REP_at_ReportTitles{167}:=""
REP_at_ReportTitles{168}:=""
REP_at_ReportTitles{169}:=""
REP_at_ReportTitles{170}:=""
REP_at_ReportFunctions{161}:="ZCalls_Sheets"
REP_at_ReportFunctions{162}:="ZCallsList"
REP_at_ReportFunctions{163}:="ZCalls Anal"
REP_at_ReportFunctions{164}:="ZConttacts List"
REP_at_ReportFunctions{165}:=""
REP_at_ReportFunctions{166}:=""
REP_at_ReportFunctions{167}:=""
REP_at_ReportFunctions{168}:=""
REP_at_ReportFunctions{169}:=""
REP_at_ReportFunctions{170}:=""

//```
aREPORTFILE{171}:=Table:C252(->[JOBS:26])
aREPORTFILE{172}:=Table:C252(->[JOBS:26])
aREPORTFILE{173}:=Table:C252(->[JOBS:26])
aREPORTFILE{174}:=Table:C252(->[JOBS:26])
aREPORTFILE{175}:=Table:C252(->[JOBS:26])
aREPORTFILE{176}:=Table:C252(->[JOBS:26])
aREPORTFILE{177}:=Table:C252(->[JOBS:26])
aREPORTFILE{178}:=Table:C252(->[JOBS:26])
aREPORTFILE{179}:=Table:C252(->[JOBS:26])

aREPORTFILE{180}:=Table:C252(->[JOBS:26])

REP_at_ReportTitles{171}:="Jobs_List"
REP_at_ReportTitles{172}:="Job Stages List"
REP_at_ReportTitles{173}:="Jobs Personnel List"
REP_at_ReportTitles{174}:="TIme Sheets"
REP_at_ReportTitles{175}:="Time_List"
REP_at_ReportTitles{176}:="Productivity"
REP_at_ReportTitles{177}:=""
REP_at_ReportTitles{178}:=""
REP_at_ReportTitles{179}:=""
REP_at_ReportTitles{180}:=""
REP_at_ReportFunctions{171}:="ZJobsList"
REP_at_ReportFunctions{172}:="ZJobStagesList"
REP_at_ReportFunctions{173}:="ZJob Pers List"
REP_at_ReportFunctions{174}:="ZJobs_TS"
REP_at_ReportFunctions{175}:=""
REP_at_ReportFunctions{176}:=""
REP_at_ReportFunctions{177}:=""
REP_at_ReportFunctions{178}:=""
REP_at_ReportFunctions{179}:=""
REP_at_ReportFunctions{180}:=""
ERR_MethodTrackerReturn("WS_BUILDREPORTSLIST"; $_t_oldMethodName)
