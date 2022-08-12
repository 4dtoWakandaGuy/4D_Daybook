//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_CrossFileSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MenuItem; $_l_OK; $1; $2)
	C_POINTER:C301($3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_CrossFileSearch")
$_l_MenuItem:=0
If (Size of array:C274($3->)>0)
	QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$3->{Size of array:C274($3->)})
	If ([x_QUERY_PARAMETERS:134]X_ContextID:3#$2)
		Case of 
				
			: ($2=Table:C252(->[TRANSACTIONS:29]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INVOICES:39]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ACCOUNTS:32]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PERIODS:33]))
						$_l_MenuItem:=4
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Trans_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
			: ($2=Table:C252(->[STOCK_LEVELS:58]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=1
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=StockLev_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
			: ($2=Table:C252(->[CURRENT_STOCK:62]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=1
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=StockCurr_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
				
			: ($2=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENTS:40]))
						$_l_MenuItem:=2
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Stock_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[PURCHASE_INVOICES:37]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Purchases_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[PROJECTS:89]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=2
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Projects_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[PRODUCTS:9]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						$_l_MenuItem:=5
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_LEVELS:58]))
						$_l_MenuItem:=6
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Prod_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[ORDERS:24]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25]))
						$_l_MenuItem:=5
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SUBSCRIPTIONS:93]))
						$_l_MenuItem:=7
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Orders_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[ORDER_ITEMS:25]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDERS:24]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INVOICES:39]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PURCHASE_ORDERS:57]))
						$_l_MenuItem:=5
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SUBSCRIPTIONS:93]))
						$_l_MenuItem:=7
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=OrderI_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[STOCK_MOVEMENTS:40]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						$_l_MenuItem:=2
						
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Movements_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[JOBS:26]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PROJECTS:89]))
						$_l_MenuItem:=3
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Jobs_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[INVOICES:39]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=2
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Invoices_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[DIARY:12]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDERS:24]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOBS:26]))
						$_l_MenuItem:=5
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Diary_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[CONTRACTS:17]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=3
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Contracts_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[CONTACTS:1]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDERS:24]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25]))
						$_l_MenuItem:=5
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INVOICES:39]))
						$_l_MenuItem:=6
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTRACTS:17]))
						$_l_MenuItem:=7
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SERVICE_CALLS:20]))
						$_l_MenuItem:=8
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOBS:26]))
						$_l_MenuItem:=9
						
						
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Cont_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
			: ($2=Table:C252(->[SERVICE_CALLS:20]))
				
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[COMPANIES:2]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12]))
						$_l_MenuItem:=4
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25]))
						$_l_MenuItem:=5
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Calls_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
				
			: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ACCOUNTS:32]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PERIODS:33]))
						$_l_MenuItem:=2
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=ACC_BalSelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
				
				
			: ($2=Table:C252(->[COMPANIES:2]))
				Case of 
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTACTS:1]))
						$_l_MenuItem:=1
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INFORMATION:55]))
						$_l_MenuItem:=2
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[DIARY:12]))
						$_l_MenuItem:=3
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PRODUCTS:9]))
						$_l_MenuItem:=4
						
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDERS:24]))
						$_l_MenuItem:=5
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[ORDER_ITEMS:25]))
						$_l_MenuItem:=6
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PURCHASE_ORDERS:57]))
						$_l_MenuItem:=7
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[INVOICES:39]))
						$_l_MenuItem:=8
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[PURCHASE_INVOICES:37]))
						$_l_MenuItem:=9
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[TRANSACTIONS:29]))
						$_l_MenuItem:=10
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[CONTRACTS:17]))
						$_l_MenuItem:=11
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[SERVICE_CALLS:20]))
						$_l_MenuItem:=12
					: ([x_QUERY_PARAMETERS:134]X_ContextID:3=Table:C252(->[JOBS:26]))
						$_l_MenuItem:=13
						
				End case 
				If ($_l_MenuItem>0)
					$_l_OK:=Comp_SelLP($_l_MenuItem; $1; $2; $3; $4)
				End if 
				
		End case 
		
		
		
		
	Else 
		$4->:=1
	End if 
Else 
	$4->:=0
End if 
ERR_MethodTrackerReturn("SM_CrossFileSearch"; $_t_oldMethodName)
