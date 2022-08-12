//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJUNK_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/10/2011 09:05 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(mAddToCSID)
	//C_UNKNOWN(maddToType)
	//C_UNKNOWN(MaItemNumber)
	//C_UNKNOWN(MaitemNumbers)
	//C_UNKNOWN(mAnal)
	//C_UNKNOWN(MAOrderotemCode)
	//C_UNKNOWN(mCalledOff)
	//C_UNKNOWN(mCurrency)
	//C_UNKNOWN(mIDStounallocate)
	//C_UNKNOWN(mitemNumber)
	//C_UNKNOWN(mItemNumbers)
	//C_UNKNOWN(mLayer)
	//C_UNKNOWN(mLocation)
	//C_UNKNOWN(moEdits)
	//C_UNKNOWN(mOrderCode)
	//C_UNKNOWN(MOrderCodes)
	//C_UNKNOWN(mOrderStatus)
	//C_UNKNOWN(mSearchAfterDate)
	//C_UNKNOWN(MSearchBeforeDate)
	//C_UNKNOWN(mSOItemNumbers)
	//C_UNKNOWN(mSOItemsQUantity)
	//C_UNKNOWN(mSTOCKITEMSHEADERDATEWAS)
	//C_UNKNOWN(mSum)
	//C_UNKNOWN(mToUNallocateFree)
	//C_UNKNOWN(munallocate)
	//ARRAY LONGINT(MaSetCalledOff;0)
	//ARRAY TEXT(ORD_at_OrderCodes;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_REAL:C285(mi; mi2)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAJUNK_2")

ALL RECORDS:C47([INVOICES:39])
QUERY:C277([INVOICES:39]; [INVOICES:39]Period_Code:13="2012@")

DIALOG:C40("TEST_SVG")

