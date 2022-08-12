//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_CreateAutoSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/07/2011 12:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_QueryIDreturns;0)
	//ARRAY LONGINT(SM_al_QueryIDs;0)
	C_LONGINT:C283($_l_Mode; $_l_TableNumber; $1; $2; Va; VC; vCalls; vContr; vD; vIn; vJ)
	C_LONGINT:C283(vO; vOrd; VORDI; VP; vPu; Vst; vTr)
	C_TEXT:C284($_t_CurentFormUsage; $_t_oldMethodName; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_CreateAutoSearch")

//$_l_Mode=Table number to build a search for
$_l_Mode:=-1
$_l_TableNumber:=0

ARRAY LONGINT:C221(SM_al_QueryIDreturns; 0)
ARRAY LONGINT:C221(SM_al_QueryIDs; 0)
If (Count parameters:C259>=1)
	Case of 
			
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			ACC_BalSelect($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			vCalls:=1
			Calls_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
		: ($1=Table:C252(->[COMPANIES:2]))
			VC:=1
			Comp_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
		: ($1=Table:C252(->[CONTACTS:1]))
			vO:=1
			Cont_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
		: ($1=Table:C252(->[CONTRACTS:17]))
			//Not contracts on this DB so not tested yet
			vContr:=1
			Contracts_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			//Not stock on this DB so not tested yet
			vPu:=1
			StockCurr_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[DIARY:12])) | ($_l_TableNumber=Table:C252(->[DIARY:12]))
			
			
			vD:=1
			
			Diary_SelP(False:C215; $_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
			
		: ($1=Table:C252(->[INVOICES:39])) | ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			
			vIn:=1
			
			Invoices_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[JOBS:26])) | ($_l_TableNumber=Table:C252(->[JOBS:26]))
			
			
			vJ:=1
			
			Jobs_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
			
			
			
		: ($1=Table:C252(->[JOB PERSONNEL:48])) | ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
			vj:=1
			
			JobPers_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[JOB_STAGES:47])) | ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
			vJ:=1
			
			JobStages_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			vPu:=1
			
			Movements_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
			
		: ($1=Table:C252(->[ORDER_ITEMS:25])) | ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			
			VORDI:=1
			If (Count parameters:C259>=3)
				Case of 
					: ($2=Table:C252(->[SUBSCRIPTIONS:93]))
						$_t_CurentFormUsage:=DB_t_CurrentFormUsage
						Case of 
							: ($3="Subscription Billing")
								DB_t_CurrentFormUsage:="Subs Inv"
							: ($3="Subscriptions Deliver")
								DB_t_CurrentFormUsage:="Subs Del"
							: ($3="Subscription Renewals")
								DB_t_CurrentFormUsage:="Subs Mail"
								
						End case 
						vCalls:=1
						Subscript_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
						
						vCalls:=0
					Else 
						OrderI_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
						
				End case 
				
			Else 
				
				OrderI_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			End if 
			
		: ($1=Table:C252(->[ORDERS:24])) | ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			
			
			vOrd:=1
			
			Orders_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[PRODUCTS:9])) | ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			
			VP:=1
			
			Prod_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[PROJECTS:89])) | ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
			
			Va:=1
			
			Projects_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			vPu:=1
			
			Purchases_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			vPu:=1
			
			PurchOrd_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[INFORMATION:55])) | ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
			
			//has to be passed in »SM_al_QueryIDs»
			$_l_TableNumber:=2
			If (Count parameters:C259<3)
				//QV_AdvancedSearch ($_l_TableNumber;True;$_l_Mode;»SM_al_QueryIDs)
			Else 
				//QV_AdvancedSearch ($_l_TableNumber;True;$_l_Mode;»SM_al_QueryIDs;$3)
			End if 
			
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			Vst:=1
			
			Stock_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			vPu:=1
			
			StockCurr_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[STOCK_LEVELS:58])) | ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
			
			vPu:=1
			
			StockLev_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
		: ($1=Table:C252(->[TRANSACTIONS:29])) | ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
			
			vTr:=1
			
			Trans_Sel($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
			
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30])) | ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			
			vTr:=1
			
			TransB_SelP($_l_Mode; ->SM_al_QueryIDs; ->SM_al_QueryIDreturns)
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("SM_CreateAutoSearch"; $_t_oldMethodName)
