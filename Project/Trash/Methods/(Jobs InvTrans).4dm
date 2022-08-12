//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InvTrans
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
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>PersAnOver; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_OK; $_l_PeriodID; $_l_WindowReferenceRow; $Check; $Extra; ch0; ch1; ch2; iCancel; INV_isUnique; iOK)
	C_LONGINT:C283(r0; r1; r2; r3; s1; vAct1; vAct2; vAdd; vIN; WIN_l_CurrentWinRef)
	C_REAL:C285(vTot; vTotal)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_ACCOpenBalancesStatus; <>SYS_t_BaseCurrency; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvNo; vNumber; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InvTrans")
//Project Method Jobs_InvTrans 26/3/2(ID 32232-16152)

//Jobs_InvTrans

QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (<>SYS_t_ACCOpenBalancesStatus=""))
	
	OK:=1
	vAct2:=1
	If ((vInvNo#"N") & (vInvNo#""))
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vInvNo)
		If (Records in selection:C76([INVOICES:39])>0)
			If ((vInvNo="P@") & (DB_t_CurrentFormUsage="Invoice"))
				Gen_Confirm("Do you want to convert the Proforma into an Invoice?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([INVOICES:39])
					READ WRITE:C146([JOB_STAGES:47])
					READ WRITE:C146([ORDER_ITEMS:25])
					//  START TRANSACTION
					StartTransaction  // 13/05/02 pb
					
					LOAD RECORD:C52([INVOICES:39])
					FIRST RECORD:C50([ORDER_ITEMS:25])
					[INVOICES:39]State:10:=0
					Inv_No
					If (OK=1)
						If (([ORDER_ITEMS:25]Invoice_Date:25=[INVOICES:39]Invoice_Date:4) | (Records in selection:C76([ORDER_ITEMS:25])=0))
							[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
						Else 
							[INVOICES:39]Invoice_Date:4:=[ORDER_ITEMS:25]Invoice_Date:25
						End if 
						If ([INVOICES:39]Terms:11="")
							[INVOICES:39]Terms:11:=[JOBS:26]Terms:14
						End if 
						Invoices_DueDat
						[INVOICES:39]Your_Order_Number:14:=[JOBS:26]Your_Order_Number:5
						vDate:=[INVOICES:39]Invoice_Date:4
						
						$_l_PeriodID:=Check_Period
						Check_PerCloseI
						[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
						RELATE ONE:C42([INVOICES:39]Company_Code:2)
						Invoices_CredSt
						Invoices_UKEC
						[INVOICES:39]Person:42:=[JOBS:26]Person:19
						DB_SaveRecord(->[INVOICES:39])
						If (OK=1)
							While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
								[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
								[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
								[ORDER_ITEMS:25]Item_Locked:16:=True:C214
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
								NEXT RECORD:C51([ORDER_ITEMS:25])
							End while 
							While (Not:C34(End selection:C36([JOB_STAGES:47])))
								[JOB_STAGES:47]Invoice_Number:10:=[INVOICES:39]Invoice_Number:1
								// [job stages]Invoice Date:=[INVOICES]Invoice Date
								[JOB_STAGES:47]JS_Locked:16:=True:C214
								DB_SaveRecord(->[JOB_STAGES:47])
								NEXT RECORD:C51([JOB_STAGES:47])
							End while 
							vAdd:=0
							Invoices_FileI
							Open_Pro_Window("Check Invoice"; 0; 2; ->[INVOICES:39]; WIN_t_CurrentInputForm)
							MODIFY RECORD:C57([INVOICES:39]; *)
							Close_ProWin(Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm)
						End if 
					End if 
					Transact_End
				End if 
			Else 
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				Gen_Confirm("That "+DB_t_CurrentFormUsage+" has been created.  View it?"; "Yes"; "No")
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				If (OK=1)
					vAdd:=0
					Invoices_FileI
					Open_Pro_Window("Check "+DB_t_CurrentFormUsage)
					READ WRITE:C146([INVOICES:39])
					MODIFY RECORD:C57([INVOICES:39]; *)
					Close_ProWin
				End if 
			End if 
			OK:=0
		End if 
	End if 
	If (OK=1)
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		Open_Any_Window(222; 361)
		DIALOG:C40([JOBS:26]; "dAsk Inv")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		OK:=1
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
		If ($_l_OK=1)
			If ((ch2=0) | (r3=0))
				READ WRITE:C146([INVOICES:39])
				//  START TRANSACTION
				StartTransaction  // 13/05/02 pb
				
				
				If ((vInvNo="N") | (vInvNo=""))
					vNumber:=""
					While ((Records in selection:C76([INVOICES:39])>0) | (vNumber=""))
						If (DB_t_CurrentFormUsage="Proforma")
							Repeat 
								vNumber:="P"+Gen_CodePref(19; ->[INVOICES:39]Invoice_Number:1; "P")
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
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vNumber)
					End while 
					If (vNumber="0")
						OK:=0
					End if 
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
					[INVOICES:39]Company_Code:2:=[JOBS:26]Company_Code:3
					RELATE ONE:C42([INVOICES:39]Company_Code:2)
					Invoice_TransCo
					[INVOICES:39]Contact_Code:3:=[JOBS:26]Contact_Code:4
					If ([ORDER_ITEMS:25]Invoice_Date:25=!00-00-00!)
						[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
					Else 
						[INVOICES:39]Invoice_Date:4:=[ORDER_ITEMS:25]Invoice_Date:25
					End if 
					If ([JOBS:26]Terms:14="")
						Invoices_DefTer
					Else 
						[INVOICES:39]Terms:11:=[JOBS:26]Terms:14
					End if 
					Invoices_UKEC
					Invoices_DueDat
					[INVOICES:39]Your_Order_Number:14:=[JOBS:26]Your_Order_Number:5
					[INVOICES:39]Comments:12:="Job:  "+[JOBS:26]Job_Code:1+"  "+[JOBS:26]Job_Name:2+Char:C90(13)+Char:C90(13)
					If ([JOBS:26]Print_Comments:48)
						[INVOICES:39]Comments:12:=[INVOICES:39]Comments:12+[JOBS:26]Comments:15
					End if 
					[INVOICES:39]Print_Comments:25:=True:C214
					vDate:=[INVOICES:39]Invoice_Date:4
					Check_Period
					Check_PerCloseI
					[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
					QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
					[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
					If (DB_t_CurrentFormUsage="Proforma")
						[INVOICES:39]State:10:=-1
					Else 
						Invoices_CredSt
					End if 
					If (([JOBS:26]Analysis_Code:24="") & (<>PersAnOver))
						[INVOICES:39]Analysis_Code:17:=<>Per_t_CurrentDefaultAnalCode
					Else 
						[INVOICES:39]Analysis_Code:17:=[JOBS:26]Analysis_Code:24
					End if 
					If ([ORDERS:24]Currency_Code:32#"")
						[INVOICES:39]Currency_Code:27:=[JOBS:26]Currency_Code:25
					Else 
						[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
					End if 
					If ([ORDERS:24]Layer_Code:47#"")
						[INVOICES:39]Layer_Code:38:=[JOBS:26]Layer_Code:26
					Else 
						[INVOICES:39]Layer_Code:38:=DB_GetLedgerActualLayer
					End if 
					[INVOICES:39]Booking_Code:24:=[JOBS:26]Job_Code:1
					[INVOICES:39]Person:42:=[JOBS:26]Person:19
					
					vTotal:=0
					$check:=0
					CREATE SET:C116([ORDER_ITEMS:25]; "Items")
					$extra:=0
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					
					If (r3=0)
						FIRST RECORD:C50([JOB_STAGES:47])
						While (Not:C34(End selection:C36([JOB_STAGES:47])))
							If ((Records in selection:C76([INVOICES_ITEMS:161])>0) & ($extra=1))
								CREATE RECORD:C68([INVOICES_ITEMS:161])
								[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
								[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
							End if 
							CREATE RECORD:C68([INVOICES_ITEMS:161])
							[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
							[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
							
							[INVOICES_ITEMS:161]Price_Per:16:=1
							[INVOICES_ITEMS:161]Product_Code:1:=[JOB_STAGES:47]Stage_Code:2
							[INVOICES_ITEMS:161]Product_Name:2:=[JOB_STAGES:47]Stage_Name:3
							[INVOICES_ITEMS:161]Description:13:=[JOB_STAGES:47]Description:48
							[INVOICES_ITEMS:161]Print_Description:14:=[JOB_STAGES:47]Print_Description:49
							[INVOICES_ITEMS:161]Tax_Code:6:=[JOB_STAGES:47]TAX_Code:14
							If ([INVOICES_ITEMS:161]Tax_Code:6="")
								[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
							End if 
							RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
							
							If ((vAct1=1) & (r1=0))  //If Incl Costs without printing & not chosen Budget
								USE SET:C118("Items")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
								FIRST RECORD:C50([ORDER_ITEMS:25])
								While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
									[ORDER_ITEMS:25]Invoice_Number:17:=[INVOICES:39]Invoice_Number:1
									[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
									[ORDER_ITEMS:25]Item_Locked:16:=True:C214
									DB_SaveRecord(->[ORDER_ITEMS:25])
									AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
									NEXT RECORD:C51([ORDER_ITEMS:25])
								End while 
							End if 
							
							Case of 
								: (r0=1)
									[INVOICES_ITEMS:161]Quantity:3:=[JOB_STAGES:47]JS_Quoted_Qty:46
									If (vAct1=1)
										[INVOICES_ITEMS:161]Amount:5:=Gen_Round(([JOB_STAGES:47]AS_Quoted_Amount:7+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
										//     [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/
										//[INVOICES_ITEMS]Quantity);2;1)
										[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; [INVOICES_ITEMS:161]Quantity:3); 2; 1)  // 17/02/04 pb
									Else 
										[INVOICES_ITEMS:161]Amount:5:=[JOB_STAGES:47]AS_Quoted_Amount:7
										[INVOICES_ITEMS:161]Sales_Price:4:=[JOB_STAGES:47]JS_Quoted_Price:47
									End if 
								: (r1=1)
									If (vAct1=1)
										[INVOICES_ITEMS:161]Quantity:3:=1
										If (s1=1)
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round(([JOB_STAGES:47]AT_Budget_Sales_Amount:8); 2; 2)  //+[JOB STAGES]JC Bud Sales Am);2)
										Else 
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round(([JOB_STAGES:47]JT_Budget_Cost_Amount:30); 2; 2)  //+[JOB STAGES]JC Bud Cost Am);2)
										End if 
										[INVOICES_ITEMS:161]Sales_Price:4:=[INVOICES_ITEMS:161]Amount:5
									Else 
										[INVOICES_ITEMS:161]Quantity:3:=[JOB_STAGES:47]JT_Budget_Units:4
										If (s1=1)
											[INVOICES_ITEMS:161]Amount:5:=[JOB_STAGES:47]AT_Budget_Sales_Amount:8
										Else 
											[INVOICES_ITEMS:161]Amount:5:=[JOB_STAGES:47]JT_Budget_Cost_Amount:30
										End if 
										//  [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/
										//[INVOICES_ITEMS]Quantity);2;1)
										[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; [INVOICES_ITEMS:161]Quantity:3); 2; 1)  // 17/02/04 pb
									End if 
								: (r2=1)
									If (vAct1=1)
										[INVOICES_ITEMS:161]Quantity:3:=1
										If (s1=1)
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round(([JOB_STAGES:47]JT_Actual_Sales_Amount:6+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
										Else 
											[INVOICES_ITEMS:161]Amount:5:=Gen_Round(([JOB_STAGES:47]JT_Actual_Cost_Amount:29+Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
										End if 
										[INVOICES_ITEMS:161]Sales_Price:4:=[INVOICES_ITEMS:161]Amount:5
									Else 
										[INVOICES_ITEMS:161]Quantity:3:=[JOB_STAGES:47]AT_Actual_Units:5
										If (s1=1)
											[INVOICES_ITEMS:161]Amount:5:=[JOB_STAGES:47]JT_Actual_Sales_Amount:6
										Else 
											[INVOICES_ITEMS:161]Amount:5:=[JOB_STAGES:47]JT_Actual_Cost_Amount:29
										End if 
										//    [INVOICES_ITEMS]Sales Price:=Gen_Round (([INVOICES_ITEMS]Amount/
										//[INVOICES_ITEMS]Quantity);2;1)
										[INVOICES_ITEMS:161]Sales_Price:4:=Gen_Round(DivideBy([INVOICES_ITEMS:161]Amount:5; [INVOICES_ITEMS:161]Quantity:3); 2; 1)  // 17/02/04 pb
									End if 
							End case 
							[INVOICES_ITEMS:161]Tax_Amount:7:=Gen_Round(([INVOICES_ITEMS:161]Amount:5*([TAX_CODES:35]Tax_Rate:3/100)); 2; 2)
							[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round(([INVOICES_ITEMS:161]Amount:5+[INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
							RELATE ONE:C42([JOB_STAGES:47]Stage_Code:2)
							If ([STAGES:45]Sales_Account:3#"")
								[INVOICES_ITEMS:161]Sales_Account:9:=[STAGES:45]Sales_Account:3
							Else 
								[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
								$check:=1
							End if 
							If ([JOBS:26]Analysis_Code:24#"")
								[INVOICES_ITEMS:161]Analysis_Code:10:=[JOBS:26]Analysis_Code:24
							Else 
								If (<>PersAnOver)
									[INVOICES_ITEMS:161]Analysis_Code:10:=<>Per_t_CurrentDefaultAnalCode
								Else 
									If ([STAGES:45]Analysis_Code:4#"")
										[INVOICES_ITEMS:161]Analysis_Code:10:=[STAGES:45]Analysis_Code:4
									Else 
										[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
									End if 
								End if 
							End if 
							If ([INVOICES:39]Analysis_Code:17="")
								[INVOICES:39]Analysis_Code:17:=[INVOICES_ITEMS:161]Analysis_Code:10
							End if 
							[INVOICES_ITEMS:161]Item_Number:12:=[ORDER_ITEMS:25]Item_Number:27
							
							[JOB_STAGES:47]Invoice_Number:10:=[INVOICES:39]Invoice_Number:1
							[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9:=[INVOICES_ITEMS:161]Amount:5
							[JOB_STAGES:47]AS_Invoice_Including_Tax:28:=[INVOICES_ITEMS:161]Total_Amount:8
							vTotal:=vTotal+[INVOICES_ITEMS:161]Total_Amount:8
							//       [ORDER ITEMS]Invoice Date:=[INVOICES]Invoice Date
							If (DB_t_CurrentFormUsage="Invoice")
								[JOB_STAGES:47]JS_Locked:16:=True:C214
							End if 
							DB_SaveRecord(->[INVOICES_ITEMS:161])
							
							DB_SaveRecord(->[JOB_STAGES:47])
							vTot:=1
							If (((ch0=1) | (ch1=1)) & (vAct1=0))
								USE SET:C118("Items")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
								If (Records in selection:C76([ORDER_ITEMS:25])>0)
									CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
									DIFFERENCE:C122("Items"; "Extra"; "Items")
									CREATE RECORD:C68([INVOICES_ITEMS:161])
									[INVOICES_ITEMS:161]Product_Name:2:=("  "*vAct2)+"Associated Cost Items:"
									[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
									[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
									DB_SaveRecord(->[INVOICES_ITEMS:161])
									
									Jobs_InvTransOI
									$extra:=1
								End if 
							End if 
							
							NEXT RECORD:C51([JOB_STAGES:47])
						End while 
					End if 
					
					If ((ch2=0) & (vAct1=0))
						USE SET:C118("Items")
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							If ((Records in selection:C76([INVOICES_ITEMS:161])>0) & ($extra=1))
								CREATE RECORD:C68([INVOICES_ITEMS:161])
								[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
								[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
								DB_SaveRecord(->[INVOICES_ITEMS:161])
								
							End if 
							CREATE RECORD:C68([INVOICES_ITEMS:161])
							[INVOICES_ITEMS:161]Product_Name:2:="  General Cost Items:"
							[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
							[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
							DB_SaveRecord(->[INVOICES_ITEMS:161])
							
							Jobs_InvTransOI
						End if 
					End if 
					
					CLEAR SET:C117("Items")
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					
					Invoices_Tot
					[JOBS:26]AS_Invoice_Excluding_Tax:12:=Gen_Round(([JOBS:26]AS_Invoice_Excluding_Tax:12+[INVOICES:39]Total_Invoiced_Excluding_Tax:26); 2; 2)
					[JOBS:26]AS_Invoice_Including_Tax:13:=Gen_Round(([JOBS:26]AS_Invoice_Including_Tax:13+[INVOICES:39]Total_Invoiced:5); 2; 2)
					DB_SaveRecord(->[JOBS:26])
					AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
					DB_SaveRecord(->[INVOICES:39])
					If (OK=1)
						If (DB_t_CurrentFormUsage2#"NoMod")
							If ($check=1)
								vIN:=1
								vAdd:=1
								Invoices_FileI
								Open_Pro_Window("Check "+DB_t_CurrentFormUsage)
								MODIFY RECORD:C57([INVOICES:39]; *)
								Jobs_InvWIP
								Transact_End
								Close_ProWin
							Else 
								Gen_Confirm("Do you want to check the "+DB_t_CurrentFormUsage+" before printing?"; "Yes"; "No")
								Invoices_FileI
								If (OK=0)
									vAdd:=1
									DB_t_CurrentFormUsage3:="NoAcc"
									Invoices_PPrint
									Jobs_InvWIP
									Transact_End
								Else 
									vIN:=1
									vAdd:=1
									Open_Pro_Window("Check "+DB_t_CurrentFormUsage)
									MODIFY RECORD:C57([INVOICES:39]; *)
									Jobs_InvWIP
									Transact_End
									Close_ProWin
								End if 
							End if 
						Else 
							Transact_End
						End if 
					Else 
						Transact_End
					End if 
				Else 
					Transact_End
				End if 
			Else 
				Gen_Alert("You have not specified anything to Invoice"; "Cancel")
			End if 
		End if 
	End if 
	vIN:=0
	
	//UNLOAD RECORD([INVOICES])
Else 
	Gen_Alert("Required Setups have not been completed"; "")
End if 
iOK:=0
iCancel:=0
ERR_MethodTrackerReturn("Jobs_InvTrans"; $_t_oldMethodName)