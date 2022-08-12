//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_l_AutoSearchbyID
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
	C_DATE:C307(VdateF; VdateT)
	C_LONGINT:C283($_l_TableNumber; $1; $4; Va; VC; vCalls; vContr; vD; vIn; vJ; vO)
	C_LONGINT:C283(vOrd; VORDI; VP; vPu; Vst; vTr)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; VProdCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_l_AutoSearchbyID")

//$1=The Mode -1 to build  to run and 2 to edit-note that we could be editing but adding a new sub search!
//if we are editing or building $3 is a pointer to an array in which to put the built list of search IDs
//$2=Pointer to array of searches to execute
//$3(optional) pointer to variable in which to place the next search number in $4(used when cross file searching)
//when build a search $3 is a pointer to an array in which we are putting the
//$4(optional)-table to search if building and creating a new one
If (Count parameters:C259>=2)
	$_l_TableNumber:=0
	If (Size of array:C274($2->)>=1)
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$2->{Size of array:C274($2->)})
	Else 
		If (Count parameters:C259>=4)
			$_l_TableNumber:=$4
		Else 
			$_l_TableNumber:=0
		End if 
		
	End if 
	
	Case of 
			
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ACCOUNT_BALANCES:34])) | ($_l_TableNumber=Table:C252(->[ACCOUNT_BALANCES:34]))
			If (Count parameters:C259<3)
				ACC_BalSelect($1; $2)
			Else 
				ACC_BalSelect($1; $2; $3)
			End if 
			
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SERVICE_CALLS:20])) | ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			vCalls:=1
			If (Count parameters:C259<3)
				Calls_SelP($1; $2)
			Else 
				Calls_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2])) | ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			
			
			VC:=1
			If (Count parameters:C259<3)
				Comp_SelP($1; $2)
			Else 
				Comp_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1])) | ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			vO:=1
			If (Count parameters:C259<3)
				Cont_SelP($1; $2)
			Else 
				Cont_SelP($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTRACTS:17])) | ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
			
			
			//Not contracts on this DB so not tested yet
			vContr:=1
			If (Count parameters:C259<3)
				Contracts_SelP($1; $2)
			Else 
				Contracts_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CURRENT_STOCK:62])) | ($_l_TableNumber=Table:C252(->[CURRENT_STOCK:62]))
			//Not stock on this DB so not tested yet
			vPu:=1
			If (Count parameters:C259<3)
				StockCurr_SelP($1; $2)
			Else 
				StockCurr_SelP($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12])) | ($_l_TableNumber=Table:C252(->[DIARY:12]))
			
			
			vD:=1
			If (Count parameters:C259<3)
				Diary_SelP(False:C215; $1; $2)
			Else 
				Diary_SelP(False:C215; $1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INVOICES:39])) | ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			
			vIn:=1
			If (Count parameters:C259<3)
				Invoices_SelP($1; $2)
			Else 
				Invoices_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOBS:26])) | ($_l_TableNumber=Table:C252(->[JOBS:26]))
			
			
			vJ:=1
			If (Count parameters:C259<3)
				Jobs_SelP($1; $2)
			Else 
				Jobs_SelP($1; $2; $3)
			End if 
			
			
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOB PERSONNEL:48])) | ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
			vj:=1
			If (Count parameters:C259<3)
				JobPers_SelP($1; $2)
			Else 
				JobPers_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOB_STAGES:47])) | ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
			vJ:=1
			If (Count parameters:C259<3)
				JobStages_SelP($1; $2)
			Else 
				JobStages_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENTS:40])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			vPu:=1
			If (Count parameters:C259<3)
				Movements_SelP($1; $2)
			Else 
				Movements_SelP($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25])) | ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			
			VORDI:=1
			If (Count parameters:C259<3)
				OrderI_SelP($1; $2)
			Else 
				OrderI_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDERS:24])) | ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			
			
			vOrd:=1
			If (Count parameters:C259<3)
				Orders_SelP($1; $2)
			Else 
				Orders_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9])) | ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			
			VP:=1
			If (Count parameters:C259<3)
				Prod_SelP($1; $2)
			Else 
				Prod_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PROJECTS:89])) | ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
			
			Va:=1
			If (Count parameters:C259<3)
				Projects_SelP($1; $2)
			Else 
				Projects_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			vPu:=1
			If (Count parameters:C259<3)
				Purchases_SelP($1; $2)
			Else 
				Purchases_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PURCHASE_INVOICES:37])) | ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			
			vPu:=1
			If (Count parameters:C259<3)
				PurchOrd_SelP($1; $2)
			Else 
				PurchOrd_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55])) | ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
			
			//has to be passed in $2»
			$_l_TableNumber:=2
			If (Count parameters:C259<3)
				//QV_AdvancedSearch ($_l_TableNumber;True;$1;$2)
			Else 
				//QV_AdvancedSearch ($_l_TableNumber;True;$1;$2;$3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			Vst:=1
			If (Count parameters:C259<3)
				Stock_SelP($1; $2)
			Else 
				Stock_SelP($1; $2; $3)
			End if 
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			
			vPu:=1
			If (Count parameters:C259<3)
				StockCurr_SelP($1; $2)
			Else 
				StockCurr_SelP($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_LEVELS:58])) | ($_l_TableNumber=Table:C252(->[STOCK_LEVELS:58]))
			
			vPu:=1
			If (Count parameters:C259<3)
				StockLev_SelP($1; $2)
			Else 
				StockLev_SelP($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SUBSCRIPTIONS:93])) | ($_l_TableNumber=Table:C252(->[SUBSCRIPTIONS:93]))
			
			vCalls:=1
			If (Count parameters:C259<3)
				Subscript_SelP($1; $2)
			Else 
				Subscript_SelP($1; $2; $3)
			End if 
			RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS")
			If (VProdCode#"")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=VProdCode+"@")
			End if 
			If (VdateF>!00-00-00!)
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supply_by_Date:31<=VdateF)
			End if 
			If (VdateT>!00-00-00!)
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supply_by_Date:31<=VdateT)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[TRANSACTIONS:29])) | ($_l_TableNumber=Table:C252(->[TRANSACTIONS:29]))
			
			vTr:=1
			If (Count parameters:C259<3)
				Trans_Sel($1; $2)
			Else 
				Trans_Sel($1; $2; $3)
			End if 
			
		: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[TRANSACTION_BATCHES:30])) | ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			
			vTr:=1
			If (Count parameters:C259<3)
				TransB_SelP($1; $2)
			Else 
				TransB_SelP($1; $2; $3)
			End if 
			
			
	End case 
End if 
ERR_MethodTrackerReturn("SM_l_AutoSearchbyID"; $_t_oldMethodName)
