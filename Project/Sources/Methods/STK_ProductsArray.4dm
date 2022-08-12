//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ProductsArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: STK_ProductsArray
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(STK_ar_FreeStock;0)
	//ARRAY REAL(STK_ar_NeedOrderStock;0)
	//ARRAY REAL(STK_ar_OnOrderStock;0)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	ARRAY TEXT:C222($_at_POMovementTypes; 0)
	//ARRAY TEXT(STK_at_CopyFromTypes;0)
	C_BOOLEAN:C305(STK_bo_FuntionsLoaded)
	C_LONGINT:C283($_l_DataType; $_l_Index; $_l_ProductID; $_l_SizeOfArray)
	C_POINTER:C301($1)
	C_REAL:C285($_r_POPreAllocations; $_r_Sum; STK_R_FreeStock; STK_R_OnOrderAllocatedStock; STK_R_OnOrderFree; STK_R_OnOrderFreeStock; STK_R_OnOrderStock; STK_R_PreAllocated)
	C_TEXT:C284($_t_AllocationStockType; $_t_oldMethodName; $_t_POStockType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ProductsArray")
//This method will load an array of current stock quantities to arrays. based on an array of product codes passed in $1
//C_POINTER($2)  `pointer to location code or array of location codes. Note that this will treat this as loadiing date WITHIN that location(so at sublocations)
If (Count parameters:C259>=1)
	If (Not:C34(STK_bo_FuntionsLoaded))
		STK_LoadStockFunctions
		STK_bo_FuntionsLoaded:=True:C214
	End if 
	ARRAY TEXT:C222(STK_at_CopyFromTypes; 0)
	STK_GetFreeStockMovementtypes(->STK_at_CopyFromTypes)
	$_t_AllocationStockType:=STK_GetMovementTypes("Use For Allocation"; False:C215; ""; False:C215)
	$_t_POStockType:=STK_GetMovementTypes("Use for Purchases"; False:C215; ""; False:C215)
	ARRAY REAL:C219(STK_ar_FreeStock; 0)
	ARRAY REAL:C219(STK_ar_OnOrderStock; 0)  //This will only show the unallocated quantities of on order stock
	ARRAY REAL:C219(STK_ar_NeedOrderStock; 0)
	$_l_DataType:=Type:C295($1->)
	Case of 
		: ($_l_DataType=Is string var:K8:2) | ($_l_DataType=Is alpha field:K8:1)
			STK_R_FreeStock:=0
			STK_R_OnOrderStock:=0
			STK_R_OnOrderFreeStock:=0
			STK_R_OnOrderAllocatedStock:=0
			If ([PRODUCTS:9]Product_Code:1#$1->)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1->)
			End if 
			If ([PRODUCTS:9]Maintain_Stock:14)
				$_l_ProductID:=[PRODUCTS:9]X_ID:43
				CREATE EMPTY SET:C140([Stock_Thread:143]; "$AllocatableStock")
				CREATE EMPTY SET:C140([Stock_Thread:143]; "$AllocatedStock")
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Usage:26=$_t_AllocationStockType)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
				
				
				STK_GetActiveThreads([PRODUCTS:9]X_ID:43; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; ""; ->STK_at_CopyFromTypes)
				
				If (Records in selection:C76([Stock_Thread:143])>0)
					CREATE SET:C116([Stock_Thread:143]; "$AllocatableStock")
				End if 
				USE SET:C118("$AllocatableStock")
				//Need to get the ALLOCATED stock because we need to be able to know those allocated against POs
				STK_R_FreeStock:=Sum:C1([Stock_Thread:143]Quantity:13)
				//STK_GetActiveThreads ([PRODUCTS]X_ID;"";$_t_AllocationStockType;"";"";"ANY";0;0;"";0;0;"")
				
				CREATE SET:C116([Stock_Thread:143]; "$AllocatedStock")
				
				USE SET:C118("$AllocatedStock")
				//QUERY SELECTION([Stock_Thread];[STOCK_THREAD]CopiedFromThreadItemNumber=0;*)
				//QUERY SELECTION([Stock_Thread]; & ;[STOCK_THREAD]xPurchaseOrderItemID#0)
				$_r_POPreAllocations:=Sum:C1([Stock_Thread:143]Quantity:13)
				STK_R_PreAllocated:=$_r_POPreAllocations
				//These are  pre-allocations against POs
				//we can also have pre-allocations with no PO
				//what we do no need to take care of in the next bit is that we should filter the POs to only pos being delivered to locations this user can sell frorm. which mean that we should filter the allocated selection too
				//QUERY([MOVEMENT TYPES];[MOVEMENT TYPES]Usage=$_t_POStockType)
				//SELECTION TO ARRAY([MOVEMENT TYPES]Type Code;$_at_POMovementTypes)
				CREATE EMPTY SET:C140([Stock_Thread:143]; "$POStock")
				//STK_GetActiveThreads ([PRODUCTS]X_ID;"";$_t_POStockType;"";"";"ANY";0;0;"";0;0;"")
				
				//USE SET("$POStock")
				$_r_Sum:=Sum:C1([Stock_Thread:143]Quantity:13)
				STK_R_OnOrderStock:=$_r_Sum
				STK_R_OnOrderFree:=$_r_Sum-$_r_POPreAllocations
				
			End if 
			
			
		Else 
			$_l_SizeOfArray:=Size of array:C274($1->)
			ARRAY REAL:C219(STK_ar_FreeStock; $_l_SizeOfArray)
			ARRAY REAL:C219(STK_ar_OnOrderStock; $_l_SizeOfArray)
			For ($_l_Index; 1; Size of array:C274($1->))
				If ([PRODUCTS:9]Product_Code:1#$1->{$_l_Index})
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1->{$_l_Index})
				End if 
				If ([PRODUCTS:9]Maintain_Stock:14)
					$_l_ProductID:=[PRODUCTS:9]X_ID:43
					CREATE EMPTY SET:C140([Stock_Thread:143]; "$AllocatableStock")
					CREATE EMPTY SET:C140([Stock_Thread:143]; "$AllocatedStock")
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Usage:26=$_t_AllocationStockType)
					
					STK_GetActiveThreads([PRODUCTS:9]X_ID:43; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; ""; ""; ->STK_at_CopyFromTypes)
					
					If (Records in selection:C76([Stock_Thread:143])>0)
						CREATE SET:C116([Stock_Thread:143]; "$AllocatableStock")
					End if 
					
					USE SET:C118("$AllocatableStock")  //Need to get the ALLOCATED stock because we need to be able to know those allocated against POs
					STK_ar_FreeStock{$_l_Index}:=Sum:C1([Stock_Thread:143]Quantity:13)
					//STK_GetActiveThreads ([PRODUCTS]X_ID;"";$_t_AllocationStockType;"";"";"ANY";0;0;"";0;0;"")
					//QUERY SELECTION([Stock_Thread];[STOCK_THREAD]CopiedFromThreadItemNumber=0;*)
					//QUERY SELECTION([Stock_Thread]; & ;[STOCK_THREAD]xPurchaseOrderItemID#0)
					$_r_POPreAllocations:=Sum:C1([Stock_Thread:143]Quantity:13)
					//These are  pre-allocations against POs
					
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Usage:26=$_t_POStockType)
					SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_POMovementTypes)
					CREATE EMPTY SET:C140([Stock_Thread:143]; "$POStock")
					//STK_GetActiveThreads ([PRODUCTS]X_ID;"";$_t_POStockType;"";"";"ANY";0;0;"";0;0;"")
					$_r_Sum:=Sum:C1([Stock_Thread:143]Quantity:13)
					STK_ar_OnOrderStock{$_l_Index}:=$_r_Sum-$_r_POPreAllocations
				End if 
			End for 
	End case 
	
End if 
ERR_MethodTrackerReturn("STK_ProductsArray"; $_t_oldMethodName)
