//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_ACSRB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_PeriodID; ch0; vNo; vNo2; vPu)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_OutputCurrency; Acc_t_AccountCodeFrom; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode; vTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_ACSRB")
//Purchases Aged Creditors
Start_Process
Purchases_File
READ ONLY:C145([PURCHASE_INVOICES:37])
READ ONLY:C145([COMPANIES:2])
While (vPu=1)
	DB_t_CurrentFormUsage:="AA"
	Purchases_Sel
	If (vPu=1)
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			vDate:=<>DB_d_CurrentDate
			$_l_PeriodID:=Check_Period
			vDate:=[PERIODS:33]From_Date:3-1
			vDate:=Date:C102(Gen_Request(Term_SLPLWT("Aged Creditors as at:"); String:C10(vDate)))
			If ((OK=1) & (vDate>!00-00-00!))
				QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
				Acc_t_AccountCodeFrom:=[TRANSACTION_TYPES:31]Credit_Account:5
				Acc_t_AccountCodeFrom:=Gen_Request("Creditors Account:"; Acc_t_AccountCodeFrom)
				If (OK=1)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=Acc_t_AccountCodeFrom)
					If ((OK=1) & (Records in selection:C76([ACCOUNTS:32])>0))
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Creditors_Account:13=Acc_t_AccountCodeFrom)
						QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; Purchases_AASrc)
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
							vNo2:=vNo
							DB_t_CurrentFormUsage:="Print"
							ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
							Open_Pro_Window(Term_SLPLWT("Aged Creditors As At"); 0; 1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
							// FS_SetFormSort (WIN_t_CurrentOutputform)
							WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
							DISPLAY SELECTION:C59([PURCHASE_INVOICES:37]; *)
							DB_t_CurrentFormUsage:="AA"
							vTitle:="As at: "+String:C10(vDate)+Term_SLPLWT("   Creditor Acc: ")+Acc_t_AccountCodeFrom
							If (OK=1)
								//ACC_t_CurrencyCode:=""
								ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
								$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
								If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
									vCallCode:=$_t_OutputCurrency
								End if 
								//CurrConv_Ask (39)
								ch0:=1
								
								vTitle:=vTitle+"  "+CurrConv_Title($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)+"  "
								If ($_t_OutputCurrency#"")
									If (Not:C34(SR_ReportOK("PurchAgedAA")))
										Purchases_AC2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
									End if 
								End if 
							End if 
						Else 
							Gen_None(Term_SLPLWT("Purchase Ledger Items"); ->vPu)
						End if 
					End if 
				End if 
			End if 
			vPu:=0
		Else 
			Gen_None(Term_SLPLWT("Purchase Ledger Items"); ->vPu)
		End if 
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("Purchases_ACSRB"; $_t_oldMethodName)