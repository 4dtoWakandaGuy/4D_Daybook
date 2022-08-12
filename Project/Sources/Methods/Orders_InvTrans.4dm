//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InvTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2010 17:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>InvTransferDelAddress)
	//C_UNKNOWN(<>OrdersDisTr)
	//C_UNKNOWN(<>PersAnOver)
	//C_UNKNOWN(<>StockPostAu)
	//C_UNKNOWN(<>StockPostIn)
	//C_UNKNOWN(<>StockPostOr)
	//C_UNKNOWN($Layout3)
	//C_UNKNOWN(INV_isUnique)
	//C_UNKNOWN(vAdd)
	//C_UNKNOWN(vDate)
	//C_UNKNOWN(Vdetails)
	//C_UNKNOWN(vIN)
	//C_UNKNOWN(vInvNo)
	//C_UNKNOWN(vNumber)
	//C_UNKNOWN(vTotal)
	C_BOOLEAN:C305(<>InvTransferDelAddress; <>OrdersDisTr; <>PersAnOver; <>StockPostAu; <>StockPostIn; <>StockPostOr; $_bo_Locked; $_bo_OK; <>DB_bo_NewStockActive; $_bo_Locked; $_bo_OK)
	C_DATE:C307($_d_SubscriptionDate; vDate; <>DB_d_CurrentDate; $_d_SubscriptionDate)
	C_LONGINT:C283($_l_Check; $_l_Month; $_l_OrderItemIndex; $_l_PeriodID; $_l_Year; INV_isUnique; INV_l_OrderID; vAdd; vIN; $_l_AddMode; $_l_Check)
	C_LONGINT:C283($_l_Month; $_l_OrderItemIndex; $_l_PeriodID; $_l_Year; INV_l_OrderID)
	C_REAL:C285(INV_R_totalDeposit; vTotal; INV_R_CCDeposit; INV_R_totalDeposit)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; <>SYS_t_BaseCurrency; $_t_Details; $_t_InvoiceNumber; $_t_Num; $_t_oldMethodName; $Layout3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Vdetails)
	C_TEXT:C284(vInvNo; vNumber; WIN_t_CurrentInputForm; <>Per_t_CurrentDefaultAnalCode; <>SYS_t_ACCOpenBalancesStatus; <>SYS_t_BaseCurrency; $_t_Details; $_t_InvoiceNumber; $_t_Num; $_t_oldMethodName; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; INV_t_OrderCode; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InvTrans")
//Project Method Orders_InvTrans /3/2(ID-28264-19958)
//Orders_InvTrans
INV_R_totalDeposit:=0
INV_R_CCDeposit:=0
INV_t_OrderCode:=[ORDERS:24]Order_Code:3
INV_l_OrderID:=[ORDERS:24]x_ID:58


QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (<>SYS_t_ACCOpenBalancesStatus=""))
	
	OK:=1
	$_t_Num:=""
	$_bo_Locked:=False:C215
	If ((vInvNo#"N") & (vInvNo#""))
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vInvNo)
		If (Records in selection:C76([INVOICES:39])>0)
			If (([INVOICES:39]State:10=-1) & (DB_t_CurrentFormUsage="Invoice"))
				Gen_Confirm("Do you want to convert the Proforma into an Invoice?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([INVOICES:39])
					StartTransaction
					//StartTransaction   ` 13/05/02 pb
					
					LOAD RECORD:C52([INVOICES:39])
					FIRST RECORD:C50([ORDER_ITEMS:25])
					[INVOICES:39]State:10:=0
					Inv_No
					If (OK=1)
						If ([ORDER_ITEMS:25]Invoice_Date:25=[INVOICES:39]Invoice_Date:4)
							[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
						Else 
							[INVOICES:39]Invoice_Date:4:=[ORDER_ITEMS:25]Invoice_Date:25
						End if 
						If ([INVOICES:39]Terms:11="")
							[INVOICES:39]Terms:11:=[ORDERS:24]Terms:16
						End if 
						Invoices_DueDat
						[INVOICES:39]Your_Order_Number:14:=[ORDERS:24]Your_Order_Number:10
						vDate:=[INVOICES:39]Invoice_Date:4
						$_l_PeriodID:=Check_Period
						Check_PerCloseI
						[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
						RELATE ONE:C42([INVOICES:39]Company_Code:2)
						Invoices_CredSt
						Invoices_UKEC
						[INVOICES:39]Delivery_Company:30:=[ORDERS:24]Delivery_Company:29
						[INVOICES:39]Delivery_Contact:31:=[ORDERS:24]Delivery_Contact:30
						[INVOICES:39]x_DeliveryAddressID:48:=[ORDERS:24]X_DeliveryAddressID:59
						[INVOICES:39]Deliver_To:32:=[ORDERS:24]Deliver_To:31
						[INVOICES:39]Area_Code:29:=[ORDERS:24]Area_Code:35
						[INVOICES:39]Tax_Rate:28:=[ORDERS:24]Tax_Rate:34
						[INVOICES:39]Person:42:=[ORDERS:24]Person:5
						DB_SaveRecord(->[INVOICES:39])
						If (OK=1)
							While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($_bo_Locked=False:C215))
								If (Locked:C147([ORDER_ITEMS:25]))
									$_bo_Locked:=True:C214
								Else 
									[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
									[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
									[ORDER_ITEMS:25]Item_Locked:16:=True:C214
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								End if 
								NEXT RECORD:C51([ORDER_ITEMS:25])
							End while 
							If ($_bo_Locked)
								Gen_Alert("One or more of the Order Items was locked by another User or Process."+"  The Invoice cannot be produced."; "Cancel")
								OK:=0
							Else 
								vAdd:=0
								ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
								
								Invoices_FileI
								Open_Pro_Window("Check Invoice"; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)
								MODIFY RECORD:C57([INVOICES:39]; *)
								Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)
								If (OK=1) & ([INVOICES:39]Invoice_Number:1#"")
									
									ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
									ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
									OK:=1
								End if 
								
								
							End if 
						End if 
					End if 
					Transact_End
				End if 
			Else 
				Gen_Confirm(DB_t_CurrentFormUsage+" No "+[INVOICES:39]Invoice_Number:1+" has been created.  See it?"; "Yes"; "No")
				If (OK=1)
					vAdd:=0
					ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
					
					Invoices_FileI
					Open_Pro_Window("Check "+DB_t_CurrentFormUsage; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)
					READ WRITE:C146([INVOICES:39])
					MODIFY RECORD:C57([INVOICES:39]; *)
					Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)
					If (OK=1) & ([INVOICES:39]Invoice_Number:1#"")
						ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
						
						ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
					End if 
				Else 
					ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
					ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
				End if 
			End if 
			OK:=0
		End if 
	End if 
	If (OK=1)
		If ([ORDERS:24]Analysis_Code:33#[ANALYSES:36]Analysis_Code:1)
			RELATE ONE:C42([ORDERS:24]Analysis_Code:33)
		End if 
		READ WRITE:C146([INVOICES:39])
		If (DB_t_CurrentFormUsage2#"NoMod")
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
		End if 
		If ((vInvNo="N") | (vInvNo=""))
			vNumber:=""
			While ((Records in selection:C76([INVOICES:39])>0) | (vNumber=""))
				If (DB_t_CurrentFormUsage="Proforma")
					
					If ([ANALYSES:36]Record_Number_Start:10>0)
						Repeat 
							vNumber:=[ANALYSES:36]Analysis_Code:1+"/"+"P"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+19; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/"+"P")
							SET QUERY DESTINATION:C396(3; INV_isUnique)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
							SET QUERY DESTINATION:C396(0)
						Until (INV_isUnique=0)
					Else 
						
						Repeat 
							vNumber:="P"+Gen_CodePref(19; ->[INVOICES:39]Invoice_Number:1; "P")
							SET QUERY DESTINATION:C396(3; INV_isUnique)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
							SET QUERY DESTINATION:C396(0)
						Until (INV_isUnique=0)
					End if 
					
				Else 
					If (vTotal>=0)
						
						If ([ANALYSES:36]Record_Number_Start:10>0)
							Repeat 
								vNumber:=[ANALYSES:36]Analysis_Code:1+"/"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+4; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/")
								SET QUERY DESTINATION:C396(3; INV_isUnique)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
								SET QUERY DESTINATION:C396(0)
							Until (INV_isUnique=0)
						Else 
							
							Repeat 
								vNumber:=Gen_CodePref(4; ->[INVOICES:39]Invoice_Number:1)
								SET QUERY DESTINATION:C396(3; INV_isUnique)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
								SET QUERY DESTINATION:C396(0)
							Until (INV_isUnique=0)
						End if 
						
					Else 
						
						If ([ANALYSES:36]Record_Number_Start:10>0)
							Repeat 
								vNumber:=[ANALYSES:36]Analysis_Code:1+"/"+"C"+Gen_CodePref([ANALYSES:36]Record_Number_Start:10+25; ->[INVOICES:39]Invoice_Number:1; [ANALYSES:36]Analysis_Code:1+"/"+"C")
								
								SET QUERY DESTINATION:C396(3; INV_isUnique)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
								SET QUERY DESTINATION:C396(0)
							Until (INV_isUnique=0)
							
						Else 
							Repeat 
								vNumber:="C"+Gen_CodePref(25; ->[INVOICES:39]Invoice_Number:1; "C")
								SET QUERY DESTINATION:C396(3; INV_isUnique)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
								SET QUERY DESTINATION:C396(0)
							Until (INV_isUnique=0)
						End if 
						
					End if 
				End if 
				If (OK=1)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
				End if 
			End while 
			If (vNumber="0")
				OK:=0
			End if 
			$_t_Num:=vNumber
			If (OK=1)
				CREATE RECORD:C68([INVOICES:39])
				[INVOICES:39]Invoice_Number:1:=vNumber
			End if 
		Else 
			CREATE RECORD:C68([INVOICES:39])
			[INVOICES:39]Invoice_Number:1:=vInvNo
		End if 
		If (OK=1)
			ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
			FIRST RECORD:C50([ORDER_ITEMS:25])
			[INVOICES:39]Company_Code:2:=[ORDERS:24]Company_Code:1
			[INVOICES:39]Contact_Code:3:=[ORDERS:24]Contact_Code:2
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			[INVOICES:39]Delivery_Company:30:=[ORDERS:24]Delivery_Company:29
			[INVOICES:39]Delivery_Contact:31:=[ORDERS:24]Delivery_Contact:30
			[INVOICES:39]Deliver_To:32:=[ORDERS:24]Deliver_To:31
			$_bo_OK:=Invoice_TransCo
			If ($_bo_OK)
				<>InvTransferDelAddress:=True:C214  // So we can preference this later
				If (<>InvTransferDelAddress)
					If ([INVOICES:39]Delivery_Company:30="") & ([INVOICES:39]Delivery_Contact:31="") & ([INVOICES:39]Deliver_To:32="")
						If ([INVOICES:39]Company_Code:2=[ORDERS:24]Company_Code:1)
							//This is the same company
							If ([COMPANIES:2]Company_Code:1#[INVOICES:39]Company_Code:2)
								QUERY:C277([COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
							End if 
							If ([COMPANIES:2]Invoice_Address_Line_One:18#"") | ([COMPANIES:2]Invoice_Address_Line_Two:19#"") | ([COMPANIES:2]Invoice_Country:23#"") | ([COMPANIES:2]Invoice_County:21#"")
								//The invoice will print to the invoice address
								$_t_Details:=Vdetails
								VDetails:=""
								Address_Details
								[INVOICES:39]Deliver_To:32:=VDetails
								Vdetails:=$_t_Details
							End if 
						Else 
							//This invoice is invoiced to a superior
							//The invoice will print to the invoice address
							If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
								QUERY:C277([COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
							End if 
							
							$_t_Details:=Vdetails
							VDetails:=""
							Address_Details
							[INVOICES:39]Deliver_To:32:=VDetails
							Vdetails:=$_t_Details
						End if 
						
					End if 
				End if 
				If ([ORDER_ITEMS:25]Invoice_Date:25=!00-00-00!)
					[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
				Else 
					[INVOICES:39]Invoice_Date:4:=[ORDER_ITEMS:25]Invoice_Date:25
				End if 
				If ([ORDERS:24]Terms:16="")
					Invoices_DefTer
				Else 
					[INVOICES:39]Terms:11:=[ORDERS:24]Terms:16
				End if 
				Invoices_UKEC
				Invoices_DueDat
				[INVOICES:39]Your_Order_Number:14:=[ORDERS:24]Your_Order_Number:10
				[INVOICES:39]Comments:12:=[ORDERS:24]Comments:14
				[INVOICES:39]Print_Comments:25:=[ORDERS:24]Print_Comments:44
				vDate:=[INVOICES:39]Invoice_Date:4
				$_l_PeriodID:=Check_Period
				Check_PerCloseI
				[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
				QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
				[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
				
				If (DB_t_CurrentFormUsage="Proforma")
					[INVOICES:39]State:10:=-1
				Else 
					Invoices_CredSt
				End if 
				If ([ORDERS:24]Currency_Code:32#"")
					[INVOICES:39]Currency_Code:27:=[ORDERS:24]Currency_Code:32
				Else 
					[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
				End if 
				If (([ORDERS:24]Analysis_Code:33="") & (<>PersAnOver))
					[INVOICES:39]Analysis_Code:17:=<>Per_t_CurrentDefaultAnalCode
				Else 
					[INVOICES:39]Analysis_Code:17:=[ORDERS:24]Analysis_Code:33
				End if 
				If ([ORDERS:24]Layer_Code:47#"")
					[INVOICES:39]Layer_Code:38:=[ORDERS:24]Layer_Code:47
				Else 
					[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
				End if 
				[INVOICES:39]Area_Code:29:=[ORDERS:24]Area_Code:35
				[INVOICES:39]Tax_Rate:28:=[ORDERS:24]Tax_Rate:34
				[INVOICES:39]Person:42:=[ORDERS:24]Person:5
				vTotal:=0
				$_l_Check:=0
				
				
				
				While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & ($_bo_Locked=False:C215))
					If (Locked:C147([ORDER_ITEMS:25]))
						$_bo_Locked:=True:C214
					Else 
						CREATE RECORD:C68([INVOICES_ITEMS:161])
						[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
						[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
						
						[INVOICES_ITEMS:161]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
						[INVOICES_ITEMS:161]Product_Name:2:=[ORDER_ITEMS:25]Product_Name:13
						If ((<>OrdersDisTr) & ([ORDER_ITEMS:25]Discount:37#0))
							[INVOICES_ITEMS:161]Product_Name:2:=[INVOICES_ITEMS:161]Product_Name:2+" @ "+String:C10([ORDER_ITEMS:25]Discount:37)+"% Discount"
						End if 
						[INVOICES_ITEMS:161]Print_Description:14:=[ORDER_ITEMS:25]Print_Description:45
						[INVOICES_ITEMS:161]Description:13:=[ORDER_ITEMS:25]Description:44
						[INVOICES_ITEMS:161]Sales_Price:4:=[ORDER_ITEMS:25]Sales_Price:4
						[INVOICES_ITEMS:161]Tax_Code:6:=[ORDER_ITEMS:25]Tax_Code:12
						If ([INVOICES_ITEMS:161]Tax_Code:6="")
							[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
						End if 
						[INVOICES_ITEMS:161]Price_Per:16:=[ORDER_ITEMS:25]Price_Per:50
						If ([INVOICES_ITEMS:161]Price_Per:16=0)
							[INVOICES_ITEMS:161]Price_Per:16:=1
						End if 
						RELATE ONE:C42([INVOICES_ITEMS:161]Product_Code:1)
						
						If ([ORDER_ITEMS:25]Invoice_Number:17="SUBS")  //If is a Subscriptions Order Item
							[INVOICES_ITEMS:161]Quantity:3:=[ORDER_ITEMS:25]Quantity:3
							USE SET:C118("AMaster")
							QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27; *)
							QUERY SELECTION:C341([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Invoice_Number:10="")
							MESSAGES OFF:C175
							ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
							MESSAGES ON:C181
							[INVOICES_ITEMS:161]Amount:5:=[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8
							If ([INVOICES_ITEMS:161]Quantity:3#0)
								//            [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/
								//([INVOICES_ITEMS]Quantity/[INVOICES_ITEMS]Price Per));2;1)
								[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; DivideBy([INVOICES_ITEMS:161]Quantity:3; [INVOICES_ITEMS:161]Price_Per:16)); 2; 1)  // 17/02/04 pb
							Else 
								[INVOICES_ITEMS:161]Sales_Price:4:=[INVOICES_ITEMS:161]Amount:5
							End if 
							Inv_ItemCalc
							If ([SUBSCRIPTIONS:93]Product_Name:2#"")
								If ([SUBSCRIPTIONS:93]Product_Name:2="+@")
									[INVOICES_ITEMS:161]Product_Name:2:=[INVOICES_ITEMS:161]Product_Name:2+Substring:C12([SUBSCRIPTIONS:93]Product_Name:2; 2; 32000)
								Else 
									[INVOICES_ITEMS:161]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2
								End if 
							End if 
							[SUBSCRIPTIONS:93]Invoice_Number:10:=[INVOICES:39]Invoice_Number:1
							[SUBSCRIPTIONS:93]Date_Done:9:=[INVOICES:39]Invoice_Date:4
							DB_SaveRecord(->[SUBSCRIPTIONS:93])
							AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
							
							//for perpetual ones
							If (Records in selection:C76([SUBSCRIPTIONS:93])=1)
								If ([PRODUCTS:9]Subscription_Perpetual:41)
									DUPLICATE RECORD:C225([SUBSCRIPTIONS:93])
									[SUBSCRIPTIONS:93]x_ID:11:=0
									
									[SUBSCRIPTIONS:93]Date_Done:9:=!00-00-00!
									[SUBSCRIPTIONS:93]Invoice_Number:10:=""
									$_d_SubscriptionDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
									Case of 
										: ([SUBSCRIPTIONS:93]Unit_Number:6=31)
											$_l_Month:=Month of:C24($_d_SubscriptionDate)+[SUBSCRIPTIONS:93]After_Number:5
											$_l_Year:=Year of:C25($_d_SubscriptionDate)
											If ($_l_Month>12)
												If ($_l_Month>24)
													If ($_l_Month>36)
														$_l_Month:=$_l_Month-36
														$_l_Year:=$_l_Year+3
													Else 
														$_l_Month:=$_l_Month-24
														$_l_Year:=$_l_Year+2
													End if 
												Else 
													$_l_Month:=$_l_Month-12
													$_l_Year:=$_l_Year+1
												End if 
											Else 
												If ($_l_Month<1)
													$_l_Month:=$_l_Month+12
													$_l_Year:=$_l_Year-1
												End if 
											End if 
											[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_SubscriptionDate); $_l_Month; $_l_Year)
										: ([SUBSCRIPTIONS:93]Unit_Number:6=365)
											$_l_Year:=Year of:C25($_d_SubscriptionDate)+[SUBSCRIPTIONS:93]After_Number:5
											[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_SubscriptionDate); Month of:C24($_d_SubscriptionDate); $_l_Year)
										Else 
											[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_SubscriptionDate+([SUBSCRIPTIONS:93]After_Number:5*[SUBSCRIPTIONS:93]Unit_Number:6)
									End case 
									DB_SaveRecord(->[SUBSCRIPTIONS:93])
									AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
								End if 
							End if 
							
						Else 
							
							If (DB_t_CurrentFormUsage2="Alloc")  //If have chosen Allocated only
								If ([PRODUCTS:9]Maintain_Stock:14)
									[INVOICES_ITEMS:161]Quantity:3:=[ORDER_ITEMS:25]Allocated:28
								Else 
									[INVOICES_ITEMS:161]Quantity:3:=[ORDER_ITEMS:25]Quantity:3
								End if 
								Inv_ItemCalAm
								Inv_ItemCalc
							Else 
								[INVOICES_ITEMS:161]Quantity:3:=[ORDER_ITEMS:25]Quantity:3
								[INVOICES_ITEMS:161]Amount:5:=[ORDER_ITEMS:25]Sales_Amount:7
								[INVOICES_ITEMS:161]Tax_Amount:7:=[ORDER_ITEMS:25]TAX_Amount:8
								[INVOICES_ITEMS:161]Total_Amount:8:=[ORDER_ITEMS:25]Total_Amount:9
							End if 
						End if 
						
						
						
						
						If (([PRODUCTS:9]Sales_Account:7#"") & (Records in selection:C76([PRODUCTS:9])=1))
							If ((([TRANSACTION_TYPES:31]C_Range_F:11="") & ([TRANSACTION_TYPES:31]C_Range_T:12="")) | ([TRANSACTION_TYPES:31]C_Enforce:14=False:C215) | (([PRODUCTS:9]Sales_Account:7>=[TRANSACTION_TYPES:31]C_Range_F:11) & ([PRODUCTS:9]Sales_Account:7<=[TRANSACTION_TYPES:31]C_Range_T:12)))
								RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
								If (Records in selection:C76([ACCOUNTS:32])>0)
									[INVOICES_ITEMS:161]Sales_Account:9:=[PRODUCTS:9]Sales_Account:7
								Else 
									[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
								End if 
							Else 
								[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
								$_l_Check:=1
							End if 
						Else 
							[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
							$_l_Check:=1
						End if 
						
						If (([INVOICES:39]Analysis_Code:17#"") & ([INVOICES:39]Analysis_Code:17=[ORDERS:24]Analysis_Code:33))
							[INVOICES_ITEMS:161]Analysis_Code:10:=[INVOICES:39]Analysis_Code:17
						Else 
							If (<>PersAnOver)
								[INVOICES_ITEMS:161]Analysis_Code:10:=<>Per_t_CurrentDefaultAnalCode
							Else 
								If ([PRODUCTS:9]Analysis_Code:18#"")
									RELATE ONE:C42([PRODUCTS:9]Analysis_Code:18)
									If (Records in selection:C76([ANALYSES:36])>0)
										[INVOICES_ITEMS:161]Analysis_Code:10:=[PRODUCTS:9]Analysis_Code:18
									Else 
										[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
									End if 
								Else 
									[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
								End if 
							End if 
							If ([INVOICES:39]Analysis_Code:17="")
								[INVOICES:39]Analysis_Code:17:=[INVOICES_ITEMS:161]Analysis_Code:10
							End if 
						End if 
						[INVOICES_ITEMS:161]Order_Code:11:=[ORDERS:24]Order_Code:3
						[INVOICES_ITEMS:161]Item_Number:12:=[ORDER_ITEMS:25]Item_Number:27
						[INVOICES_ITEMS:161]Cost_Amount:15:=[ORDER_ITEMS:25]Cost_Amount:15
						
						vTotal:=vTotal+[INVOICES_ITEMS:161]Total_Amount:8
						
						If ([ORDER_ITEMS:25]Invoice_Number:17#"SUBS")
							[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
							[ORDER_ITEMS:25]Item_Locked:16:=True:C214  //added 15/10/08 v631b120 (See comment a few lines down)
						End if 
						[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
						//TRACE
						//kmw - 15/10/08 v631b120 - NOTE: I am unsure...
						//... of the purpose of the following line but there is a problem...
						//... in that this means "locked" does not get set when invoices...
						//... are generated via "Batch Invoice Orders"...this is due to DB_t_CurrentFormUsage...
						//... being "Print" by this stage. Due to uncertainly in the logic...
						//...behind why it is doing this check I have left it in for the time being...
						//...but added "[ORDER ITEMS]Item_Locked:=True" above as well.
						If (DB_t_CurrentFormUsage="Invoice")
							[ORDER_ITEMS:25]Item_Locked:16:=True:C214
						End if 
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End if 
					DB_SaveRecord(->[INVOICES_ITEMS:161])
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
				Invoices_Tot
				DB_SaveRecord(->[INVOICES:39])
				If (OK=1)
					If ($_bo_Locked)
						Gen_Alert("One or more of the Order Items was locked by another User or Process."+"  The Invoice cannot be produced."; "Cancel")
						OK:=0
						Transact_End
					Else 
						If (DB_t_CurrentFormUsage2#"NoMod")
							If ($_l_Check=1)
								vIN:=1
								$_l_AddMode:=Vadd
								vAdd:=1
								ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
								$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
								CREATE SET:C116([ORDER_ITEMS:25]; "$INVOICEDITEMS")
								Invoices_FileI
								Open_Pro_Window("Check "+DB_t_CurrentFormUsage)
								MODIFY RECORD:C57([INVOICES:39]; *)
								If (ok=1)
									ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
									ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
									OK:=1
								End if 
								Transact_End
								Close_ProWin
								Vadd:=$_l_AddMode
								USE SET:C118("$INVOICEDITEMS")
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
								
								If (Records in selection:C76([INVOICES:39])=0)  //THIS IS A SAFETY CHECK
									For ($_l_OrderItemIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
										If ([ORDER_ITEMS:25]Invoice_Number:17#"SUBS")
											[ORDER_ITEMS:25]Invoice_Number:17:=""
											[ORDER_ITEMS:25]Item_Locked:16:=False:C215
										End if 
										[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
										
										DB_SaveRecord(->[ORDER_ITEMS:25])
										NEXT RECORD:C51([ORDER_ITEMS:25])
									End for 
								End if 
							Else 
								Gen_Confirm("Do you want to check the "+DB_t_CurrentFormUsage+" No "+[INVOICES:39]Invoice_Number:1+" before printing?"+Char:C90(13)+Char:C90(13)+"Created from Order "+[ORDERS:24]Order_Code:3+Char:C90(13)+"Company "+[ORDERS:24]Company_Code:1; "Check"; "Print")
								Invoices_FileI
								If (OK=0)
									$_l_AddMode:=Vadd
									vAdd:=1
									$Layout3:=DB_t_CurrentFormUsage3
									DB_t_CurrentFormUsage3:="NoAcc"
									Invoices_PPrint
									DB_t_CurrentFormUsage3:=$Layout3
									
									ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
									ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
									OK:=1
									Transact_End
									Vadd:=$_l_AddMode
								Else 
									vIN:=1
									$_l_AddMode:=Vadd
									vAdd:=1
									ORD_INV_Deposited([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; ->INV_R_totalDeposit; ->INV_R_CCDeposit)
									$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
									CREATE SET:C116([ORDER_ITEMS:25]; "$INVOICEDITEMS")
									Open_Pro_Window("Check "+DB_t_CurrentFormUsage)
									MODIFY RECORD:C57([INVOICES:39]; *)
									If (ok=1)
										ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
										ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
										OK:=1
									End if 
									Transact_End
									Close_ProWin
									Vadd:=$_l_AddMode
									USE SET:C118("$INVOICEDITEMS")
									QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
									
									If (Records in selection:C76([INVOICES:39])=0)  //THIS IS A SAFETY CHECK
										For ($_l_OrderItemIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
											If ([ORDER_ITEMS:25]Invoice_Number:17#"SUBS")
												[ORDER_ITEMS:25]Invoice_Number:17:=""
												[ORDER_ITEMS:25]Item_Locked:16:=False:C215
											End if 
											[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
											
											DB_SaveRecord(->[ORDER_ITEMS:25])
											NEXT RECORD:C51([ORDER_ITEMS:25])
										End for 
									End if 
								End if 
							End if 
							
							If ((OK=1) & (DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostIn) & (<>StockPostOr) & ([INVOICES:39]State:10#0))
								If (OrdDel_CheckNec)
									If (<>StockPostAu=False:C215)
										Gen_Confirm("Do you want to post Invoice No "+[INVOICES:39]Invoice_Number:1+" as a Delivery-Type Stock Movement?"; "Yes"; "No")
									End if 
									If (OK=1)
										FIRST RECORD:C50([ORDER_ITEMS:25])
										RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
										If (<>DB_bo_NewStockActive)
											STK_OrderItemsDeliver(False:C215)  //note this will not post delivery movements for items that have already posted
										Else 
											OrdDel_StockP
										End if 
									End if 
								End if 
							End if 
						Else 
							ORD_invDepositPayment([ORDERS:24]x_ID:58; [INVOICES:39]Invoice_Number:1; [INVOICES:39]Total_Invoiced:5)
							ORD_InvCCPayment([ORDERS:24]x_ID:58; [ORDERS:24]Order_Code:3; [INVOICES:39]Invoice_Number:1)
							OK:=1
						End if 
						//here we can check for a deposit
						
						
						
					End if 
				Else 
					Transact_End
				End if 
			Else 
				Transact_End(False:C215)
				
			End if 
		Else 
			Transact_End
		End if 
	End if 
	DB_t_CurrentFormUsage:=""
	vIN:=0
	
	CCM_LoadOrderAuths([ORDERS:24]x_ID:58; False:C215)
	READ WRITE:C146([ORDERS:24])
	READ WRITE:C146([ORDER_ITEMS:25])
	//UNLOAD RECORD([INVOICES])
Else 
	Gen_Alert("Required Setups have not been completed"; "")
End if 
INV_R_totalDeposit:=0
INV_R_CCDeposit:=0
ERR_MethodTrackerReturn("Orders_InvTrans"; $_t_oldMethodName)
