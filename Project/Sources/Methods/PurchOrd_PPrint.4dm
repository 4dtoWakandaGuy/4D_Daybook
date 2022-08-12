//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_PPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: AA_jumkxl
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAdd)
	//C_UNKNOWN(xCancel)
	//C_UNKNOWN(xNext)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305(<>STK_bo_UseNew; $_bo_EnableStockPosting; $_bo_NoPrint; $_bo_Updade; $3; PO_bo_AddItem; SR_bo_Validated; <>DB_bo_NewStockActive; $_bo_EnableStockPosting; $_bo_NoPrint; $_bo_Updade)
	C_BOOLEAN:C305($3; PO_bo_AddItem; SR_bo_Validated)
	C_LONGINT:C283($_l_POIIndex; $_l_Printed; $1; vAdd; xCancel; xNext; $_l_ModuleAccess; $_l_POIIndex; $_l_Printed)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $_t_PONumber; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_CurrentWindowTitle; $_t_DocumentName; $_t_oldMethodName; $_t_PONumber; DB_t_CurrentFormUsage)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_PPrint")
SR_bo_Validated:=False:C215
Menu_Record("PurchOrd_PPrint"; "Print Purchase Order")
OK:=1
xNext:=0
PO_SaveDeliveryAddress
If (PO_bo_AddItem)
	DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
End if 
$_bo_Updade:=False:C215
$_bo_NoPrint:=True:C214
If ([PURCHASE_ORDERS:57]State:14<0)
	Case of 
		: (Count parameters:C259>=2)
			Gen_Confirm3("Do you want to confirm and print the Purchase Order?"; "Print"; "Cancel"; "Upgrade")
			Case of 
				: (xCancel=1)
					OK:=0
					$2->:=0
					$_bo_NoPrint:=True:C214
					$_bo_Updade:=False:C215
				: (xnext=1)
					$2->:=1
					$_bo_NoPrint:=True:C214
					$_bo_Updade:=True:C214
				Else 
					
					$2->:=1
					$_bo_NoPrint:=False:C215
					$_bo_Updade:=True:C214
					
			End case 
		: (Count parameters:C259=0)
			OK:=1
			xCancel:=0
			$_bo_NoPrint:=False:C215
			$_bo_Updade:=True:C214
		Else 
			Gen_Confirm3("Do you want to confirm and print the Purchase Order?"; "Print"; "Cancel"; "Upgrade")
			Case of 
				: (xCancel=1)
					OK:=0
					$_bo_NoPrint:=True:C214
					$_bo_Updade:=False:C215
				: (xnext=1)
					$_bo_NoPrint:=True:C214
					$_bo_Updade:=True:C214
				Else 
					$_bo_NoPrint:=False:C215
					$_bo_Updade:=True:C214
					
			End case 
	End case 
Else 
	$_bo_Updade:=False:C215
	If (Count parameters:C259>=1)
		Gen_Confirm("Do you want to Print the Purchase Order?"; "Print"; "Cancel")
		$_bo_NoPrint:=(OK=0)
		
	Else 
		XCancel:=0
		OK:=1
		$_bo_NoPrint:=False:C215
	End if 
End if 
If (Count parameters:C259>2)
	If (xCancel=1)
		OK:=0
		$2->:=0
	Else 
		$2->:=1
	End if 
Else 
	If (xCancel=1)
		OK:=0
		
	Else 
		
	End if 
	
End if 
If (Count parameters:C259>=3)
	$_bo_EnableStockPosting:=$3
Else 
	$_bo_EnableStockPosting:=True:C214
End if 


