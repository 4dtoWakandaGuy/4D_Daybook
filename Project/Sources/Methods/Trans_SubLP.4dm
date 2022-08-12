//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver; $_bo_Continue; $_bo_Edit; $_bo_OK)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_PeriodID; MOD_l_CurrentModuleAccess)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLP")
//lp trans sub - at present repeated in Trans_SubLPX -
//NB this one only has been updated 4/6/96
Case of 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
		If (OK=1)
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1; "Type"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
			If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1#"")
				If ([TRANSACTION_TYPES:31]Full_Access:15)
					If (MOD_l_CurrentModuleAccess#2)
						Gen_Alert("You do not have access to this Transaction Type"; "Try again")
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=""
					End if 
				End if 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1#"")
				If ([TRANSACTION_TYPES:31]No_NL_Postings:23)
					Gen_Alert("This Transaction Type cannot be used within the General Ledger"; "Try again")
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=""
				End if 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1#"")
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[TRANSACTION_TYPES:31]DC:3
				If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="")
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
					RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
					[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
				End if 
				If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
				End if 
				If (([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="") & ([TRANSACTION_TYPES:31]Analysis_Code:7#""))
					If (<>PersAnOver=False:C215)
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
					End if 
				End if 
				If ([TRANSACTION_TYPES:31]Tax_Code:6#"")
					[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
				End if 
				If ([TRANSACTION_BATCH_ITEMS:155]Description:10="")
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2
				End if 
				If ([TRANSACTION_TYPES:31]Layer_Code:16#"")
					[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[TRANSACTION_TYPES:31]Layer_Code:16
				End if 
				If ([TRANSACTION_TYPES:31]Currency_Code:17#"")
					[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[TRANSACTION_TYPES:31]Currency_Code:17
				End if 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="")
				[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="")
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
			End if 
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2)
		If (OK=1)
			Check_Analysis(->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; ""; ->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; ->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
		If (OK=1)
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				If ([ACCOUNTS:32]No_NL_Postings:9)
					If ((DB_t_CurrentFormUsage3#"Pch") | ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1#DB_GetLedgerTRANSINVpost) | ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1#DB_GetLedgerTRANSRECpost))
						Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
						[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=""
					End if 
				End if 
			End if 
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; ->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; 1)
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				$_bo_Continue:=Check_AnalAcc(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; ->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; 1)
			End if 
			$_bo_Continue:=True:C214
			If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & (([TRANSACTION_TYPES:31]D_Range_F:9#"") | ([TRANSACTION_TYPES:31]D_Range_T:10#"")))
				If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3<[TRANSACTION_TYPES:31]D_Range_F:9) | ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3>[TRANSACTION_TYPES:31]D_Range_T:10))
					If ([TRANSACTION_TYPES:31]D_Enforce:13)
						Gen_Alert("This Account does not fall within the Transaction Type's required range of Debit"+" Accounts."; "Try again")
						$_bo_Continue:=False:C215
						[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
						REJECT:C38([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
					Else 
						Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Debit"+" Accounts."; "Allow"; "Try again")
						If (OK=0)
							$_bo_Continue:=False:C215
							[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
							REJECT:C38([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
						End if 
					End if 
				End if 
			End if 
			If ($_bo_Continue)
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
				If ([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="")
					[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
				End if 
				If ((([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")) & ([TRANSACTION_BATCH_ITEMS:155]Total:9>0))
					vTot:=1
					vTot2:=1
				End if 
			End if 
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
		If (OK=1)
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; "Account"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				If ([ACCOUNTS:32]No_NL_Postings:9)
					Gen_Alert("This Account cannot be used within the "+Term_NLWT("Nominal")+" Ledger"; "Try again")
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=""
				End if 
			End if 
			RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				$_bo_Continue:=Trans_SubLPLayerCode(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; ->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; 1)
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				$_bo_Continue:=Check_AnalAcc(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; ->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; 1)
			End if 
			$_bo_Continue:=True:C214
			If (([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"") & (([TRANSACTION_TYPES:31]C_Range_F:11#"") | ([TRANSACTION_TYPES:31]C_Range_T:12#"")))
				If (([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12<[TRANSACTION_TYPES:31]C_Range_F:11) | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12>[TRANSACTION_TYPES:31]C_Range_T:12))
					If ([TRANSACTION_TYPES:31]C_Enforce:14)
						Gen_Alert("This Account does not fall within the Transaction Type's required range of Credi"+"t Accounts."; "Try again")
						$_bo_Continue:=False:C215
						[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
						REJECT:C38([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
					Else 
						Gen_Confirm("This Account does not fall within the Transaction Type's advised range of Credit"+" Accounts."; "Allow"; "Try again")
						If (OK=0)
							$_bo_Continue:=False:C215
							[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
							REJECT:C38([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
						End if 
					End if 
				End if 
			End if 
			If ($_bo_Continue)
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
				[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
				If ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="")
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
				End if 
				If ((([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")) & ([TRANSACTION_BATCH_ITEMS:155]Total:9>0))
					vTot:=1
					vTot2:=1
				End if 
			End if 
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4))
		$_bo_OK:=Trans_SubLPInv
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17))
		$_bo_OK:=Trans_SubLPPurI
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Company_Code:13))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Company_Code:13)
		If (OK=1)
			Check_CompanyNC(->[TRANSACTION_BATCH_ITEMS:155]Company_Code:13; ->[CONTACTS:1]Contact_Code:2; ->[TRANSACTION_BATCHES:30])
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
		If (OK=1)
			vDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
			$_l_PeriodID:=Check_Period
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
			Trans_SubLPPer
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Period_Code:11))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
		If (OK=1)
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Period_Code:11; "Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)
			If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5=!00-00-00!)
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[PERIODS:33]From_Date:3
			End if 
			Trans_SubLPPer
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Amount:6))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Amount:6)
		If (OK=1)
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
			Trans_SubLPVAT
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
		If (OK=1)
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
			If ([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7="")
				[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
			End if 
			Trans_SubLPVAT
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15))
		Trans_SubLPIO(->[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; ->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16))
		Trans_SubLPIO(->[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; ->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]UK_EC:18))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]UK_EC:18)
		If (OK=1)
			[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=Uppercase:C13([TRANSACTION_BATCH_ITEMS:155]UK_EC:18)
			If (([TRANSACTION_BATCH_ITEMS:155]UK_EC:18#"U") & ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18#"E"))
				UKEC_Alert
				[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
			End if 
			Trans_SubLPVAT
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8)
		If (OK=1)
			If ((([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="I@") | ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="I@")) & ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="E"))
				Gen_Alert("You cannot allocate VAT to an EC Input Transaction")
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
				vTot:=1
				If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=""))
					vTot2:=1
				End if 
			End if 
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Total:9))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Total:9)
		If (OK=1)
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
			If ((([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="I@") | ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="I@")) & ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="E"))
				[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
			Else 
				If ([TAX_CODES:35]Tax_Code:1#[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
					RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
				End if 
				[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((([TRANSACTION_BATCH_ITEMS:155]Total:9/(100+[TAX_CODES:35]Tax_Rate:3))*100); 2; 2)
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Total:9-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
			End if 
			vTot:=1
			If (([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") | ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12=""))
				vTot2:=1
			End if 
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19))
		$_bo_OK:=Trans_SubLPCur
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20))
		$_bo_Edit:=Trans_SubLPLayer
		
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Description:10))
		Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Description:10)
		If (OK=1)
			[TRANSACTION_BATCH_ITEMS:155]Description:10:=Uppers3([TRANSACTION_BATCH_ITEMS:155]Description:10)
		End if 
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22))
		$_bo_OK:=Trans_SubLPPur
		
	: (Modified:C32([TRANSACTION_BATCH_ITEMS:155]Job_Code:23))
		$_bo_OK:=Trans_SubLPJob
		
		
End case 
ERR_MethodTrackerReturn("Trans_SubLP"; $_t_oldMethodName)
