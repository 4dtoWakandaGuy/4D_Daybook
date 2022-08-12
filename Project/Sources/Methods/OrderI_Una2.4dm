//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_Una2
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Una2")
//Reset Current Stock & post levels
Check_LockMess(->[CURRENT_STOCK:62]; "Current Stock")
If (OK=1)
	If ([CURRENT_STOCK:62]Product_Code:1#"")
		If (Not:C34(STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)))
			
			//Move_PostLevCur (->[CURRENT STOCK]Stock Type;-1)  `reversed in 4.0.036
			Move_PostLevCur(->[CURRENT_STOCK:62]Stock_Type:3; -1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
			
			If (OK=1)
				[CURRENT_STOCK:62]Item_Number:5:=0
				If ([CURRENT_STOCK:62]X_ID:13=0)
					[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
				End if 
				DB_SaveRecord(->[CURRENT_STOCK:62])
				AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
				If (OK=1)
					//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)  `reversed in 4.0.036
					Move_PostLevCur(->[CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
					
				End if 
			End if 
		End if 
	End if 
End if 

//Remove Order Item Allocation


If ([ORDERS:24]Company_Code:1=<>SYS_t_StockOrderCompany)
	[ORDER_ITEMS:25]Delivery_Date:11:=<>DB_d_CurrentDate
End if 
CUT NAMED SELECTION:C334([CURRENT_STOCK:62]; "CurrStock")

[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!

OrderI_AllOIUp2

[ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated
If ([ORDER_ITEMS:25]Allocated:28=0)
	[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
	
End if 


USE NAMED SELECTION:C332("CurrStock")
ERR_MethodTrackerReturn("OrderI_Una2"; $_t_oldMethodName)