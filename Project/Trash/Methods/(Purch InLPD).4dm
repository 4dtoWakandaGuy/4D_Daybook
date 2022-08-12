//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK; DB_bo_RecordModified)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284(<>CompCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; vCompName; vPeriod)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPD")
// Project Method Purch_InLPD 26/3/2(ID 23375-6502)
$_bo_OK:=False:C215
Case of 
	: (Modified:C32([PURCHASE_INVOICES:37]Purchase_Code:1))
		Check_SecPInv(->[PURCHASE_INVOICES:37]Purchase_Code:1)
		If (OK=1)
			RemoveLeadTr(Uppercase:C13([PURCHASE_INVOICES:37]Purchase_Code:1); ->[PURCHASE_INVOICES:37]Purchase_Code:1)
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Purchase_Code:1)
		End if 
		$_bo_OK:=True:C214
	: (Modified:C32([PURCHASE_INVOICES:37]Company_Code:2))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Company_Code:2)
		If (OK=1)
			Check_Company(->[PURCHASE_INVOICES:37]Company_Code:2; ->[CONTACTS:1]Contact_Code:2; ->[PURCHASE_INVOICES:37])
			
			vCompName:=[COMPANIES:2]Company_Name:2
			If (Purch_InLPChkIn)
				If (([COMPANIES:2]TAX_Prefix:38#"") & ([COMPANIES:2]TAX_Prefix:38#DB_GetOrganisationVATPrefix))
					[PURCHASE_INVOICES:37]UK_EC:18:="E"
				Else 
					[PURCHASE_INVOICES:37]UK_EC:18:="U"
				End if 
				Purch_ItemsTax
				If ([COMPANIES:2]PL_Terms:53#"")
					[PURCHASE_INVOICES:37]Terms:31:=[COMPANIES:2]PL_Terms:53
					Purchases_DueDt
				End if 
				Layer_InDDef(->[PURCHASE_INVOICES:37]Layer_Code:28)
				If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
					QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
				Else 
					REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; 0)
				End if 
				If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])=0)
					Currency_InDDefault(->[PURCHASE_INVOICES:37]Currency_Code:23)
				End if 
				<>CompCode:=[COMPANIES:2]Company_Code:1
				DB_bo_RecordModified:=True:C214
			Else 
				REJECT:C38([PURCHASE_INVOICES:37]Company_Code:2)
			End if 
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Company_Code:2)
		End if 
		
	: (Modified:C32([PURCHASE_INVOICES:37]Order_Number:10))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Order_Number:10)
		If (OK=1)
			[PURCHASE_INVOICES:37]Order_Number:10:=Uppercase:C13([PURCHASE_INVOICES:37]Order_Number:10)
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Order_Number:10)
		End if 
		
	: (Modified:C32([PURCHASE_INVOICES:37]Invoice_Date:5))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Invoice_Date:5)
		If (OK=1)
			vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
			$_l_PeriodID:=Check_Period
			Check_PerCloseP
			[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
			vPeriod:=[PERIODS:33]Period_Name:2
			DB_bo_RecordModified:=True:C214
			RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
			Purchases_DueDt
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Invoice_Date:5)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]Due_Date:17))
		$_bo_OK:=True:C214
		Purchases_LPAge
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PURCHASE_INVOICES:37]Due_Date:17)
	: (Modified:C32([PURCHASE_INVOICES:37]Period_Code:3))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Period_Code:3)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICES:37]Period_Code:3; "Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)
			If ([PURCHASE_INVOICES:37]Invoice_Date:5=!00-00-00!)
				[PURCHASE_INVOICES:37]Invoice_Date:5:=[PERIODS:33]From_Date:3
			End if 
			Check_PerCloseP
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Period_Code:3)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]Analysis_Code:15))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Analysis_Code:15)
		If (OK=1)
			Check_Analysis(->[PURCHASE_INVOICES:37]Analysis_Code:15; "Analysis"; ->[PURCHASE_INVOICES:37]Creditors_Account:13)
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Analysis_Code:15)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]Terms:31))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Terms:31)
		If (OK=1)
			Check_Lists(->[PURCHASE_INVOICES:37]Terms:31; "Terms")
			Purchases_DueDt
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Terms:31)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]UK_EC:18))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]UK_EC:18)
		If (OK=1)
			If (([PURCHASE_INVOICES:37]UK_EC:18#"U") & ([PURCHASE_INVOICES:37]UK_EC:18#"E"))
				UKEC_Alert
				[PURCHASE_INVOICES:37]UK_EC:18:="U"
			Else 
				[PURCHASE_INVOICES:37]UK_EC:18:=Uppercase:C13([PURCHASE_INVOICES:37]UK_EC:18)
			End if 
			Purch_ItemsTax
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]UK_EC:18)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]Currency_Code:23))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Currency_Code:23)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICES:37]Currency_Code:23; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
			If ([PURCHASE_INVOICES:37]Currency_Code:23="")
				[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Currency_Code:23)
		End if 
	: (Modified:C32([PURCHASE_INVOICES:37]Cheque_Number:26))
		$_bo_OK:=True:C214
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PURCHASE_INVOICES:37]Cheque_Number:26)
	: (Modified:C32([PURCHASE_INVOICES:37]Layer_Code:28))
		$_bo_OK:=True:C214
		Check_SecPInv(->[PURCHASE_INVOICES:37]Layer_Code:28)
		If (OK=1)
			Check_MinorNC(->[PURCHASE_INVOICES:37]Layer_Code:28; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
			If ([PURCHASE_INVOICES:37]Layer_Code:28#"")
				$_bo_Continue:=Trans_SubLPLayerCode(->[PURCHASE_INVOICES:37]Creditors_Account:13; ->[PURCHASE_INVOICES:37]Layer_Code:28; 2)
				If ($_bo_Continue)
					$_bo_Continue:=Trans_SubLPLayerCode(->[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8; ->[PURCHASE_INVOICES:37]Layer_Code:28; 2)
				End if 
			End if 
			Layer_Fill(->[PURCHASE_INVOICES:37]Layer_Code:28)
			RELATE ONE:C42([PURCHASE_INVOICES:37]Period_Code:3)
			If (([LAYERS:76]Layer_Code:1="") | ([LAYERS:76]Period_Controls:3))
				Check_PerCloseI
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[PURCHASE_INVOICES:37]Layer_Code:28)
		End if 
		
	: (Modified:C32([PURCHASE_INVOICES:37]Area_Code:21))
		$_bo_OK:=True:C214
		Check_Minor(->[PURCHASE_INVOICES:37]Area_Code:21; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
		[PURCHASE_INVOICES:37]Tax_Rate:20:=[AREAS:3]Tax_Rate:4
		Purch_InLPA2
		Macro_AccTypePt(->[PURCHASE_INVOICES:37]Area_Code:21)
End case 
If ($_bo_OK)
	WS_KeepFocus
End if 
ERR_MethodTrackerReturn("Purch_InLPD"; $_t_oldMethodName)
