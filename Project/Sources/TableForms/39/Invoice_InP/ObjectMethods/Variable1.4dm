If (False:C215)
	//object Name: [INVOICES]Invoice_inP.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_OrderIds;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(INV_ar_OrderValues;0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(INV_at_AssignOptions;0)
	//ARRAY TEXT(INV_at_ordersCodes;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoAlert; $_bo_Unload; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_ArraySize; $_l_event; $_l_Index; $_l_NewSIze; $_l_SearchIndex; $_l_WindowReferenceRow; $_l_WindowRow; GEN_l_NameSelected; INV_l_AllocationPage; INV_l_AssignedrecordID; INV_l_AssignedTable)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_REAL:C285(V31; vPay2)
	C_TEXT:C284($_t_oldMethodName; vTitle; vTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoice_inP.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (INV_at_AssignOptions=1)
				If ([INVOICES:39]Company_Code:2#"")
					$_bo_Continue:=True:C214
					$_bo_NoAlert:=False:C215
					If ([INVOICES:39]X_DepositRelatedRecordID:45#0)
						$_bo_Continue:=False:C215
						$_bo_NoAlert:=True:C214
						Gen_Confirm("This deposit is already assigned to an order.  Do you wish to change the order it"+" is assigned to?"; "Yes"; "No")
						If (OK=1)
							$_bo_Continue:=True:C214
						End if 
					End if 
					
					If ($_bo_Continue)
						If (Not:C34($_bo_NoAlert))
							Gen_Confirm("Assign this deposit to an order, this will allow the deposit to be auto-reconcile"+"d when an invoice is raised. You may only use this where the deposit relates to a"+" single order"; "Yes"; "No")
						End if 
						
						If (OK=1)
							//Here the user will find the order
							QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[INVOICES:39]Company_Code:2)
							//```and of course only the ones not already invoiced!
							//RELATE MANY SELECTION([ORDERS]Order Code)
							$_l_ArraySize:=Records in selection:C76([ORDERS:24])
							CREATE SET:C116([ORDERS:24]; "ToSearch")
							CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "FoundItems")
							CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "FoundOneRecord")
							If (False:C215)
								For ($_l_SearchIndex; 1; $_l_ArraySize)
									USE SET:C118("ToSearch")
									GOTO SELECTED RECORD:C245([ORDERS:24]; $_l_SearchIndex)
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
									CREATE SET:C116([ORDER_ITEMS:25]; "FoundOneRecord")
									UNION:C120("FoundItems"; "FoundOneRecord"; "FoundItems")
									
								End for 
							Else 
								ARRAY TEXT:C222($_at_OrderCodes; 0)
								SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
								CREATE SET:C116([ORDER_ITEMS:25]; "FoundItems")
								
							End if 
							USE SET:C118("FoundItems")
							CLEAR SET:C117("FoundOneRecord")
							CLEAR SET:C117("FoundItems")
							CLEAR SET:C117("ToSearch")
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Total_Amount:9>0)
							RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
							//So these are the orders that are available
							If (Records in selection:C76([ORDERS:24])>0)
								ARRAY LONGINT:C221(INV_al_OrderIds; 0)
								ARRAY TEXT:C222(GEN_at_RecordCode; 0)
								ARRAY TEXT:C222(GEN_at_Name; 0)
								
								ARRAY TEXT:C222(INV_at_ordersCodes; 0)
								ARRAY REAL:C219(INV_ar_OrderValues; 0)
								ARRAY TEXT:C222(INV_at_ordersCodes; Records in selection:C76([ORDERS:24]))
								ARRAY REAL:C219(INV_ar_OrderValues; Records in selection:C76([ORDERS:24]))
								ARRAY LONGINT:C221(INV_al_OrderIds; Records in selection:C76([ORDERS:24]))
								$_l_NewSIze:=Records in selection:C76([ORDERS:24])
								ARRAY TEXT:C222(GEN_at_RecordCode; $_l_NewSIze)
								ARRAY TEXT:C222(GEN_at_Name; $_l_NewSIze)
								ARRAY REAL:C219(GEN_ar_Value; $_l_NewSIze)
								
								For ($_l_Index; 1; Records in selection:C76([ORDERS:24]))
									INV_at_ordersCodes{$_l_Index}:=[ORDERS:24]Order_Code:3
									INV_al_OrderIds{$_l_Index}:=[ORDERS:24]x_ID:58
									
									GEN_at_Name{$_l_Index}:=[ORDERS:24]Order_Code:3
									INV_ar_OrderValues{$_l_Index}:=0
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
									QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
									QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
									OrderI_Level0
									//If (◊ZeroInv=False)
									INV_ar_OrderValues{$_l_Index}:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
									//End if
									GEN_at_RecordCode{$_l_Index}:=String:C10(INV_ar_OrderValues{$_l_Index}; "########0.00;-########0.00;0")
									NEXT RECORD:C51([ORDERS:24])
								End for 
								Open_Any_Window(257; 457)
								
								vTitle:="ORDER RELATING"
								vTitle2:="Select an order"
								INV_l_AllocationPage:=2
								V31:=0
								vPay2:=0
								DIALOG:C40([INVOICES:39]; "dAllocation")
								CLOSE WINDOW:C154
								If (WIN_bo_TrackerInited)
									$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
									If ($_l_WindowReferenceRow>0)
										WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
									End if 
								End if 
								
								If (GEN_l_NameSelected>0)
									//Thats the order
									[INVOICES:39]X_DepositRelatedTable:44:=Table:C252(->[ORDERS:24])
									[INVOICES:39]X_DepositRelatedRecordID:45:=INV_al_OrderIds{GEN_l_NameSelected}
									$_bo_Unload:=False:C215
									If ([ORDERS:24]x_ID:58#[INVOICES:39]X_DepositRelatedRecordID:45)
										$_bo_Unload:=True:C214
										QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[INVOICES:39]X_DepositRelatedRecordID:45)
										
									End if 
									
									[INVOICES:39]Currency_Code:27:=[ORDERS:24]Currency_Code:32
									If ([INVOICES:39]Currency_Code:27#"")
										OBJECT SET ENTERABLE:C238([INVOICES:39]Currency_Code:27; False:C215)
									End if 
									If ($_bo_Unload)
										UNLOAD RECORD:C212([ORDERS:24])
									End if 
									
									
									Case of 
										: ([INVOICES:39]Total_Paid:6=0)
											[INVOICES:39]Total_Paid:6:=INV_ar_OrderValues{GEN_l_NameSelected}
										: ([INVOICES:39]Total_Paid:6>INV_ar_OrderValues{GEN_l_NameSelected})
											Gen_Confirm("This deposit is greater than the value of the order are you sure you want to assi"+"g"+"n it"; "No"; "Yes")
											If (OK=1)
												INV_at_AssignOptions:=0
												[INVOICES:39]X_DepositRelatedTable:44:=0
												[INVOICES:39]X_DepositRelatedRecordID:45:=0
												OBJECT SET ENTERABLE:C238([INVOICES:39]Currency_Code:27; True:C214)
											End if 
											
											
									End case 
									INV_l_AssignedrecordID:=[INVOICES:39]X_DepositRelatedRecordID:45
									INV_l_AssignedTable:=[INVOICES:39]X_DepositRelatedTable:44
								End if 
								
							Else 
								Gen_Alert("There are no outstanding orders to assign this deposit to")
								INV_at_AssignOptions:=0
							End if 
							
						End if 
					End if 
					
				Else 
					Gen_Alert("You must identify the company before you can assign this to an order!")
					INV_at_AssignOptions:=0
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ:Invoice_inP,INV_at_AssignOptions"; $_t_oldMethodName)