If ($_bo_NoPrint=False:C215)
	//SELECTION TO ARRAY([PURCHASE ORDERS]Purch Ord No;$PONums)
	Gen_PP1(->[PURCHASE_ORDERS:57]; "PurchOrd")
	//Gen_PPSingle (->[PURCHASE ORDERS];"Form";"PurchaseOrder_Out";DB_t_CurrentFormUsage;"PURCHASE ORDER";"PurchOrd_FormLP";0;->[PURCHASE ORDERS]Purch Ord No;"Purch Order";[PURCHASE ORDERS]Analysis Code)
	$_t_DocumentName:="Purchase order "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2  // 05/04/04 pb
	$_t_CurrentWindowTitle:=Get window title:C450
	SET WINDOW TITLE:C213($_t_DocumentName)
	$_t_PONumber:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
	$_l_Printed:=Gen_PPSingle(->[PURCHASE_ORDERS:57]; "Form"; "PurchaseOrder_Out"; DB_t_CurrentFormUsage; "PURCHASE ORDER"; "PurchOrd_FormLP"; 0; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; "Purchase_Order"; [PURCHASE_ORDERS:57]Analysis_Code:15; False:C215; $_t_DocumentName)
	SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
	If ($_t_PONumber#[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		QUERY:C277([PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_PONumber)
	End if 
	If ($_l_Printed=1)
		If (<>DB_bo_NewStockActive)
			If ((DB_GetModuleSettingByNUM(Module_StockControl)>0) & ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)) & ($_bo_EnableStockPosting)
				
				If ((vAdd=0) & (Count parameters:C259=0))  //Otherwise would be 2 trans
					//  START TRANSACTION
					StartTransaction  // 13/05/02 pb
					
				End if 
				If ($_bo_Updade)
					If ([PURCHASE_ORDERS:57]State:14<0)
						[PURCHASE_ORDERS:57]State:14:=0
						PUR_SetFileState(1)
					End if 
				End if 
				DB_SaveRecord(->[PURCHASE_ORDERS:57])
				//NG modification relation to new stock system. Check if the stock movement already exists
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]MovementSourceTable:16=Table:C252(->[PURCHASE_ORDERS:57]); *)
				QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]MovementSourceReference:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
				If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
					ARRAY TEXT:C222($_at_ProductCodes; 0)
					QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
					
					FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
					For ($_l_POIIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
						If ([PURCHASE_ORDERS_ITEMS:169]Product_Code:1#"")
							APPEND TO ARRAY:C911($_at_ProductCodes; [PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
						End if 
						NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
					End for 
					If (Size of array:C274($_at_ProductCodes)>0)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Maintain_Stock:14=True:C214)
						If (Records in selection:C76([PRODUCTS:9])>0)
							//At least one product has maintain stock set on it
							//    [STOCK MOVEMENTS]MovementSourceTable:=Table(->[PURCHASE ORDERS])
							//[STOCK MOVEMENTS]MovementSourceReference:=[PURCHASE ORDERS]Purch Ord No
							//[STOCK MOVEMENTS]MovementSourceField:=Field(->[PURCHASE ORDERS]Purch Ord No)
							Gen_Confirm("Do you want to post the Purchase Order as a Stock Movement?"; "Yes"; "No")
							If (OK=1)
								
								STK_EnterStockMovement(1; False:C215; [PURCHASE_ORDERS:57]x_ID:21)
							Else 
								OK:=1
							End if 
						Else 
							OK:=1
						End if 
					Else 
						OK:=1
					End if 
				Else 
					//NG here we should test that the PO has not been modified..which would mean posting a cancellation or additonal po stock movement
					OK:=1
				End if 
				If ((vAdd=0) & (Count parameters:C259=0))
					//     Transact EndNF
					Transact_End  // 13/05/02 pb
				End if 
			Else 
				If ($_bo_Updade)
					If ([PURCHASE_ORDERS:57]State:14<0)
						[PURCHASE_ORDERS:57]State:14:=0
						PUR_SetFileState(1)
					End if 
				End if 
			End if 
		Else 
			If ((vAdd=0) & (Count parameters:C259=0))  //Otherwise would be 2 trans
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
			End if 
			If ([PURCHASE_ORDERS:57]State:14<0)
				[PURCHASE_ORDERS:57]State:14:=0
				PUR_SetFileState(1)
				
				DB_SaveRecord(->[PURCHASE_ORDERS:57])
				If ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)
					$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
					If ($_l_ModuleAccess>=2)
						Gen_Confirm("Do you want to post the Purchase Order as a Stock Movement?"; "Yes"; "No")
						If (OK=1)
							PurchOrd_StckP2
						Else 
							OK:=1
						End if 
					Else 
						OK:=1
					End if 
				End if 
			Else 
				OK:=1
				If ([PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)
					$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
					If ($_l_ModuleAccess>=2)
						Gen_Confirm("Do you want to post the Purchase Order as a Stock Movement?"; "Yes"; "No")
						If (OK=1)
							PurchOrd_StckP2
						Else 
							OK:=1
						End if 
					End if 
				Else 
					OK:=1
				End if 
				
			End if 
			If ((vAdd=0) & (Count parameters:C259=0))
				//     Transact EndNF
				Transact_End  // 13/05/02 pb
			End if 
		End if 
	Else 
		If ($_bo_Updade)
		End if 
		OK:=1
	End if 
	//QUERY WITH ARRAY([PURCHASE ORDERS]Purch Ord No;$PONums)
	Gen_PP2("PurchOrd")
	PurchOrd_State
Else 
	//Not printing but..
	If ($_bo_Updade)
	End if 
	If (xNext=0)
		OK:=1
	End if 
End if 
ERR_MethodTrackerReturn("PurchOrd_PPrint"; $_t_oldMethodName)
