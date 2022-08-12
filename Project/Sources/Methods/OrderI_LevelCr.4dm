//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_LevelCr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OrderItemNumber; 0)
	ARRAY REAL:C219($_ar_ComponentQuantities; 0)
	ARRAY TEXT:C222($_at_ComponentCodes; 0)
	ARRAY TEXT:C222($_at_ProductCode; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderNumber; 0)
	C_BOOLEAN:C305(<>ResetNumber; $_bo_Bundle)
	C_LONGINT:C283(<>OINo; $_l_ClashingRecords; $_l_ComponentLevel; $_l_FIeldNumber; $_l_Index; $_l_Index2; $_l_ItemNumber; $_l_NextOrderSortReference; $_l_ProcessID; $_l_RecordsinselectionComponents; $_l_SIzeofArray)
	C_LONGINT:C283($_l_TableNumber; vST)
	C_REAL:C285($_r_Quantity)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode; $_t_oldMethodName; $_t_SalesCurrency; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_LevelCr")
//OrderI_LevelCr - eate

If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	vST:=vST+1
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCode; [ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PurchaseOrderNumber; [ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumber)
	$_l_SIzeofArray:=Size of array:C274($_at_ProductCode)
	CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Extra")
	For ($_l_Index; 1; $_l_SIzeofArray)
		If ($_at_ProductCode{$_l_Index}#"")
			If (($_at_PurchaseOrderNumber{$_l_Index}="BUNDLE*") | ($_at_PurchaseOrderNumber{$_l_Index}="ASSEMBLY*"))
				QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$_at_ProductCode{$_l_Index})
				$_l_RecordsinselectionComponents:=Records in selection:C76([COMPONENTS:86])
				If ($_l_RecordsinselectionComponents>0)
					READ WRITE:C146([ORDER_ITEMS:25])
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumber{$_l_Index})
					If ($_at_PurchaseOrderNumber{$_l_Index}="BUNDLE*")
						[ORDER_ITEMS:25]Purchase_Order_Number:18:="BUNDLE"
						$_bo_Bundle:=True:C214
					Else 
						[ORDER_ITEMS:25]Purchase_Order_Number:18:="ASSEMBLY"
						$_bo_Bundle:=False:C215
					End if 
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					$_r_Quantity:=[ORDER_ITEMS:25]Quantity:3
					$_l_ComponentLevel:=[ORDER_ITEMS:25]Component_Level:47
					ARRAY TEXT:C222($_at_ComponentCodes; 0)
					ARRAY REAL:C219($_ar_ComponentQuantities; 0)
					SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_ComponentCodes; [COMPONENTS:86]Quantity:3; $_ar_ComponentQuantities)
					For ($_l_Index2; 1; $_l_RecordsinselectionComponents)
						DUPLICATE RECORD:C225([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]x_ID:58:=0
						If (<>OINo=0)
							READ ONLY:C145([IDENTIFIERS:16])
							QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
							<>OINo:=[IDENTIFIERS:16]Number:2
							UNLOAD RECORD:C212([IDENTIFIERS:16])
						End if 
						Repeat 
							$_l_ItemNumber:=<>OINo+AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
							SET QUERY DESTINATION:C396(3; $_l_ClashingRecords)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_ItemNumber)
							SET QUERY DESTINATION:C396(0)
							If ($_l_ClashingRecords>0)
								$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
								$_l_FIeldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
								<>ResetNumber:=False:C215
								$_l_ProcessID:=New process:C317("AA_SetNextID"; 256000; "FIxingNumber"; $_l_TableNumber; $_l_FIeldNumber; $_l_ItemNumber; <>OINo)
								Repeat 
									DelayTicks(60)
								Until (<>ResetNumber)
								<>ResetNumber:=False:C215
							End if 
							
						Until ($_l_ClashingRecords=0)
						$_l_NextOrderSortReference:=1
						[ORDER_ITEMS:25]Item_Number:27:=$_l_ItemNumber
						If (DB_t_CurrentFormUsage="Job@")
							[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
							$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; ""; $_l_NextOrderSortReference)
							//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order Code;$_l_NextOrderSortReference)
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
							[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
							
						Else 
							[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
							//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderSortReference)
							$_l_NextOrderSortReference:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderSortReference; Records in selection:C76([ORDER_ITEMS:25]))
							
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
							[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
							
						End if 
						[ORDER_ITEMS:25]Product_Code:2:=$_at_ComponentCodes{$_l_Index2}
						RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
						[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
						[ORDER_ITEMS:25]Description:44:=[PRODUCTS:9]Description:6
						If (([ORDER_ITEMS:25]Tax_Code:12=DB_GetLedgerDefaultSalesTax) & ([PRODUCTS:9]Default_Tax:23#""))
							[ORDER_ITEMS:25]Tax_Code:12:=[PRODUCTS:9]Default_Tax:23
						End if 
						If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
							
							[ORDER_ITEMS:25]Retail_Price:38:=[PRODUCTS:9]Sales_Price:9
							[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
						Else 
							QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
							$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
							If ([ORDERS:24]Currency_Code:32#"")
								$_t_SalesCurrency:=[ORDERS:24]Currency_Code:32
							Else 
								$_t_SalesCurrency:=<>SYS_t_BaseCurrency
							End if 
							
							If ($_t_SalesCurrency=$_t_CurrencyCode)
								[ORDER_ITEMS:25]Retail_Price:38:=[PRODUCTS:9]Sales_Price:9
								[ORDER_ITEMS:25]Standard_Price:39:=[PRODUCTS:9]Standard_Price:16
							Else 
								[ORDER_ITEMS:25]Retail_Price:38:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; $_t_CurrencyCode; $_t_SalesCurrency; Current date:C33(*))
								[ORDER_ITEMS:25]Standard_Price:39:=Cat_ConvertValue([PRODUCTS:9]Standard_Price:16; $_t_CurrencyCode; $_t_SalesCurrency; Current date:C33(*))
							End if 
							
						End if 
						[ORDER_ITEMS:25]Quantity:3:=$_r_Quantity*$_ar_ComponentQuantities{$_l_Index2}
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[ORDER_ITEMS:25]Discount:37)/100)); 2; 1)
						If ($_bo_Bundle)
							[ORDER_ITEMS:25]Invoice_Number:17:=""
						Else 
							[ORDER_ITEMS:25]Invoice_Number:17:="ASS COMP"
						End if 
						[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
						[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
						[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=""
						[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=""
						[ORDER_ITEMS:25]Serial_Number:24:=""
						[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
						[ORDER_ITEMS:25]Allocated:28:=0
						[ORDER_ITEMS:25]Contract_Cost:30:=0
						[ORDER_ITEMS:25]Supply_by_Date:31:=!00-00-00!
						[ORDER_ITEMS:25]Supplier_Reference:33:=""
						OrderI_SubLPPC3
						Calc_Item
						[ORDER_ITEMS:25]Component_Level:47:=$_l_ComponentLevel+1
						[ORDER_ITEMS:25]Level_Up_Item_Number:48:=$_al_OrderItemNumber{$_l_Index}
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						
						ADD TO SET:C119([ORDER_ITEMS:25]; "Extra")
						If (Count parameters:C259=1)
							ADD TO SET:C119([ORDER_ITEMS:25]; $1)
						End if 
					End for 
					
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_OrderItemNumber{$_l_Index})
					[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				End if 
			End if 
		End if 
	End for 
	If ((Records in set:C195("Extra")>0) & (vST<10))
		USE SET:C118("Extra")
		OrderI_LevelCr
	End if 
	CLEAR SET:C117("Extra")
	vST:=vST-1
End if 
ERR_MethodTrackerReturn("OrderI_LevelCr"; $_t_oldMethodName)