//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_PrintAgedDebtors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     30/03/2011 12:25 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToconvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_noSelection; DM_bo_CustomSort)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_BlankRow; $_l_CurrencyRow; $_l_CurrentRow; $_l_Index; $_l_Process; ch0; DB_l_CurrentDisplayedForm; vIn; vNo; vNo2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrentFormUsage; $_t_MenuItemParameter; $_t_oldMethodName; $_t_OutputCurrency; $1; ACC_t_CurrencyCode; DB_t_CurrentContext; DB_t_CurrentFormUsage; vCallCode; VSELPREV)
	C_TEXT:C284(vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_PrintAgedDebtors")
$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_t_CurrentFormUsage:=""

If ($_t_MenuItemParameter#"NoCurrentSelection@")
	
	Gen_Confirm("Print Aged Debtors For on Screen Selection?"; "Yes"; "No")
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_t_CurrentFormUsage:="AD"
	CREATE SET:C116([INVOICES:39]; "$tempBefore")
	If (OK=1)
		CREATE SET:C116([INVOICES:39]; "$tempBefore")
		If (Records in set:C195("ListboxSet0")>0)
			USE SET:C118("ListboxSet0")
		End if 
		vIn:=1
		$_bo_noSelection:=True:C214
	Else 
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AD"
		REDUCE SELECTION:C351([INVOICES:39]; 0)
		Invoices_Sel
		$_bo_noSelection:=False:C215
	End if 
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		vIn:=0
		$_l_Process:=New process:C317("INV_PrintAgedDebtors"; 128000; "Aged Debtors"; "NoCurrentSelection2")
	Else 
		If (DB_l_CurrentDisplayedForm>0)
			COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$TempSel")
		End if 
		StartTransaction
		Start_Process
		vSelPrev:="•FSC"
		DB_t_CurrentFormUsage:="AD"
		REDUCE SELECTION:C351([INVOICES:39]; 0)
		Invoices_Sel
		$_bo_noSelection:=False:C215
	End if 
End if 


If (vIn=1)
	If (Records in selection:C76([INVOICES:39])>0)
		vNo:=Records in selection:C76([INVOICES:39])
		vNo2:=vNo
		vDate:=<>DB_d_CurrentDate
		DB_t_CurrentFormUsage:="Print"
		//ORDER BY([INVOICES]Company Code;>;[INVOICES]Invoice Date;>)
		//Open_Pro_Window (Term_SLPLWT ("Aged Debtors");0;1;->[INVOICES];WIN_t_CurrentOutputform)
		//FS_SetFormSort (WIN_t_CurrentOutputform)
		//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
		CREATE SET:C116([INVOICES:39]; "PrintSelection")
		ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
		DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; $_at_CurrencyToconvert)
		If (False:C215)
			ARRAY TEXT:C222($_at_CurrencyToconvert; Records in selection:C76([INVOICES:39]))
			FIRST RECORD:C50([INVOICES:39])
			$_l_CurrentRow:=0
			For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
				$_l_BlankRow:=Find in array:C230($_at_CurrencyToconvert; [INVOICES:39]Currency_Code:27)
				If ($_l_BlankRow<0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					$_at_CurrencyToconvert{$_l_CurrentRow}:=[INVOICES:39]Currency_Code:27
				End if 
				NEXT RECORD:C51([INVOICES:39])
			End for 
			ARRAY TEXT:C222($_at_CurrencyToconvert; $_l_CurrentRow)
		End if 
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
		USE SET:C118("PrintSelection")
		
		If (Not:C34($_bo_noSelection)) & (Records in selection:C76([INVOICES:39])>1)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
		End if 
		
		ORDER BY:C49([INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
		vTitle:=""
		If (OK=1)
			// ($_t_OutputCurrency;->CUR_at_CurrencyToconvert)
			//ACC_t_CurrencyCode:=""
			
			If (Not:C34(DM_bo_CustomSort))
				ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
			End if 
			
			If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
				vCallCode:=$_t_OutputCurrency
			End if 
			//CurrConv_Ask (39)
			ch0:=1
			vTitle:=vTitle+"  "+CurrConv_Title($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)+"  "
			If ($_t_OutputCurrency#"")
				If (Not:C34(SR_ReportOK("SLAged")))
					Invoices_AD2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
					
				End if 
			End if 
		End if 
		vIn:=0
	Else 
		Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
	End if 
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
			Menu_Sales
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("INV_PrintAgedDebtors"; $_t_oldMethodName)