If (False:C215)
	
	ERR_MethodTrackerReturn("AAJUNK_2"; $_t_oldMethodName)
	//TRACE
	If (False:C215)
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO"; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
		//here you could put in a date
		//query selection([STOCK_MOVEMENT_ITEMS];[STOCK_MOVEMENT_ITEMS]x_Header_Date<(Current date-180))
		
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ToUnallocate")
		
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Order_Code:3; MOrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; MOrderCodes)
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15="02450")
		SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; MOrderCodes)
		USE SET:C118("ToUnallocate")
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Order_Code:3; MOrderCodes)
		//ok so there are the stock movement items we want to get unallocated
		ALERT:C41(String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))+" to un-allocate")
		APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0)
	End if 
	mOrderStatus:=""
	Gen_Confirm("Check only Completed Orders, or Completed and Confirmed Orders?"; "Completed"; "Both")
	If (OK=1)
		mOrderStatus:="Completed"
	Else 
		mOrderStatus:="Both"
	End if 
	
	MSearchBeforeDate:=Current date:C33-60
	mSearchAfterDate:=Current date:C33-500
	mSearchAfterDate:=Date:C102(Gen_Request("Enter Date to Check Orders From"; String:C10(mSearchAfterDate)))
	
	//Link OSC
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=""; *)
	QUERY:C277([STOCK_MOVEMENTS:40];  | ; [STOCK_MOVEMENTS:40]Layer_Code:11="")
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
		
		
		For (mi2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			Case of 
				: ([STOCK_MOVEMENT_ITEMS:27]Order_Code:3#"")
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
					If ([ORDERS:24]Currency_Code:32#"") & ([STOCK_MOVEMENTS:40]Currency_Code:10="")
						[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
					End if 
					If ([ORDERS:24]Layer_Code:47#"") & ([STOCK_MOVEMENTS:40]Layer_Code:11="")
						[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
					End if 
				: ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#"")
					QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
					If ([PURCHASE_ORDERS:57]Currency_Code:16#"") & ([STOCK_MOVEMENTS:40]Currency_Code:10="")
						[STOCK_MOVEMENTS:40]Currency_Code:10:=[PURCHASE_ORDERS:57]Currency_Code:16
					End if 
					If ([PURCHASE_ORDERS:57]Layer_Code:17#"") & ([STOCK_MOVEMENTS:40]Layer_Code:11="")
						[STOCK_MOVEMENTS:40]Layer_Code:11:=[PURCHASE_ORDERS:57]Layer_Code:17
					End if 
					If (([STOCK_MOVEMENTS:40]Layer_Code:11#"") & ([STOCK_MOVEMENTS:40]Currency_Code:10#""))
						Mi2:=99999
					End if 
			End case 
			
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		<>SYS_t_LastSavedTableName:="STOCK_MOVEMENTS"
		SAVE RECORD:C53([STOCK_MOVEMENTS:40])
		FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
		For (mi2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
			<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
			SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End for 
		NEXT RECORD:C51([STOCK_MOVEMENTS:40])
		
	End for 
	
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="OSC"; *)
	//QUERY([STOCK_MOVEMENT_ITEMS];&;[STOCK_MOVEMENT_ITEMS]Date_Shipped>mSearchAfterDate;*)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38="False"; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
	
	mi:=1
	If (False:C215)
		If (1=2)
			For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				MESSAGE:C88("Checking 1: "+String:C10(mi)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])))
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
		End if 
	End if 
	If (mOrderStatus="Both")
		mSearchBeforeDate:=Date:C102(Gen_Request("Enter Date to Check Orders To"; String:C10(mSearchBeforeDate)))
		QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="02440"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02450"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02460"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02470"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02472"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02473")
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Date:4<=mSearchBeforeDate; *)
		QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]Order_Date:4>=mSearchAfterDate)
		ALERT:C41("found "+String:C10(Records in selection:C76([ORDERS:24]))+" Orders to check from "+String:C10(mSearchAfterDate)+" to "+String:C10(mSearchBeforeDate))
	Else 
		QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="02450"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02460"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02470"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02472"; *)
		QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02473")
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Date:4>=mSearchAfterDate)
		ALERT:C41("found "+String:C10(Records in selection:C76([ORDERS:24]))+" Completed Orders to check from "+String:C10(mSearchAfterDate))
	End if 
	
	ALERT:C41("Initial Selection Found "+String:C10(Records in selection:C76([ORDERS:24]))+" Orders")
	//QUERY([ORDERS];[ORDERS]Order_Code="57943")
	//TRACE
	SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; ORD_at_OrderCodes)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; ORD_at_OrderCodes)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Quantity:3>0; *)
	QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Allocated:28#0)
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1; >; [ORDER_ITEMS:25]Product_Code:2; >)
	COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "OrderItemSel")
	USE NAMED SELECTION:C332("OrderItemSel")
	
	ALERT:C41("Found "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" Order items")
	
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	
	//Find the Stock Movement Items with the Order Items Numbers that are Allocated as O or P stock
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; MaItemNumber)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaItemNumber)
	
	
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "StockItemSel")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="OSC"; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
	mi:=1
	
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		MESSAGE:C88("Checking 2: "+String:C10(mi)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])))
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	
	USE NAMED SELECTION:C332("StockItemSel")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	mi:=1
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; mItemNumbers)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; mItemNumbers)
	
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; mSOItemNumbers; [ORDER_ITEMS:25]Quantity:3; mSOItemsQUantity)
	CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "ToUNA")
	For (mi; 1; Size of array:C274(mSOItemNumbers))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=mSOItemNumbers{mi}; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
		mSum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		If (Msum>mSOItemsQUantity{Mi})
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "Temp")
			UNION:C120("ToUNA"; "Temp"; "ToUna")
		End if 
	End for 
	
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25; mItemNumbers)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; mItemNumbers)
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=0
		<>SYS_t_LastSavedTableName:="STOCK_MOVEMENT_ITEMS"
		SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	USE NAMED SELECTION:C332("StockItemSel")
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; mItemNumbers)
	CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "Temp")
	UNION:C120("ToUNA"; "Temp"; "ToUna")
	USE SET:C118("ToUna")
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ToOSC")
	
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		
		USE NAMED SELECTION:C332("ToOSC")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; mi)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
		CREATE RECORD:C68([STOCK_MOVEMENTS:40])
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1="UNA")
		Movement_Code
		[STOCK_MOVEMENTS:40]Company_From:2:=[ORDERS:24]Company_Code:1
		[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
		[STOCK_MOVEMENTS:40]Type_Number:4:=MovementTypes_No(6; [MOVEMENT_TYPES:60]Type_Code:1; [STOCK_MOVEMENTS:40]Movement_Type:6)
		
		[STOCK_MOVEMENTS:40]Posted_Date:7:=<>DB_d_CurrentDate
		[STOCK_MOVEMENTS:40]Movement_Date:5:=<>DB_d_CurrentDate
		[STOCK_MOVEMENTS:40]Analysis_Code:9:=[ORDERS:24]Analysis_Code:33
		[STOCK_MOVEMENTS:40]Currency_Code:10:=[ORDERS:24]Currency_Code:32
		[STOCK_MOVEMENTS:40]Layer_Code:11:=[ORDERS:24]Layer_Code:47
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="ALO")
		mToUNallocateFree:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; mIDStounallocate)
		ARRAY LONGINT:C221(MaSetCalledOff; 0)
		
		If (Size of array:C274(mIDStounallocate)>0)
			For (munallocate; 1; Size of array:C274(mIDStounallocate))
				If (mToUNallocateFree>0)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=mIDStounallocate{munallocate})
					STK_ItemDuplicate
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
					mCalledOff:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					maddToType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					mAddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					mCurrency:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					mAnal:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					mLayer:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					mLocation:=[STOCK_MOVEMENT_ITEMS:27]Location:7
					mitemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
					mOrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					//[STOCK_MOVEMENT_ITEMS]X_CopiedFromID:=[STOCK_MOVEMENT_ITEMS]x_ID
					[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[ORDER_ITEMS:25]Item_Number:27
					[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""  //[ORDERS]Company Code
					[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""  // [ORDER ITEMS]Order Code
					
					
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>=mToUNallocateFree)
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=mToUNallocateFree
					Else 
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
					End if 
					//TRACE
					mToUNallocateFree:=mToUNallocateFree-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=mAddToCSID
					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
					APPEND TO ARRAY:C911(MaSetCalledOff; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					mSTOCKITEMSHEADERDATEWAS:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
					End if 
					[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=mLayer
					[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=mLocation
					[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=manal
					[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=mCurrency
					[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
						If (mSTOCKITEMSHEADERDATEWAS=!00-00-00!)
							mSTOCKITEMSHEADERDATEWAS:=Current date:C33(*)
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#0)
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENTS:40]Currency_Code:10; mSTOCKITEMSHEADERDATEWAS)
						End if 
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
						[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
					End if 
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
					Else 
						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
					End if 
					//[ORDER ITEMS]Item_Locked:=False
					moEdits:=STK_SetHeaderInfo
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
					Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					
				End if 
			End for 
			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
			
		End if 
		
	End for 
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; MaSetCalledOff)
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		MESSAGE:C88("Checking 3: "+String:C10(mi)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])))
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	
	USE NAMED SELECTION:C332("StockItemSel")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	For (mi; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		MESSAGE:C88("Checking 3: "+String:C10(mi)+" of "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])))
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	
	
	USE NAMED SELECTION:C332("StockItemSel")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="OSC")
	
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	USE NAMED SELECTION:C332("StockItemSel")
	QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MaitemNumbers)
	
	ALERT:C41("Found  Allocated "+String:C10(Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))+" Stock items")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Item_Number:8; MAOrderotemCode)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; MAOrderotemCode)
	COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "OrderItemSel")
	USE NAMED SELECTION:C332("OrderItemSel")
	DBI_MenuSelectRecords("ORDER_Items")
End if 
ERR_MethodTrackerReturn("AAJUNK_2"; $_t_oldMethodName)