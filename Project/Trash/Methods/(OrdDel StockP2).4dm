//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrdDel_StockP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AddToStockTypes; 0)
	ARRAY TEXT:C222($_at_ValidMovementTypes; 0)
	C_BOOLEAN:C305(<>PersAnOver; <>StockPostAu; <>StockPostIn; $_bo_Edits; $_bo_MaintainStock; DB_bo_RecordModified; STK_bo_DeferValidation; STK_bo_inTransaction)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_REAL:C285($_r_TotalCost; vQuantity)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>Per_t_CurrentDefaultAnalCode; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdDel_StockP2")

READ WRITE:C146([STOCK_MOVEMENTS:40])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_LEVELS:58])
READ WRITE:C146([CURRENT_STOCK:62])
$_r_TotalCost:=0
OK:=1
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
	Gen_Alert("Please create a Stock Movement Type suitable for Delivery Notes before using "+"this function"; "Cancel")
	OK:=0
Else 
	OK:=1
	If (Records in selection:C76([MOVEMENT_TYPES:60])>1)
		Check_MinorFS("Movement Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
	End if 
	If (OK=1)
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		
		$_bo_MaintainStock:=False:C215
		//Create a Movement
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
		FIRST RECORD:C50([ORDER_ITEMS:25])
		//  RELATE ONE([ORDER ITEMS]Order Code)
		CREATE RECORD:C68([STOCK_MOVEMENTS:40])
		Movement_Code
		[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
		[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
		If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
			[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
			
			// [STOCK MOVEMENTS]Type No:=String(MoveTypes_No )
			//  [STOCK MOVEMENTS]Posted Date:=◊CDate ` No, cos it prevents the checking
			If (<>StockPostIn)  //(DB_t_CurrentFormUsage="ID")
				
				RELATE ONE:C42([ORDER_ITEMS:25]Invoice_Number:17)
				[STOCK_MOVEMENTS:40]Movement_Date:5:=[INVOICES:39]Invoice_Date:4
				If ([STOCK_MOVEMENTS:40]Movement_Date:5=!00-00-00!)
					[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
				End if 
			Else 
				[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
			End if 
			If ([ORDERS:24]Currency_Code:32#"")
				[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
			Else 
				[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
			End if 
			If (([ORDERS:24]Analysis_Code:33="") & (<>PersAnOver))
				[STOCK_MOVEMENTS:40]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
			Else 
				[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
			End if 
			If ([ORDERS:24]Layer_Code:47#"")
				[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
			Else 
				[STOCK_MOVEMENTS:40]Layer_Code:11:=DB_GetLedgerActualLayer
			End if 
			
			//Add the Stock Items
			While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
				If ([PRODUCTS:9]Maintain_Stock:14)
					$_bo_MaintainStock:=True:C214
					If ([ORDER_ITEMS:25]Item_Number:27=0)
						REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
					Else 
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
						SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_ValidMovementTypes; [MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AddToStockTypes)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=[ORDER_ITEMS:25]Item_Number:27; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Quantity:4>0)
						QUERY SELECTION WITH ARRAY:C1050([CURRENT_STOCK:62]Stock_Type:3; $_at_AddToStockTypes)
						
					End if 
					If (Records in selection:C76([CURRENT_STOCK:62])=0)
						If (DB_t_CurrentFormUsage2="Alloc")
							vQuantity:=[ORDER_ITEMS:25]Allocated:28
						Else 
							vQuantity:=[ORDER_ITEMS:25]Quantity:3
						End if 
						If (vQuantity>0)
							CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
							[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
							$_bo_Edits:=STK_SetHeaderInfo
							[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[ORDER_ITEMS:25]Item_Number:27
							[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
							[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=vQuantity
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[ORDER_ITEMS:25]Cost_Price:5
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
							[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=[ORDER_ITEMS:25]Serial_Number:24
							$_r_TotalCost:=$_r_TotalCost+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
							[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							
							
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
							AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					Else 
						FIRST RECORD:C50([CURRENT_STOCK:62])
						While (Not:C34(End selection:C36([CURRENT_STOCK:62])))
							RELATE ONE:C42([CURRENT_STOCK:62]Stock_Type:3)
							If ([STOCK_TYPES:59]Allocated:6)
								CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
								
								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[CURRENT_STOCK:62]Product_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[ORDER_ITEMS:25]Item_Number:27
								[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[CURRENT_STOCK:62]Quantity:4
								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[CURRENT_STOCK:62]Total_Cost:9
								[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
								[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=[CURRENT_STOCK:62]Serial_Number:2
								[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
								$_bo_Edits:=STK_SetHeaderInfo
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=[CURRENT_STOCK:62]X_ID:13
								$_r_TotalCost:=$_r_TotalCost+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							End if 
							NEXT RECORD:C51([CURRENT_STOCK:62])
						End while 
					End if 
				End if 
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
			If ($_bo_MaintainStock)
				[STOCK_MOVEMENTS:40]Total_Cost:8:=$_r_TotalCost
				STK_bo_DeferValidation:=True:C214
				STK_bo_inTransaction:=True:C214
				DB_SaveRecord(->[STOCK_MOVEMENTS:40])
			Else 
				OK:=0
			End if 
			
			If (OK=1)
				$_bo_MaintainStock:=False:C215
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
				Move_InLPACheck
				If ((DB_t_CurrentFormUsage2#"NC") & (<>StockPostAu=False:C215) & (OK=1))
					Gen_Confirm("Do you want to view the Stock Movement before posting?"; "View"; "Post now")
					If (OK=1)
						$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
						DB_t_CurrentFormUsage:="Mod"
						FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_In13")  //NG April 2004 removed reference to ◊screen
						
						Open_Pro_Window("Delivery Stock Movement"; 0; 2; ->[STOCK_MOVEMENTS:40]; "Movements_In13")
						MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
						Close_ProWin(Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+"Movements_In13")
						
						DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
						$_bo_MaintainStock:=True:C214
					Else 
						OK:=1
					End if 
				End if 
				
				If ((OK=1) & ($_bo_MaintainStock=False:C215))
					[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
					SAVE RECORD:C53([STOCK_MOVEMENTS:40])
					
					RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
					Move_InPost
				End if 
			End if 
		Else 
			OK:=0
		End if 
		If (OK=1)
			DB_bo_RecordModified:=True:C214
			DB_t_CallOnCloseorSave:="File"
		Else 
			If ($_bo_MaintainStock)
				Gen_Alert("The Posting has been Cancelled"; "")
				OK:=0
			End if 
		End if 
		//   Transact EndNF
		Transact_End  // 13/05/02 pb
		
		
	End if 
End if 
STK_bo_inTransaction:=False:C215
READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([STOCK_LEVELS:58])
READ ONLY:C145([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
UNLOAD RECORD:C212([CURRENT_STOCK:62])
ERR_MethodTrackerReturn("OrdDel_StockP2"; $_t_oldMethodName)