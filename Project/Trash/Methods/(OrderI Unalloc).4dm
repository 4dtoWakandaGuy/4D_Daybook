//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Unalloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 08:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vSave)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Unalloc")
//OrderI Unalloc
//THIS IS TOTAL RUBBISH, which explains the 1=0
If (False:C215)
	If ((1=0) & (DB_t_CurrentFormUsage#"NA@") & ([ORDER_ITEMS:25]Item_Number:27#0) & ([ORDER_ITEMS:25]Allocated:28#0))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
		If ((Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0) & (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])<([ORDER_ITEMS:25]Allocated:28*2)))
			FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
			While (Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27])))
				[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
				[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
				[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
				
				
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				
				
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				[ORDER_ITEMS:25]Serial_Number:24:=""
				[ORDER_ITEMS:25]Allocated:28:=[ORDER_ITEMS:25]Allocated:28-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				If ([ORDER_ITEMS:25]Purchase_Order_Number:18="STOCK")
					[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
					[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End while 
			OrderI_Stock
			If (vSave=1)
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI Unalloc"; $_t_oldMethodName)