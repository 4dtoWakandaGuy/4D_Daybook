//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen ZbyNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ZbyNo")
Case of 
	: ($1=1)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
	: ($1=2)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
		
	: ($1=12)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[DIARY:12])))
		
		//ZDiary_Mod
	: ($1=17)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTRACTS:17])))
		
		//ZContracts_Mod
	: ($1=20)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
		
		//ZCalls_Mod
	: ($1=24)
		//ZOrders_Mod
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDERS:24])))
		
	: ($1=25)
		
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
		
	: ($1=26)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOBS:26])))
		
		
	: ($1=27)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
	: ($1=29)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTIONS:29])))
		//ZTrans_Report
	: ($1=37)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
		
		
	: ($1=39)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])))
		
		
	: ($1=40)
		
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
		
	: ($1=47)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOB_STAGES:47])))
		
		
	: ($1=48)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOB PERSONNEL:48])))
		
		
	: ($1=55)
		//ZQualities_Mod
	: ($1=57)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
		
		//ZPurchOrd_Mod
	: ($1=58)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_LEVELS:58])))
		
		//ZStockLev_Mod
	: ($1=62)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])))
		
		//ZStockCurr_Mod
		
		
	: ($1=89)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PROJECTS:89])))
		
End case 
ERR_MethodTrackerReturn("Gen ZbyNo"; $_t_oldMethodName)