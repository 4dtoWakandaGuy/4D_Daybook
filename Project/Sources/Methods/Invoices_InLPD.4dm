//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ForceCred; $_bo_Enabled; DB_bo_RecordModified)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Index; $_l_PeriodID; vSNo)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_CompanyCode; $_t_NulValue; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; vPeriod)
	C_TEXT:C284(vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPD")
//Project Method Invoices_InLPD 2/3/2(ID 7351-11374)
//Invoices_InLPD
Case of 
	: (Modified:C32([INVOICES:39]State:10))
	: (Modified:C32([INVOICES:39]Invoice_Number:1))
		Check_SecInv(->[INVOICES:39]Invoice_Number:1)
		If (OK=1)
			RemoveLeadTr(Uppercase:C13([INVOICES:39]Invoice_Number:1); ->[INVOICES:39]Invoice_Number:1)
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Invoice_Number:1)
		End if 
		
	: (Modified:C32([INVOICES:39]Company_Code:2))
		Check_SecInv(->[INVOICES:39]Company_Code:2)
		If (OK=1)
			Check_CompanyIS(->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3; ->[INVOICES:39])
			
			vCompName:=[COMPANIES:2]Company_Name:2
			vTel:=[COMPANIES:2]Telephone:9
			If ([COMPANIES:2]Country:8#"")
				If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
					QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
					COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
				End if 
			Else 
				COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
			End if 
			If (COM_t_TelephoneNumberFormat#"")
				OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
				
			End if 
			If (DB_t_CurrentFormUsage#"CN")
				If ((DB_t_CurrentFormUsage2#"P") & ([INVOICES:39]Company_Code:2#Old:C35([INVOICES:39]Company_Code:2)))
					//NG DECEMBER 2006
					//THIS CAUSES A BLANK INVOICE TO GET A NUMBER!
					
					//DB_SaveRecord (->[INVOICES])
					$_t_NulValue:=""
					If ([INVOICES:39]Invoice_Number:1#"")
						Gen_CreditCheck(""; True:C214; ->$_t_NulValue; False:C215)
					Else 
						Gen_CreditCheck(""; True:C214; ->$_t_NulValue; True:C214)
					End if 
					If (((vSNo>0) & (<>ForceCred)) | (vSNo=3))
						[INVOICES:39]Company_Code:2:=""
						[INVOICES:39]Contact_Code:3:=""
						Comp_vClear
						//DB_SaveRecord (->[INVOICES])
					Else 
						vSNo:=0
					End if 
				Else 
					vSNo:=0
				End if 
			Else 
				VsNo:=0
			End if 
			If (vSNo=0)
				Invoices_InLPAr
				If (([COMPANIES:2]Default_Credit_Stage:42#"") & ([INVOICES:39]State:10=0))
					[INVOICES:39]Credit_Stage:22:=[COMPANIES:2]Default_Credit_Stage:42
				End if 
				Invoices_InLPSt
				Check_ContDef(->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3)
				Invoices_UKEC
				Layer_InDDef(->[INVOICES:39]Layer_Code:38)
				If (Records in selection:C76([INVOICES_ITEMS:161])=0)
					Currency_InDDefault(->[INVOICES:39]Currency_Code:27)
				End if 
			End if 
			If (([COMPANIES:2]SL_Terms:40#"") & ([INVOICES:39]State:10=0))
				[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
				Invoices_DueDat
			End if 
			DB_bo_RecordModified:=True:C214
			Gen_FindVars
			Macro_AccTypePt(->[INVOICES:39]Company_Code:2)
		End if 
		
	: (Modified:C32([INVOICES:39]Contact_Code:3))
		Check_SecInv(->[INVOICES:39]Contact_Code:3)
		If (OK=1)
			$_t_CompanyCode:=[INVOICES:39]Company_Code:2
			Check_Contact(->[INVOICES:39]Contact_Code:3; ->[INVOICES:39]Company_Code:2; ->[INVOICES:39])
			
			If (DB_t_CurrentFormUsage#"CN")
				If (($_t_CompanyCode="") & ([INVOICES:39]Company_Code:2#"") & (DB_t_CurrentFormUsage2#"P"))
					//DB_SaveRecord (->[INVOICES])
					$_t_NulValue:=""
					
					If ([INVOICES:39]Invoice_Number:1#"")
						Gen_CreditCheck(""; True:C214; ->$_t_NulValue; False:C215)
					Else 
						Gen_CreditCheck(""; True:C214; ->$_t_NulValue; True:C214)
					End if 
					If (((vSNo>0) & (<>ForceCred)) | (vSNo=3))
						[INVOICES:39]Company_Code:2:=""
						[INVOICES:39]Contact_Code:3:=""
						Comp_vClear
					End if 
				End if 
			End if 
			If (([INVOICES:39]Company_Code:2#"") & ([INVOICES:39]Terms:11=""))
				[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
				Invoices_DueDat
			End if 
			Layer_InDDef(->[INVOICES:39]Layer_Code:38)
			If (Records in selection:C76([INVOICES_ITEMS:161])=0)
				Currency_InDDefault(->[INVOICES:39]Currency_Code:27)
			End if 
			Invoices_InLPAr
			DB_bo_RecordModified:=True:C214
			Gen_FindVars
			Macro_AccTypePt(->[INVOICES:39]Contact_Code:3)
		End if 
		
	: (Modified:C32([INVOICES:39]Invoice_Date:4))
		Check_SecInv(->[INVOICES:39]Invoice_Date:4)
		If (OK=1)
			vDate:=[INVOICES:39]Invoice_Date:4
			$_l_PeriodID:=Check_Period
			Check_PerCloseI
			[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
			vPeriod:=[PERIODS:33]Period_Name:2
			If (([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Invoice_Number:1#""))
				CREATE SET:C116([ORDER_ITEMS:25]; "OIMaster")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[ORDER_ITEMS:25])
					APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				Else 
					FIRST RECORD:C50([ORDER_ITEMS:25])
					For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
						[ORDER_ITEMS:25]Invoice_Date:25:=[INVOICES:39]Invoice_Date:4
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End for 
				End if 
				
				
				USE SET:C118("OIMaster")
			End if 
			Invoices_DueDat
			Macro_AccTypePt(->[INVOICES:39]Invoice_Date:4)
		End if 
	: (Modified:C32([INVOICES:39]Period_Code:13))
		Check_SecInv(->[INVOICES:39]Period_Code:13)
		If (OK=1)
			Check_MinorNC(->[INVOICES:39]Period_Code:13; "Period"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2)
			If ([INVOICES:39]Invoice_Date:4=!00-00-00!)
				[INVOICES:39]Invoice_Date:4:=[PERIODS:33]From_Date:3
			End if 
			Check_PerCloseI
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Period_Code:13)
		End if 
	: (Modified:C32([INVOICES:39]Analysis_Code:17))
		Check_SecInv(->[INVOICES:39]Analysis_Code:17)
		If (OK=1)
			Check_Analysis(->[INVOICES:39]Analysis_Code:17; "Analysis"; ->[INVOICES:39]Debtors_Account:15)
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Analysis_Code:17)
		End if 
	: (Modified:C32([INVOICES:39]Due_Date:18))
		Invoices_LPAge
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Due_Date:18)
	: (Modified:C32([INVOICES:39]Terms:11))
		Check_SecInv(->[INVOICES:39]Terms:11)
		If (OK=1)
			Check_Lists(->[INVOICES:39]Terms:11; "Terms")
			Invoices_DueDat
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Terms:11)
		End if 
	: (Modified:C32([INVOICES:39]UK_EC:21))
		Check_SecInv(->[INVOICES:39]UK_EC:21)
		If (OK=1)
			If (([INVOICES:39]UK_EC:21#"U") & ([INVOICES:39]UK_EC:21#"E"))
				UKEC_Alert
				[INVOICES:39]UK_EC:21:="U"
			Else 
				[INVOICES:39]UK_EC:21:=Uppercase:C13([INVOICES:39]UK_EC:21)
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]UK_EC:21)
		End if 
		
	: (Modified:C32([INVOICES:39]TAX_Registration_Number:20))
		Check_SecInv(->[INVOICES:39]TAX_Registration_Number:20)
		If (OK=1)
			Check_VATReg(->[INVOICES:39]TAX_Prefix:19; ->[INVOICES:39]TAX_Registration_Number:20)
			If (OK=1)
				RELATE ONE:C42([INVOICES:39]Company_Code:2)
				If (([COMPANIES:2]TAX_Registration_Number:39#[INVOICES:39]TAX_Registration_Number:20) & (Not:C34(Locked:C147([COMPANIES:2]))))
					READ WRITE:C146([COMPANIES:2])
					LOAD RECORD:C52([COMPANIES:2])
					[COMPANIES:2]TAX_Prefix:38:=[INVOICES:39]TAX_Prefix:19
					[COMPANIES:2]TAX_Registration_Number:39:=[INVOICES:39]TAX_Registration_Number:20
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
					UNLOAD RECORD:C212([COMPANIES:2])
				End if 
				DB_bo_RecordModified:=True:C214
			End if 
			Macro_AccTypePt(->[INVOICES:39]TAX_Registration_Number:20)
		End if 
		
	: (Modified:C32([INVOICES:39]TAX_Prefix:19))
		Check_SecInv(->[INVOICES:39]TAX_Prefix:19)
		If (OK=1)
			Check_Lists(->[INVOICES:39]TAX_Prefix:19; "VAT Prefixes")
			DB_bo_RecordModified:=True:C214
			Invoices_UKEC2
			Macro_AccTypePt(->[INVOICES:39]TAX_Prefix:19)
		End if 
		
	: (Modified:C32([INVOICES:39]Currency_Code:27))
		Check_SecInv(->[INVOICES:39]Currency_Code:27)
		If (OK=1)
			Check_MinorNC(->[INVOICES:39]Currency_Code:27; ""; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2; "Currency")
			If ([INVOICES:39]Currency_Code:27="")
				[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Currency_Code:27)
		End if 
		
	: (Modified:C32([INVOICES:39]Delivery_Company:30))
		Check_Company(->[INVOICES:39]Delivery_Company:30; ->[INVOICES:39]Delivery_Contact:31; ->[INVOICES:39])
		If ([INVOICES:39]Delivery_Company:30#"")
			Check_ContDef(->[INVOICES:39]Delivery_Company:30; ->[INVOICES:39]Delivery_Contact:31)
		End if 
		Invoices_InLPDC
		Invoices_InLPAr
		Invoices_InLPCo
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Delivery_Company:30)
	: (Modified:C32([INVOICES:39]Delivery_Contact:31))
		Check_Contact(->[INVOICES:39]Delivery_Contact:31; ->[INVOICES:39]Delivery_Company:30; ->[INVOICES:39])
		Invoices_InLPDC
		Invoices_InLPAr
		Invoices_InLPCo
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Delivery_Contact:31)
	: (Modified:C32([INVOICES:39]Deliver_To:32))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Deliver_To:32)
	: (Modified:C32([INVOICES:39]Area_Code:29))
		Check_Minor(->[INVOICES:39]Area_Code:29; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
		[INVOICES:39]Tax_Rate:28:=[AREAS:3]Tax_Rate:4
		Invoices_InLPA2
		Macro_AccTypePt(->[INVOICES:39]Area_Code:29)
	: (Modified:C32([INVOICES:39]Tax_Rate:28))
		Invoices_InLPA2
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Tax_Rate:28)
	: (Modified:C32([INVOICES:39]Cheque_Number:36))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[INVOICES:39]Cheque_Number:36)
		
	: (Modified:C32([INVOICES:39]Layer_Code:38))
		Check_SecInv(->[INVOICES:39]Layer_Code:38)
		If (OK=1)
			Check_MinorNC(->[INVOICES:39]Layer_Code:38; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
			If ([INVOICES:39]Layer_Code:38#"")
				$_bo_Enabled:=Trans_SubLPLayerCode(->[INVOICES:39]Debtors_Account:15; ->[INVOICES:39]Layer_Code:38; 2)
				If ($_bo_Enabled)
					$_bo_Enabled:=Trans_SubLPLayerCode(->[INVOICES_ITEMS:161]Sales_Account:9; ->[INVOICES:39]Layer_Code:38; 2)
				End if 
			End if 
			Layer_Fill(->[INVOICES:39]Layer_Code:38)
			RELATE ONE:C42([INVOICES:39]Period_Code:13)
			If (([LAYERS:76]Layer_Code:1="") | ([LAYERS:76]Period_Controls:3))
				Check_PerCloseI
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Layer_Code:38)
		End if 
		
		
		
	: (Modified:C32([INVOICES:39]Cash_TAX:41))
		Check_SecInv(->[INVOICES:39]Cash_TAX:41)
		If (OK=1)
			Macro_AccTypePt(->[INVOICES:39]Cash_TAX:41)
		End if 
	: (Modified:C32([INVOICES:39]Person:42))
		Check_SecInv(->[INVOICES:39]Person:42)
		If (OK=1)
			Check_MinorNC(->[INVOICES:39]Person:42; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Name")
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[INVOICES:39]Person:42)
		End if 
End case 
ERR_MethodTrackerReturn("Invoices_InLPD"; $_t_oldMethodName)