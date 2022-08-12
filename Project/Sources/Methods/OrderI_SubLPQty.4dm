//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SubLPQty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 08:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>OrdQtyAlloc; $_bo_NoAllocation; STK_bo_ALLOCATIONASKED; STK_bo_SHOWSTOCKALLOCATION)
	C_LONGINT:C283(vSave; Xcancel; Xnext)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PRD_t_FurtherApplicable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPQty")
If (DB_t_CurrentFormUsage#"None")
	Check_Sec(->[ORDER_ITEMS:25]Quantity:3; ->[ORDER_ITEMS:25]Item_Locked:16)
End if 
If (OK=1)
	If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE") & (DB_t_CurrentFormUsage#"None")
		Gen_Alert("You cannot change the Quantity of a Bundle Product for"+" which the Next Level items have been created"; "Cancel")
		[ORDER_ITEMS:25]Quantity:3:=Old:C35([ORDER_ITEMS:25]Quantity:3)
	Else 
		//  If (([ORDER ITEMS]Invoice No="SUBS") & ([ORDER ITEMS]Quantity#1))
		//   Gen_Alert ("Subscription Order Items can only be given a Quantity of 1";"OK")
		//  [ORDER ITEMS]Quantity:=1
		// End if
		If ([ORDER_ITEMS:25]Allocated:28>0)
			[ORDER_ITEMS:25]Quantity:3:=Abs:C99([ORDER_ITEMS:25]Quantity:3)
		End if 
		If (([ORDER_ITEMS:25]Quantity:3<[ORDER_ITEMS:25]Allocated:28) & ([ORDER_ITEMS:25]Quantity:3>=0)) & (DB_t_CurrentFormUsage#"None")
			Gen_Alert("The Quantity cannot be less than existing Allocations"; "")
			[ORDER_ITEMS:25]Quantity:3:=[ORDER_ITEMS:25]Allocated:28
			$_bo_NoAllocation:=True:C214
		End if 
		vSave:=1
		If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		End if 
		If ([ORDER_ITEMS:25]Product_Code:2#"")
			If ([ORDER_ITEMS:25]Price_Code:36#"")
				PriceT_Check
			Else 
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				If (PRD_t_FurtherApplicable#"")
					QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
				End if 
				
				PriceT_FilterDates
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9>0)
				If (Records in selection:C76([PRICE_TABLE:28])>0)
					If ([ORDER_ITEMS:25]Price_Code:36#"")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=[ORDER_ITEMS:25]Price_Code:36)
					End if 
					If (Records in selection:C76([PRICE_TABLE:28])>0)
						PriceT_SearchC2([ORDERS:24]Company_Code:1)
						If (Records in selection:C76([PRICE_TABLE:28])>0)
							SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
							QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
							SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
							If (Records in selection:C76([PRICE_TABLE:28])>0)
								PriceT_SearchQt
								PriceT_CheckCo2([ORDERS:24]Company_Code:1)
								If (Records in selection:C76([PRICE_TABLE:28])>0)
									If ([PRICE_TABLE:28]Price_Code:2#[PRICE_GROUPS:18]Price_Code:1)
										RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
									End if 
									If ([PRICE_GROUPS:18]Automatic:5)
										OrderI_SubPTA
										[ORDER_ITEMS:25]Price_Code:36:=[PRICE_TABLE:28]Price_Code:2
									End if 
								Else 
									If (([ORDER_ITEMS:25]Price_Code:36#"") | ([ORDER_ITEMS:25]Discount:37#0))  //has to be here cos you may be reducing
										[ORDER_ITEMS:25]Price_Code:36:=""  //the qty such that there is no discount
										[ORDER_ITEMS:25]Discount:37:=0
										[ORDER_ITEMS:25]Sales_Price:4:=[ORDER_ITEMS:25]Retail_Price:38
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		//  If (([PRODUCTS]Serial Numbered=True) & ([ORDER ITEMS]Quantity>1))
		//  Gen_Alert ("This Product requires Serial Nos so must be entered singly";"")
		//  [ORDER ITEMS]Quantity:=1
		//   Calc_Item
		//   If (Old([ORDER ITEMS]Quantity)=0)
		//     OrderI Alloc
		//   End if
		//   Else
		Calc_Item
		//  If (Old([ORDER ITEMS]Quantity)>0)
		// OrderI_Unalloc
		//   End if
		If (<>OrdQtyAlloc)
			If ((DB_t_CurrentFormUsage#"Job") & (DB_t_CurrentFormUsage#"Purch") & (DB_t_CurrentFormUsage#"PJ") & (DB_t_CurrentFormUsage#"NAT"))
				$_bo_NoAllocation:=False:C215
				
				If ((DB_t_CurrentFormUsage#"NA@") & ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)))
					
					If (Not:C34(STK_bo_ALLOCATIONASKED))
						Gen_Confirm3("Do you want to allocate stock?"; "Yes"; "No"; "Hold")
						Case of 
							: (Xnext=1)
								STK_bo_ALLOCATIONASKED:=True:C214
								STK_bo_SHOWSTOCKALLOCATION:=False:C215
							: (Xcancel=1)
								$_bo_NoAllocation:=True:C214
							Else 
								STK_bo_ALLOCATIONASKED:=True:C214
								STK_bo_SHOWSTOCKALLOCATION:=True:C214
						End case 
					End if 
					OK:=1
					If ($_bo_NoAllocation=False:C215) & (STK_bo_SHOWSTOCKALLOCATION)
						OrderI_AllocCu2
					End if 
				End if 
				//HIDE PROCESS(Current process)
				//SHOW PROCESS(Current process)
				// BRING TO FRONT(Current process)
				
			End if 
		End if 
		// End if
		OrderI_SubRel
		OrderI_BunCost(1)
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubLPQty"; $_t_oldMethodName)
