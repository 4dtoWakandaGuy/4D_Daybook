//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_ListSalesLedger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 18:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToconvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_StartProcess)
	C_LONGINT:C283($_l_BlankRow; $_l_CurrencyRow; $_l_OK; $_l_Process; DB_l_CurrentDisplayedForm)
	C_REAL:C285(INV_R_TotalInvoicedOUt; INV_R_TotdueOUT; v0; v31)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OutputCurrency; $1; ACC_t_CurrencyCode; CUR_t_ouputCurrency; DB_t_CurrentContext; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_ListSalesLedger")
$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_bo_StartProcess:=False:C215
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	
	CREATE SET:C116([INVOICES:39]; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		Gen_Confirm("Print Selected Records?"; "Yes"; "No")
		If (OK=1)
			USE SET:C118("ListboxSet0")
		Else 
			$_bo_StartProcess:=True:C214
		End if 
		OK:=1
	Else 
		If (Records in selection:C76([INVOICES:39])>0)
			Gen_Confirm("Print on screen selection?"; "Yes"; "No")
			If (OK=0)
				REDUCE SELECTION:C351([INVOICES:39]; 0)
				$_bo_StartProcess:=True:C214
			End if 
			OK:=1
			
		Else 
			$_bo_StartProcess:=True:C214
		End if 
	End if 
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		
		$_bo_StartProcess:=True:C214
	End if 
End if 
If ($_bo_StartProcess)
	$_l_Process:=New process:C317("INV_ListSalesLedger"; 128000; "Sales Daybook"; "NoCurrentSelection2")
	
Else 
	If (Records in selection:C76([INVOICES:39])=0)
		
		Invoices_Sel
		
	Else 
		
	End if 
End if 


If (OK=1) & (Records in selection:C76([INVOICES:39])>0)
	CREATE SET:C116([INVOICES:39]; "PrintSelection")
	
	If (Not:C34(SR_ReportOK("SLList")))
		COPY NAMED SELECTION:C331([INVOICES:39]; "$tempSelection")
		
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "ListSalesLedger")
		If ($_l_OK>=0)
			ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
			DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; $_at_CurrencyToconvert)
			$_l_BlankRow:=Find in array:C230($_at_CurrencyToconvert; "")
			If ($_l_BlankRow>0)
				$_l_CurrencyRow:=Find in array:C230($_at_CurrencyToconvert; <>SYS_t_BaseCurrency)
				If ($_l_CurrencyRow<0)
					$_at_CurrencyToconvert{$_l_BlankRow}:=<>SYS_t_BaseCurrency
				Else 
					DELETE FROM ARRAY:C228($_at_CurrencyToconvert; $_l_BlankRow)
				End if 
			End if 
			
			Case of 
				: (Size of array:C274($_at_CurrencyToconvert)=1)
					If ($_at_CurrencyToconvert{1}="")
						$_at_CurrencyToconvert{1}:=<>SYS_t_BaseCurrency
					End if 
					ACC_t_CurrencyCode:=$_at_CurrencyToconvert{1}
				Else 
					ACC_t_CurrencyCode:=""
			End case 
			$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert; Table:C252(->[INVOICES:39]); "PrintSelection")
			CUR_t_ouputCurrency:=$_t_OutputCurrency
			USE SET:C118("PrintSelection")
			ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2)
			
			
			vTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger List"))
			FORM SET OUTPUT:C54([INVOICES:39]; "INVOICES_LIST_85")
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303(INV_R_TotalInvoicedOUt; INV_R_TotdueOUT; v0; v31)
			PRINT SELECTION:C60([INVOICES:39])
			PRT_SetPrinterPaperOptions("ListSalesLedger")  //NG June 2005
		End if 
	End if 
End if 
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
ERR_MethodTrackerReturn("INV_ListSalesLedger"; $_t_oldMethodName)