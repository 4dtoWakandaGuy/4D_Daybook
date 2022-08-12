//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TableAreStatsAvailable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2015 09:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_StatsAvailable; $0)
	C_LONGINT:C283($_l_DIsplayRecordsTable; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TableAreStatsAvailable")
$0:=False:C215
If (Count parameters:C259>=1)
	$_l_DIsplayRecordsTable:=$1
	Case of 
		: ($_l_DIsplayRecordsTable=Table:C252(->[CONTRACTS:17]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[SERVICE_CALLS:20]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[COMPANIES:2]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[CONTACTS:1]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[DIARY:12]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[ORDERS:24]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[ORDER_ITEMS:25]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[INVOICES:39]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[TRANSACTION_BATCHES:30]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[TRANSACTIONS:29]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[STOCK_LEVELS:58]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[CURRENT_STOCK:62]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[INFORMATION:55]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[PROJECTS:89]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[PRODUCTS:9]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[PRICE_TABLE:28]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[DOCUMENTS:7]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[JOB_STAGES:47]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[JOBS:26]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[JOB PERSONNEL:48]))
			$_bo_StatsAvailable:=True:C214
		: ($_l_DIsplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_StatsAvailable:=True:C214
		Else 
			$_bo_StatsAvailable:=False:C215
	End case 
	$0:=$_bo_StatsAvailable
End if 
ERR_MethodTrackerReturn("DB_TableAreStatsAvailable"; $_t_oldMethodName)