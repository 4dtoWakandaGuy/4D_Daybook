//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd StockP
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
	C_BOOLEAN:C305($_bo_Edits; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_REAL:C285($_r_CostPrice; vQuantity)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; Vnumber; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd StockP")
//  START TRANSACTION
StartTransaction

READ WRITE:C146([STOCK_MOVEMENTS:40])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
READ WRITE:C146([STOCK_LEVELS:58])
READ WRITE:C146([CURRENT_STOCK:62])
$_r_CostPrice:=0
OK:=1
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Purch_Ord_Type:11=True:C214)
If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
	Gen_Alert("Please create a Stock Movement Type suitable for Purchase Orders before using th"+"is function"; "Cancel")
	OK:=0
Else 
	//Create a Movement
	FIRST RECORD:C50([ORDER_ITEMS:25])
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
	CREATE RECORD:C68([STOCK_MOVEMENTS:40])
	Movement_Code
	
	
	[STOCK_MOVEMENTS:40]Company_From:2:=[ORDER_ITEMS:25]Supplier_Code:20
	[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
	If ((Records in selection:C76([MOVEMENT_TYPES:60])>0) & ([MOVEMENT_TYPES:60]Stock_Plus:3#""))
		[STOCK_MOVEMENTS:40]MovementSourceReference:18:=Vnumber
		[STOCK_MOVEMENTS:40]Type_Number:4:=MoveTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
		
		// [STOCK MOVEMENTS]Type No:=String(MoveTypes_No )
		[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
		[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
		
		//Add the Stock Items
		While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
			vQuantity:=Round:C94(([ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28); 2)
			If (vQuantity>0)
				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
				[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
				[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
				[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=[ORDER_ITEMS:25]Item_Number:27
				[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=[ORDERS:24]Company_Code:1
				[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=[ORDER_ITEMS:25]Order_Code:1
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=vQuantity
				$_bo_Edits:=STK_SetHeaderInfo
				[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[ORDER_ITEMS:25]Cost_Price:5
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*vQuantity); 2)
				$_r_CostPrice:=$_r_CostPrice+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
				
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End while 
		[STOCK_MOVEMENTS:40]Total_Cost:8:=$_r_CostPrice
		DB_SaveRecord(->[STOCK_MOVEMENTS:40])
		
		If (OK=1)
			Gen_Confirm("Do you want to view the Stock Movement before posting?"; "View"; "Post now")
			If (OK=1)
				FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_In13")  //NG April 2004 Removed ◊Screen
				WIN_t_CurrentInputForm:="Movements_In13"
				Open_Pro_Window("Purchase Order Stock Movement"; 0; 2; ->[STOCK_MOVEMENTS:40]; WIN_t_CurrentInputForm)
				
				MODIFY RECORD:C57([STOCK_MOVEMENTS:40]; *)
				Close_ProWin(Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+WIN_t_CurrentInputForm)
			Else 
				OK:=1
			End if 
			If (OK=1)
				RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
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
		Gen_Alert("The Posting has been Cancelled"; "")
		OK:=0
	End if 
End if 

Transact_End  // 13/05/02 pb
READ ONLY:C145([STOCK_MOVEMENTS:40])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
READ ONLY:C145([STOCK_LEVELS:58])
READ ONLY:C145([CURRENT_STOCK:62])
UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
UNLOAD RECORD:C212([STOCK_LEVELS:58])
UNLOAD RECORD:C212([CURRENT_STOCK:62])
UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
ERR_MethodTrackerReturn("PurchOrd StockP"; $_t_oldMethodName)
