//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_AC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 16:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToConvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CurrencyConversionRow; $_l_CurrencyRow; ch0; vNo; vNo2; vPu)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_OutputCurrency; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode; vTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_AC")
//Purchases Aged Creditors
Start_Process
Purchases_File
READ ONLY:C145([PURCHASE_INVOICES:37])
READ ONLY:C145([COMPANIES:2])
While (vPu=1)
	DB_t_CurrentFormUsage:="AC"
	Purchases_Sel
	If (vPu=1)
		If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
			vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
			vNo2:=vNo
			vDate:=<>DB_d_CurrentDate
			DB_t_CurrentFormUsage:="Print"
			ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
			Open_Pro_Window(Term_SLPLWT("Aged Creditors"); 0; 1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
			CREATE SET:C116([PURCHASE_INVOICES:37]; "PrintSelection")
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			DISTINCT VALUES:C339([PURCHASE_INVOICES:37]Currency_Code:23; $_at_CurrencyToConvert)
			
			$_l_CurrencyConversionRow:=Find in array:C230($_at_CurrencyToConvert; "")
			
			If ($_l_CurrencyConversionRow>0)
				$_l_CurrencyRow:=Find in array:C230($_at_CurrencyToConvert; <>SYS_t_BaseCurrency)
				If ($_l_CurrencyRow<0)
					$_at_CurrencyToConvert{$_l_CurrencyConversionRow}:=<>SYS_t_BaseCurrency
				Else 
					DELETE FROM ARRAY:C228($_at_CurrencyToConvert; $_l_CurrencyConversionRow)
				End if 
			End if 
			
			
			Case of 
				: (Size of array:C274($_at_CurrencyToConvert)=1)
					If ($_at_CurrencyToConvert{1}="")
						$_at_CurrencyToConvert{1}:=<>SYS_t_BaseCurrency
					End if 
					ACC_t_CurrencyCode:=$_at_CurrencyToConvert{1}
				Else 
					ACC_t_CurrencyCode:=""
			End case 
			
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert; Table:C252(->[PURCHASE_INVOICES:37]); "PrintSelection")
			USE SET:C118("PrintSelection")
			
			WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([PURCHASE_INVOICES:37]; *)
			
			vTitle:=""
			If (OK=1)
				// ACC_t_CurrencyCode:=""
				If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
					vCallCode:=$_t_OutputCurrency
				End if 
				//CurrConv_Ask (39)
				ch0:=1
				
				vTitle:=vTitle+"  "+CurrConv_Title($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)+"  "
				If ($_t_OutputCurrency#"")
					If (Not:C34(SR_ReportOK("PurchAged")))
						Purchases_AC2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
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
ERR_MethodTrackerReturn("Purchases_AC"; $_t_oldMethodName)