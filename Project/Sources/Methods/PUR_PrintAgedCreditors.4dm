//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PrintAgedCreditors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    01/10/2011 15:27 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToConvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_NoPrint; $_bo_NoSelection)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CurrencyConversionRow; $_l_CurrencyRow; $_l_Process; ch0; DB_l_CurrentDisplayedForm; vIn; vNo; vNo2; vPu)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrentFormUsage; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OutputCurrency; $1; ACC_t_CurrencyCode; DB_t_CurrentContext; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vCallCode; vSelPrev; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PrintAgedCreditors")
$_t_MenuItemParameter:=""
$_bo_NoPrint:=False:C215
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_t_CurrentFormUsage:=""
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	
	Gen_Confirm("Print Aged Creditors for on screen selection?"; "Yes"; "No")
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_t_CurrentFormUsage:="AC"
	CREATE SET:C116([PURCHASE_INVOICES:37]; "$tempBefore")
	If (OK=1)
		CREATE SET:C116([PURCHASE_INVOICES:37]; "$tempBefore")
		If (Records in set:C195("ListboxSet0")>0)
			USE SET:C118("ListboxSet0")
		End if 
		vIn:=1
		$_bo_NoSelection:=True:C214
	Else 
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AC"
		REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
		Purchases_Sel
		$_bo_NoSelection:=False:C215
	End if 
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		$_bo_NoPrint:=True:C214
		$_l_Process:=New process:C317("PUR_PrintAgedCreditors"; 128000; "Aged Creditors"; "NoCurrentSelection2")
	Else 
		If (DB_l_CurrentDisplayedForm>0)
			COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$TempSel")
		End if 
		StartTransaction
		Start_Process
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AC"
		REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
		Purchases_Sel
		$_bo_NoSelection:=False:C215
	End if 
End if 





If (Not:C34($_bo_NoPrint))
	
	
	If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
		vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
		vNo2:=vNo
		vDate:=<>DB_d_CurrentDate
		DB_t_CurrentFormUsage:="Print"
		ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
		//Open_Pro_Window (Term_SLPLWT ("Aged Creditors");0;1;->[PURCHASES];WIN_t_CurrentOutputform)
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
		
		$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->$_at_CurrencyToConvert; Table:C252(->[PURCHASE_INVOICES:37]); "PrintSelection")
		USE SET:C118("PrintSelection")
		If (Not:C34($_bo_NoSelection))
			//WIn_SetFormSize (1;->[PURCHASES];WIN_t_CurrentOutputform)
			//DISPLAY SELECTION([PURCHASES];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
		End if 
		
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
	
	
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	If ($_t_MenuItemParameter#"NoCurrentSelection@")
		USE SET:C118("$tempBefore")
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	Else 
		If ($_t_MenuItemParameter="NoCurrentSelection2")
			Transact_End
			Process_End
			If (DB_l_CurrentDisplayedForm>0)
				USE NAMED SELECTION:C332("$TempSel")
			Else 
				Menu_Purch
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("PUR_PrintAgedCreditors"; $_t_oldMethodName)
