//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI CurrButt
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
	ARRAY LONGINT:C221($_al_CurrentStockIDS; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_LONGINT:C283($_l_AddToCurrentStockID; $_l_CountStockMovementItems; $_l_Index; $_l_ItemNumber; $_l_RecordNumber; $_l_StockMovementItemID; STOCK_l_Context; vNo)
	C_REAL:C285($_r_Remaining; $_r_Sum)
	C_TEXT:C284($_t_AddToStockType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_MovementTypeStockAdd; $_t_oldMethodName; $_t_OrderCode; $_t_Search; $_t_SerialNumber; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode; vStatus; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI CurrButt")
If (STOCK_l_Context>=0)  // added NG may 2004 to
	//prevent copying if this is an stock movement being copyied from
	
	//StockI CurrButt
	Menu_Record("StockI CurrButt"; "Copy Current Stock")
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
	If ([MOVEMENT_TYPES:60]Serial_Unique:19)
		Gen_Alert("This Movement Type requires unique Serial Nos"; "Cancel")
	Else 
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CurrentSelection")
		
		If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])#0)
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		End if 
		DB_SaveRecord(->[STOCK_MOVEMENTS:40])
		OK:=1
		$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
		
		If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)  //4.0.030
				$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
			Else 
				$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
			End if 
		Else 
			$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
			$_t_Search:=Substring:C12(Gen_Request("Product Code(s) or Name to find:"); 1; 51)
			If (OK=1)
				Prod_Sel2($_t_Search)
				If (Records in selection:C76([PRODUCTS:9])>1)
					vNo:=Records in selection:C76([PRODUCTS:9])
					//Products_FileI
					//Products_FileO
					//$`Lay:=DB_t_CurrentFormUsage
					//DB_t_CurrentFormUsage:="Select"
					//Userset_Empty (->[PRODUCTS])
					//Open_Pro_Window ("Select Product(s) for Stock Search";0;2;->[PRODUCTS];WIN_t_CurrentInputForm)
					
					//D`ISPLAY SELECTION([PRODUCTS];*)
					//Userset
					FIRST RECORD:C50([PRODUCTS:9])
					//Close_ProWin
					//DB_t_CurrentFormUsage:=$Lay
					
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); True:C214)
					
					
					
				End if 
			End if 
		End if 
		If ((OK=1) & (Records in selection:C76([PRODUCTS:9])>0))
			If (Records in selection:C76([PRODUCTS:9])>2000000)
				Gen_Alert("Please select 2000000 or fewer Products when using this routine"; "Cancel")
			Else 
				If ($_t_MovementTypeStockAdd="")
					Gen_Alert("This Movement Type has no existing stock"; "Cancel")
				Else 
					SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
					QUERY WITH ARRAY:C644([CURRENT_STOCK:62]Product_Code:1; $_at_ProductCodes)
					If (False:C215)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
						NEXT RECORD:C51([PRODUCTS:9])
						While (Not:C34(End selection:C36([PRODUCTS:9])))
							QUERY:C277([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
							NEXT RECORD:C51([PRODUCTS:9])
						End while 
					End if 
					QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_t_MovementTypeStockAdd)
					vType:=$_t_MovementTypeStockAdd
					vStatus:=$_t_MovementTypeStockAdd
					//FIRST RECORD([PRODUCTS])
					vProdCode:=[PRODUCTS:9]Product_Code:1
					If (Records in selection:C76([CURRENT_STOCK:62])>0)
						//StockI_CurrDisp
						
						DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); True:C214)
						
						
						vNo:=Records in selection:C76([CURRENT_STOCK:62])
						If ((OK=1) & (vNo>0))
							SELECTION TO ARRAY:C260([CURRENT_STOCK:62]X_ID:13; $_al_CurrentStockIDS)
							QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22; $_al_CurrentStockIDS)
							QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
							
							If (False:C215)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[CURRENT_STOCK:62]Product_Code:1; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_MovementTypeStockAdd; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=[CURRENT_STOCK:62]Cost_Price:6; *)
								If ([CURRENT_STOCK:62]Serial_Number:2#"")
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=[CURRENT_STOCK:62]Serial_Number:2; *)
								End if 
								If ([CURRENT_STOCK:62]Location:8#"")
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=[CURRENT_STOCK:62]Location:8; *)
								End if 
								If ([CURRENT_STOCK:62]Item_Number:5#0)
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[CURRENT_STOCK:62]Item_Number:5; *)
								End if 
								If ([CURRENT_STOCK:62]Analysis_Code:10#"")
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=[CURRENT_STOCK:62]Item_Number:5; *)
								End if 
								If ([CURRENT_STOCK:62]Layer_Code:12#"")
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=[CURRENT_STOCK:62]Layer_Code:12; *)
								End if 
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27])
								$_r_Sum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
							End if 
							
							COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CopyFromSeleciton")
							
							
							If ($_l_RecordNumber#0) & (False:C215)
								//StockI_CurrLoad
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Sum
							Else 
								If (vNo>1)
									Gen_Confirm("Add "+String:C10(vNo)+" Stock Items to the Movement?"; "Yes"; "No")
								End if 
								If (OK=1)
									USE NAMED SELECTION:C332("$CopyFromSeleciton")
									$_l_CountStockMovementItems:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
									For ($_l_Index; 1; $_l_CountStockMovementItems)
										USE NAMED SELECTION:C332("$CopyFromSeleciton")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
										$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
										$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
										$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
										$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
										$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
										$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
										$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
										$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
										$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
										//`ont forget to take the purchase order code and purchase order item number off or the PO will still think this is expected stock
										//if the serial number is filled in take it off the old record
										$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
										[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
										If ($_l_ItemNumber>0)
										End if 
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										STK_ItemDuplicate
										[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
										$_r_Remaining:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_Remaining
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
										If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
											[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
											[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										End if 
										[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
										[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
										[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber
										If ($_t_SerialNumber#"")
											[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=True:C214
										End if 
										//if copied trom an on order types then the
										[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=[STOCK_MOVEMENTS:40]Movement_Date:5
										If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
										End if 
										If (Not:C34([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39))
											If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[MOVEMENT_TYPES:60]Stock_Minus:4)  //the item we have copied from added to the type we are now going to take from-good copying
												//although it appears to make this relation here its actually a mistake because the quantity is not firm and if the user changes anything.
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_StockMovementItemID
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
												
											Else 
												//not good copying-the type copying f rom does not match
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
											End if 
										Else 
											If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[MOVEMENT_TYPES:60]Stock_Minus:4)
												//good copying the march is corrrect
												//although it appears to make this relation here its actually a mistake because the quantity is not firm and if the user changes anything.
												//now the quantites are verified..so thats not true..
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_StockMovementItemID
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
												
											Else 
												//bad copying this will not take from the type we copied from
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
												[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
											End if 
										End if 
										
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
										[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
										[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
										[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45:=""
										[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_Location
										[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
										[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
										[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
										[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
										[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
										Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											//no need to do this because stk_addtoOnHold will update the called off.
											//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
										End if 
									End for 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		Else 
			Gen_Alert("There is no Current Stock of this Product"; "Cancel")
		End if 
		RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
		Move_InType
		
		STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
		vNo:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		[STOCK_MOVEMENTS:40]Total_Cost:8:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
		CREATE SET:C116([STOCK_MOVEMENTS:40]; "Master")
	End if 
End if 
ERR_MethodTrackerReturn("StockI CurrButt"; $_t_oldMethodName)
