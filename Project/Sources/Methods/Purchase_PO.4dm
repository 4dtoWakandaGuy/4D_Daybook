//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchase_PO
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
	ARRAY LONGINT:C221($_al_SelectedPOItems; 0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(PI_al_AlreadyCopied;0)
	//ARRAY LONGINT(PI_al_CopyItemNo;0)
	//ARRAY LONGINT(PI_al_dCopyItem;0)
	//ARRAY LONGINT(PI_al_DisplayItem;0)
	//ARRAY LONGINT(PI_al_dMarkItem;0)
	//ARRAY LONGINT(PI_al_ItemNumbers;0)
	//ARRAY LONGINT(PI_al_MarkItemNumbers;0)
	//ARRAY REAL(PI_ar_dProductQTY;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(PI_at_DProductCode;0)
	//ARRAY TEXT(PI_at_dProductDes;0)
	C_BOOLEAN:C305(<>PersAnOver; $_bo_Continue; $_bo_Mark; $_bo_MarkThisOne; $_bo_OK; $_bo_ReadOnlyState; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CountPurchaseOrderItems; $_l_CountPurchaseOrders; $_l_CurrentWinRefOLD; $_l_DIsplayItemROW; $_l_Element; $_l_ItemNumber; $_l_Items; $_l_Process; $_l_PurchaseItemIndex; $_l_PurchaseItemRow; PI_l_Copy)
	C_LONGINT:C283(vNo; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($2)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_CurrentOutputForm; $_t_oldMethodName; $_t_Search; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText)
	C_TEXT:C284(vCompName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("Purchase_PO")
//Project Method Purchase_PO 26/3/2(ID 5995-5926)
//NG January 2009. This method is being modified so that it can also be called from a Purchase order.
//Purchase Order Items
$_bo_ReadOnlyState:=Read only state:C362([PURCHASE_ORDERS:57])
ARRAY LONGINT:C221($_al_SelectedPOItems; 0)
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
Menu_Record("Purchase_PO"; "Copy a Purchase Order")

If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
	[PURCHASE_INVOICES:37]Purchase_Code:1:="*P"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "*P")
End if 
DB_SaveRecord(->[PURCHASE_INVOICES:37])
If (Count parameters:C259=0)
	READ ONLY:C145([PURCHASE_ORDERS:57])
End if 
If (Count parameters:C259=0)
	$_t_Search:=Check_QM(Substring:C12(Gen_Request("Purchase Order No or Date:"); 1; 11))
	$_bo_Continue:=False:C215
	If ((OK=1) & ($_t_Search#""))
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_Search)
		If (Records in selection:C76([PURCHASE_ORDERS:57])=0)
			QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Date:3=Date:C102($_t_Search))
		End if 
		If (([PURCHASE_INVOICES:37]Company_Code:2#"") & (Records in selection:C76([PURCHASE_ORDERS:57])>1))
			QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
		End if 
		QUERY SELECTION BY FORMULA:C207([PURCHASE_ORDERS:57]; Purchase_POSrch)
		$_bo_Continue:=True:C214
	End if 
	OK:=1
Else 
	//parameters passed tell us the PO to copy from
	//$1=Purchase order no
	If ($1#[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$1)
	End if 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
		If (Records in selection:C76([PURCHASE_ORDERS:57])>1)
			If (Count parameters:C259=0)
				//PurchOrd_FileI
				//vNo:=Records in selection([PURCHASE ORDERS])
				//OUTPUT FORM([PURCHASE ORDERS];"PurchaseOrder_Out")
				//WIN_t_CurrentOutputform:="PurchaseOrder_Out"
				//DB_t_CurrentFormUsage:="Select"
				//Open_Pro_Window ("Select Purchase Orders";0;1;->[PURCHASE ORDERS];WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[PURCHASE ORDERS];WIN_t_CurrentOutputform)
				//D`ISPLAY SELECTION([PURCHASE ORDERS];*)
				//I`f (Records in set("Userset")>0)
				//USE SET("Userset")
				//End if
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])); True:C214)
				
			End if 
		End if 
		If ((OK=1) & (Records in selection:C76([PURCHASE_ORDERS:57])>0))
			$_l_Items:=0
			
			//End while
			If (Count parameters:C259=0)
				If (Count parameters:C259=0)
					FIRST RECORD:C50([PURCHASE_ORDERS:57])
					$_l_CountPurchaseOrders:=Records in selection:C76([PURCHASE_ORDERS:57])
				Else 
					$_l_CountPurchaseOrders:=1
				End if 
				
				For ($_l_PurchaseItemIndex; 1; $_l_CountPurchaseOrders)
					//While (Not(End selection([PURCHASE ORDERS])))
					QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2; *)
					
					QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19="")
					QUERY SELECTION:C341([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8="")
					$_l_Items:=$_l_Items+Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
					If (Count parameters:C259=0)
						NEXT RECORD:C51([PURCHASE_ORDERS:57])
					End if 
				End for 
				Gen_Confirm("Add "+String:C10(Records in selection:C76([PURCHASE_ORDERS:57]))+" Purchase Order(s) with "+String:C10($_l_Items)+" uninvoiced Item(s) to the Purchase Invoice?"; "Yes"; "Stop")
				$_bo_OK:=(OK=1)
			Else 
				$_bo_OK:=True:C214
			End if 
			If ($_bo_OK)
				If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
					//NG the following should be chnaged so that when using stock control te fully received can be deterrmined from the stock receipts
					If (Count parameters:C259=0)
						Gen_Confirm("Do you want to mark the whole Purchase Order(s) as having been fully received(This will prevent another purchase invoice being created for the items)?"; "Yes"; "Select")
						$_bo_OK:=(OK=1)
					Else 
						
						$_bo_OK:=True:C214
						ARRAY LONGINT:C221($_al_SelectedPOItems; 0)
						COPY ARRAY:C226($2->; $_al_SelectedPOItems)
					End if 
					If ($_bo_OK)
						If (Count parameters:C259=0) | ($_bo_ReadOnlyState)
							READ WRITE:C146([PURCHASE_ORDERS:57])
						End if 
						$_bo_Mark:=True:C214
					Else 
						//```
						If (Count parameters:C259<2)
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 3)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 3)
							GEN_at_DropDownMenu{1}:="Copy All items to PI(none Received)"
							GEN_at_DropDownMenu{2}:="Copy All items to PI(Select Received)"
							GEN_at_DropDownMenu{3}:="Select Items to copy"
							GEN_t_CancelText:="Cancel"
							GEN_t_OKText:="Continue"
							GEN_Bo_ShowCreate:=False:C215
							DB_t_WindowTitle:="Select Copy Option"
							GEN_at_DropDownMenu:=0
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1988)
							DIALOG:C40([USER:15]; "Gen_PopUpChoice")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							ARRAY LONGINT:C221(PI_al_ItemNumbers; 0)
							ARRAY LONGINT:C221(PI_al_AlreadyCopied; 0)
							ARRAY LONGINT:C221(PI_al_CopyItemNo; 0)
							ARRAY LONGINT:C221(PI_al_MarkItemNumbers; 0)
							
							If (GEN_at_DropDownMenu>0)
								Case of 
									: (GEN_at_DropDownMenu=1)
										
									: (GEN_at_DropDownMenu=2)
									: (GEN_at_DropDownMenu=3)
								End case 
								
							End if 
							
						Else 
							ARRAY LONGINT:C221($_al_SelectedPOItems; 0)
							COPY ARRAY:C226($2->; $_al_SelectedPOItems)
							GEN_at_DropDownMenu:=1
							//an array PO Item ids is passed in $2
						End if 
						
						//``````
						$_bo_Mark:=False:C215
						
					End if 
				Else 
					$_bo_Mark:=True:C214
					If (Count parameters:C259>=2)
						ARRAY LONGINT:C221($_al_SelectedPOItems; 0)
						COPY ARRAY:C226($2->; $_al_SelectedPOItems)
					End if 
				End if 
				If (Count parameters:C259=0)
					FIRST RECORD:C50([PURCHASE_ORDERS:57])
					$_l_CountPurchaseOrders:=Records in selection:C76([PURCHASE_ORDERS:57])
				Else 
					$_l_CountPurchaseOrders:=1
				End if 
				For ($_l_Process; 1; $_l_CountPurchaseOrders)
					//While (Not(End selection([PURCHASE ORDERS])))
					If ($_bo_Mark)
						$_bo_OK:=(Check_LockMess(->[PURCHASE_ORDERS:57]; "Purchase Order"))
					Else 
						$_bo_OK:=True:C214
					End if 
					If ($_bo_OK)
						
						ARRAY LONGINT:C221(PI_al_ItemNumbers; 0)
						ARRAY LONGINT:C221(PI_al_AlreadyCopied; 0)
						ARRAY LONGINT:C221(PI_al_CopyItemNo; 0)
						ARRAY LONGINT:C221(PI_al_MarkItemNumbers; 0)
						
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2; *)
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19=""; *)
						QUERY:C277([PURCHASE_ORDERS_ITEMS:169];  & ; [PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8="")
						If (Not:C34($_bo_Mark))
							$_l_CountPurchaseOrderItems:=Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
							ARRAY LONGINT:C221(PI_al_ItemNumbers; $_l_CountPurchaseOrderItems)
							ARRAY LONGINT:C221(PI_al_AlreadyCopied; $_l_CountPurchaseOrderItems)
							ARRAY LONGINT:C221(PI_al_CopyItemNo; $_l_CountPurchaseOrderItems)
							ARRAY LONGINT:C221(PI_al_MarkItemNumbers; $_l_CountPurchaseOrderItems)
							ARRAY LONGINT:C221(PI_al_DisplayItem; 0)
							ARRAY TEXT:C222(PI_at_DProductCode; 0)
							ARRAY TEXT:C222(PI_at_dProductDes; 0)
							ARRAY REAL:C219(PI_ar_dProductQTY; 0)
							ARRAY LONGINT:C221(PI_al_dCopyItem; 0)
							ARRAY LONGINT:C221(PI_al_dMarkItem; 0)
							
							FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
							For ($_l_PurchaseItemIndex; 1; $_l_CountPurchaseOrderItems)
								//GEN_at_DropDownMenu{1}:="Copy All unreceived items to PI(none Received)"
								//GEN_at_DropDownMenu{2}:="Copy All unreceived items to PI(Select Received)"
								//GEN_at_DropDownMenu{3}:="Select unrecevied Items to copy"
								PI_al_ItemNumbers{$_l_PurchaseItemIndex}:=$_l_PurchaseItemIndex
								PI_al_AlreadyCopied{$_l_PurchaseItemIndex}:=Num:C11([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8)
								Case of 
									: (GEN_at_DropDownMenu=1)  // All items-none received
										If (Size of array:C274($_al_SelectedPOItems)>0)
											$_l_PurchaseItemRow:=Find in array:C230($_al_SelectedPOItems; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)
											If ($_l_PurchaseItemRow>0)
												If (PI_al_AlreadyCopied{$_l_PurchaseItemIndex}=0)
													PI_al_CopyItemNo{$_l_PurchaseItemIndex}:=1
												End if 
												PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}:=0
											Else 
												PI_al_CopyItemNo{$_l_PurchaseItemIndex}:=0
												PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}:=0
											End if 
											
										Else 
											If (PI_al_AlreadyCopied{$_l_PurchaseItemIndex}=0)
												PI_al_CopyItemNo{$_l_PurchaseItemIndex}:=1
											End if 
											PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}:=0
										End if 
									: (GEN_at_DropDownMenu=2)
										If (PI_al_AlreadyCopied{$_l_PurchaseItemIndex}=0)
											PI_al_CopyItemNo{$_l_PurchaseItemIndex}:=1
											
										End if 
										PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}:=0
										//Add item to selectionarray
										INSERT IN ARRAY:C227(PI_al_DisplayItem; Size of array:C274(PI_al_DisplayItem)+1; 1)
										INSERT IN ARRAY:C227(PI_at_DProductCode; Size of array:C274(PI_at_DProductCode)+1; 1)
										INSERT IN ARRAY:C227(PI_at_dProductDes; Size of array:C274(PI_at_dProductDes)+1; 1)
										INSERT IN ARRAY:C227(PI_ar_dProductQTY; Size of array:C274(PI_ar_dProductQTY)+1; 1)
										INSERT IN ARRAY:C227(PI_al_dCopyItem; Size of array:C274(PI_al_dCopyItem)+1; 1)
										INSERT IN ARRAY:C227(PI_al_dMarkItem; Size of array:C274(PI_al_dMarkItem)+1; 1)
										$_l_Element:=Size of array:C274(PI_al_DisplayItem)
										PI_al_DisplayItem{$_l_Element}:=$_l_PurchaseItemIndex
										PI_at_DProductCode{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
										PI_at_dProductDes{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
										PI_ar_dProductQTY{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
										PI_al_dCopyItem{$_l_Element}:=PI_al_CopyItemNo{$_l_PurchaseItemIndex}
										PI_al_dMarkItem{$_l_Element}:=PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}
										
										
										
									: (GEN_at_DropDownMenu=3)
										
										PI_al_CopyItemNo{$_l_PurchaseItemIndex}:=0
										
										PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}:=0
										//Add item to selectionarray
										INSERT IN ARRAY:C227(PI_al_DisplayItem; Size of array:C274(PI_al_DisplayItem)+1; 1)
										INSERT IN ARRAY:C227(PI_at_DProductCode; Size of array:C274(PI_at_DProductCode)+1; 1)
										INSERT IN ARRAY:C227(PI_at_dProductDes; Size of array:C274(PI_at_dProductDes)+1; 1)
										INSERT IN ARRAY:C227(PI_ar_dProductQTY; Size of array:C274(PI_ar_dProductQTY)+1; 1)
										INSERT IN ARRAY:C227(PI_al_dCopyItem; Size of array:C274(PI_al_dCopyItem)+1; 1)
										INSERT IN ARRAY:C227(PI_al_dMarkItem; Size of array:C274(PI_al_dMarkItem)+1; 1)
										$_l_Element:=Size of array:C274(PI_al_DisplayItem)
										PI_al_DisplayItem{$_l_Element}:=$_l_PurchaseItemIndex
										PI_at_DProductCode{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
										PI_at_dProductDes{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
										PI_ar_dProductQTY{$_l_Element}:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
										PI_al_dCopyItem{$_l_Element}:=PI_al_CopyItemNo{$_l_PurchaseItemIndex}
										PI_al_dMarkItem{$_l_Element}:=PI_al_MarkItemNumbers{$_l_PurchaseItemIndex}
										
								End case 
								NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
							End for 
							PI_l_Copy:=0
							If (Size of array:C274(PI_al_dMarkItem)>0)
								If (GEN_at_DropDownMenu>1)
									$_bo_Mark:=False:C215
									//Select the items to copy
									$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
									WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); 60; (Screen width:C187/2); 60; -1990)
									
									DIALOG:C40([USER:15]; "PURCH_ItemSelector")
									CLOSE WINDOW:C154
									WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
								Else 
									PI_l_Copy:=1
								End if 
								
								
							End if 
							
						End if 
						If ($_bo_Mark) | (PI_l_Copy=1)
							//TRACE
							UNLOAD RECORD:C212([PURCHASE_ORDERS_ITEMS:169])
							READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
							
							QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
							FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])
							$_l_ItemNumber:=0
							While (Not:C34(End selection:C36([PURCHASE_ORDERS_ITEMS:169])))
								$_l_ItemNumber:=$_l_ItemNumber+1
								$_bo_MarkThisOne:=False:C215
								$_bo_Continue:=False:C215
								If ($_bo_Mark)
									If ([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8="") | ([PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
										
										$_bo_Continue:=True:C214
									End if 
									$_bo_MarkThisOne:=True:C214
								Else 
									$_bo_Mark:=False:C215
									$_l_DIsplayItemROW:=Find in array:C230(PI_al_DisplayItem; $_l_ItemNumber)
									If ($_l_DIsplayItemROW>0)
										If (PI_al_dCopyItem{$_l_DIsplayItemROW}=1)
											$_bo_Continue:=True:C214
											$_bo_MarkThisOne:=(PI_al_dMarkItem{$_l_DIsplayItemROW}=1)
										End if 
									End if 
								End if 
								If (Size of array:C274($_al_SelectedPOItems)>0)
									$_bo_Continue:=($_bo_Continue) & (Find in array:C230($_al_SelectedPOItems; [PURCHASE_ORDERS_ITEMS:169]POitemID:16)>0)
									
								End if 
								If ($_bo_Continue)
									CREATE RECORD:C68([PURCHASE_INVOICE_ITEMS:158])
									[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
									[PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17:=[PURCHASE_INVOICES:37]Purchase_Code:1
									
									[PURCHASE_INVOICE_ITEMS:158]Product_Code:1:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
									[PURCHASE_INVOICE_ITEMS:158]Description:13:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
									[PURCHASE_INVOICE_ITEMS:158]Our_Order_No:11:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
									[PURCHASE_INVOICE_ITEMS:158]Quantity:2:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
									[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=[PURCHASE_ORDERS_ITEMS:169]Price_Per:12
									RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
									[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
									PurItems_ProdAc
									If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
										[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
									Else 
										If (<>PersAnOver)
											[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
										Else 
											If ([PRODUCTS:9]Analysis_Code:18#"")
												[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PRODUCTS:9]Analysis_Code:18
											Else 
												[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[TRANSACTION_TYPES:31]Analysis_Code:7
											End if 
										End if 
									End if 
									[PURCHASE_INVOICE_ITEMS:158]Tax_Code:5:=[PURCHASE_ORDERS_ITEMS:169]Tax_Code:7
									[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
									Purch_ItemCalAm
									Purch_ItemCalc
									If ([PURCHASE_INVOICES:37]Company_Code:2#[PURCHASE_ORDERS:57]Company_Code:1)
										[PURCHASE_INVOICES:37]Company_Code:2:=[PURCHASE_ORDERS:57]Company_Code:1
									End if 
									
									If ($_bo_MarkThisOne)
										//NG this  is not good-the PI number is no unique
										[PURCHASE_ORDERS_ITEMS:169]PurchaseInvoiceItemID:20:=[PURCHASE_INVOICE_ITEMS:158]ID:16
										[PURCHASE_ORDERS_ITEMS:169]PurchaseinvoiceCode:19:=[PURCHASE_INVOICES:37]Purchase_Code:1
										[PURCHASE_ORDERS_ITEMS:169]Purchase_Invoice_Number:8:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
										DB_SaveRecord(->[PURCHASE_ORDERS_ITEMS:169])
										
									End if 
								End if 
								DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
								
								NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
							End while 
							DB_SaveRecord(->[PURCHASE_ORDERS:57])
						End if 
						
					End if 
					If (Count parameters:C259=0)
						NEXT RECORD:C51([PURCHASE_ORDERS:57])
					End if 
					//End while
				End for 
				If ($_bo_Mark)
					If (Count parameters:C259=0)
						READ ONLY:C145([PURCHASE_ORDERS:57])
						UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
					End if 
				End if 
			End if 
		End if 
		//DB_t_CurrentFormUsage:=""
		//Close_ProWin
	Else 
		Gen_Alert("No Purchase Orders found"; "Cancel")
	End if 
End if 
If (Count parameters:C259=0)
	vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
	RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
	vCompName:=[COMPANIES:2]Company_Name:2
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
	Purch_InLPß("S1")
	vTot:=1
End if 
ERR_MethodTrackerReturn("Purchase_PO"; $_t_oldMethodName)
