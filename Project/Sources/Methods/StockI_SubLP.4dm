//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess; DB_bo_RecordModified)
	C_LONGINT:C283(<>Mod_l_MaxModules; IP_l_Message; STK_l_DupID)
	C_REAL:C285($_r_BreakOff; $_r_Quantity; STK_r_BreakQuantity; vTot)
	C_TEXT:C284(<>ProdCode; <>SYS_t_StockOrderCompany; $_t_MovementClass; $_t_oldMethodName; vCompName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_SubLP")
//Stock Items Sub
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

Case of 
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
		If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
			Gen_Alert("You cannot modify the Serial No field"; "Cancel")
			[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
		Else 
			If (([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"") & ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>1))
				Gen_Alert("Please enter Items singly if you need to allocate Serial Nos"; "Try again")
				[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
			Else 
				If ([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"")
					StockI_SubLPSN(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; ->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				End if 
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
		Check_Product(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; "Product")
		//DEFAULT TABLE([STOCK MOVEMENTS])
		StockI_SubLPPC
		RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
		vCompName:=[COMPANIES:2]Company_Name:2
		<>ProdCode:=[PRODUCTS:9]Product_Code:1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Company_To:2))
		Check_MinorNC(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2; "Company"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[COMPANIES:2]Company_Name:2)
		//DEFAULT TABLE([STOCK MOVEMENTS])
		RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
		vCompName:=[COMPANIES:2]Company_Name:2
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2)
		
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Order_Code:3))
		Check_MinorNC(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order")
		//  RELATE ONE([STOCK ITEMS]Order Code;[ORDERS]Company Code)
		//   RELATE ONE([ORDER ITEMS]Order Code)
		// If ([ORDERS]Order Code="")
		// Check_Minor_IL (??[STOCK ITEMS]Order Code;"Order";??[ORDERS];??[ORDERS]Order Code;
		//  DEFAULT FILE([STOCK ITEMS])
		//  End if
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
		
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
		[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
		//``
		If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		End if 
		
		If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
			//  [STOCK ITEMS]Quantity:=Abs([STOCK ITEMS]Quantity)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				If (([PRODUCTS:9]Serial_Numbered:17=True:C214) & (([STOCK_MOVEMENT_ITEMS:27]Quantity:12>1) | ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<-1)))
					Gen_Alert("This Product requires Serial Nos so must be entered singly"; "Try again")
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=-1
					Else 
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
					End if 
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
				vTot:=1
				DB_bo_RecordModified:=True:C214
				
				If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
					If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
						If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						End if 
						Case of 
							: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
								//ask about updating the PO
								STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; False:C215)
								
								
							: ([MOVEMENT_TYPES:60]UseForStockReceipt:33)  // this is the only type you can modify if it is copied from
								//so here we need to find the previous item(maybe multiple choices at this point
								//so here we need to find the previous item(maybe multiple choices at this point
								$_r_Quantity:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
								Case of 
									: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										$_t_MovementClass:=STK_GetMovementClass([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; True:C214)
										If ($_t_MovementClass="Purchase Order")
											STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; True:C214)
										End if 
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=($_r_Quantity)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										STK_l_DupID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										STK_r_BreakQuantity:=$_r_BreakOff
										IP_l_Message:=(Table:C252(->[STOCK_MOVEMENTS:40])+100)+1
										POST OUTSIDE CALL:C329(Current process:C322)
									: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
										
								End case 
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
									Gen_Alert("You may not change the quantity on this stock movment item. ")
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
								End if 
								
						End case   //
					End if 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				Else 
					[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				End if 
				Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			Else 
				Gen_Alert("You cannot modify the quantity on a stock item related to a sales order item")
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
			End if 
		Else 
			Gen_Alert("You cannot modify the quantity on a posted stock movement")
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		End if   //``
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40))
		[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		
		If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		End if 
		If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
					[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
					If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
						If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						End if 
						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
						
					End if 
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
				RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
				If (([PRODUCTS:9]Serial_Numbered:17=True:C214) & (([STOCK_MOVEMENT_ITEMS:27]Quantity:12>1) | ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<-1)))
					Gen_Alert("This Product requires Serial Nos so must be entered singly"; "Try again")
					If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0)
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-1
					Else 
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=1
					End if 
				End if 
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
				vTot:=1
				DB_bo_RecordModified:=True:C214
				
				If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#0)
					If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
						If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						End if 
						Case of 
							: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
								//ask about updating the PO
								STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; False:C215)
								
								
							: ([MOVEMENT_TYPES:60]UseForStockReceipt:33)  // this is the only type you can modify if it is copied from
								//so here we need to find the previous item(maybe multiple choices at this point
								$_r_Quantity:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
								Case of 
									: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										$_t_MovementClass:=STK_GetMovementClass([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; True:C214)
										If ($_t_MovementClass="Purchase Order")
											STK_ModifyPOonReceipt([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; True:C214)
										End if 
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=($_r_Quantity)
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										STK_l_DupID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										STK_r_BreakQuantity:=$_r_BreakOff
										IP_l_Message:=(Table:C252(->[STOCK_MOVEMENTS:40])+100)+1
										POST OUTSIDE CALL:C329(Current process:C322)
									: ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
										
								End case 
							Else 
								If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
									Gen_Alert("You may not change the quantity on this stock movment item. ")
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
								End if 
								
						End case   //
					End if 
				End if 
				Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			Else 
				Gen_Alert("You cannot modify the quantity on a stock item related to a sales order item")
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
			End if 
		Else 
			Gen_Alert("You cannot modify the quantity on a posted stock movement")
			[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Old:C35([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
		End if 
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
		If (((DB_GetModuleSettingByNUM(Module_Products))#3) & (<>PER_bo_ProdUpdateAccess) & ([STOCK_MOVEMENTS:40]Company_From:2#<>SYS_t_StockOrderCompany) & ([STOCK_MOVEMENTS:40]Company_From:2#""))
			READ WRITE:C146([PRODUCTS:9])
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			If ([PRODUCTS:9]Price_Updates:25)
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
				
				QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[STOCK_MOVEMENTS:40]Company_From:2)
				If (([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10>0) & ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#[PRODUCTS_SUPPLIERS:148]Cost_Price:2) & (Not:C34(Locked:C147([PRODUCTS:9]))))
					Gen_Confirm("Do you want to update the Product's Cost Price?"; "Yes"; "No")
					If (OK=1)
						If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
							[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[STOCK_MOVEMENTS:40]Company_From:2
						End if 
						[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
						// [PRODUCTS]SUPPLIERS'Margin:=Gen_Round (((([PRODUCTS]Sales Price-
						//[PRODUCTS]SUPPLIERS'Cost Price)/[PRODUCTS]Sales Price)*100);2;4)
						[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
						DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
						DB_SaveRecord(->[PRODUCTS:9])
						AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
					End if 
				End if 
			End if 
			READ ONLY:C145([PRODUCTS:9])
			UNLOAD RECORD:C212([PRODUCTS:9])
		End if 
		[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
		vTot:=1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
		
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13))
		[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13/Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)  //4.0.035/6
		vTot:=1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
		
	: (Modified:C32([STOCK_MOVEMENT_ITEMS:27]Location:7))
		Check_MinorNC(->[STOCK_MOVEMENT_ITEMS:27]Location:7; "Location"; ->[LOCATIONS:61]; ->[LOCATIONS:61]Location_Code:1; ->[LOCATIONS:61]Location_Name:2)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[STOCK_MOVEMENT_ITEMS:27]Location:7)
End case 
ERR_MethodTrackerReturn("StockI_SubLP"; $_t_oldMethodName)
