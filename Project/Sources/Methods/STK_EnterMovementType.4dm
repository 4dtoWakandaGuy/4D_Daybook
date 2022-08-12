//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EnterMovementType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	C_BOOLEAN:C305($_bo_IncludeOtherStock; STK_bo_AutoFill)
	C_LONGINT:C283(WS_ProcMainWIndow)
	C_TEXT:C284($_t_oldMethodName; $_t_Supplier; $1; $2; $3; $4; STK_t_AddMovementType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_EnterMovementType")


//This is is just an alternative way of calling 'enter stock movment
//in parameter 1 we are passing a stock movement type
//in paramter 2 we pass a movement the stock is being 'copied from'
//and in parameter 3 we pass a seleciton reference for the items
If (Count parameters:C259>=3)
	//DelayTicks (60*10)  `Make sure the caling window has had time to close -because its in a trancsation
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	
	STK_t_AddMovementType:=$1
	If ($2#"")
		Case of 
			: ($3="All Remaining Items")
				If (Count parameters:C259>=3)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$2; *)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
				Else 
					//should never be here
					REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
				End if 
			: ($3="No Items selection")
				REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
			Else 
				If (Count parameters:C259>=4)
					USE SET:C118($4)
					CLEAR SET:C117($4)
					
				Else 
					If (Count parameters:C259>=3)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$2)
						$_t_Supplier:=[STOCK_MOVEMENTS:40]Company_From:2
						If ($3#"")
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#$2; *)
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=$3)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							End if 
						Else 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#$2; *)
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
								QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
							End if 
						End if 
						$_bo_IncludeOtherStock:=False:C215
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
							
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$t1")
							DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
							QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
							QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Company_From:2=$_t_Supplier)
							If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
								SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
								CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$T2")
								INTERSECTION:C121("$t1"; "$T2"; "$t1")
								USE SET:C118("$t1")
								If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
									If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43#"")
										Gen_Confirm("Include stock from other movements with the same reference?"; "Yes"; "No")
										If (OK=1)
											$_bo_IncludeOtherStock:=True:C214
										End if 
									End if 
								End if 
							End if 
						End if 
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$2; *)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=$3)
						If ($_bo_IncludeOtherStock)
							CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$t2")
							UNION:C120("$t2"; "$t1"; "$t1")
							USE SET:C118("$t1")
							
						End if 
					Else 
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$2)
					End if 
				End if 
		End case 
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
		End if 
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "StkAutoCopyFrom")
		Else 
			CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "StkAutoCopyFrom")
		End if 
		
	Else 
		CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "StkAutoCopyFrom")
		
	End if 
	STK_bo_AutoFill:=True:C214
	ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
	
	Movements_In
End if 
ERR_MethodTrackerReturn("STK_EnterMovementType"; $_t_oldMethodName)
