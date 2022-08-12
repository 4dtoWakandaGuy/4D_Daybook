//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_AC2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 15:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_InputCurrencies;0)
	C_BOOLEAN:C305($_bo_Continue; DM_bo_CustomSort)
	C_LONGINT:C283($_l_OK; $_l_SortedOrder; vNo; vPu)
	C_POINTER:C301($2)
	C_REAL:C285(v0; v31; v61; v91)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; $1; CUR_t_ouputCurrency; vCompany; vInvTitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_AC2")
If (Count parameters:C259>=2)
	ARRAY TEXT:C222(CUR_at_InputCurrencies; 0)
	CUR_t_ouputCurrency:=$1
	COPY ARRAY:C226($2->; CUR_at_InputCurrencies)
Else 
	//TRACE
End if 


If (OK=1)
	vTitle1:="0-"+String:C10(DB_GetLedgerADStageOne)
	vTitle2:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)
	vTitle3:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)
	vTitle4:="Over "+String:C10(DB_GetLedgerADStageThree)
	vTitle5:="Total"
	v0:=0
	v31:=0
	v61:=0
	v91:=0
	vInvTitle:=Uppercase:C13(Term_SLPLWT("AGED CREDITORS"))
	
	$_l_SortedOrder:=0
	If (Not:C34(DM_bo_CustomSort))
		Gen_Confirm("Sort by Company"; "Name"; "Code")
		If (OK=1)
			$_l_SortedOrder:=1
		End if 
	Else 
		OK:=1
		$_l_SortedOrder:=2
	End if 
	$_bo_Continue:=False:C215
	Gen_Confirm(Term_SLPLWT("Print itemised Purchases or consolidate by Company?"); "Itemise"; "Consolidate")
	If (OK=1)
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
		
		
		Case of 
			: ($_l_SortedOrder=1)
				ORDER BY:C49([PURCHASE_INVOICES:37]; [COMPANIES:2]Company_Name:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
			: ($_l_SortedOrder=0)
				ORDER BY:C49([PURCHASE_INVOICES:37]; [COMPANIES:2]Company_Code:1; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
			Else 
				//custom sort
		End case 
		$_t_ReportName:="PurchasesAgedCreditors"
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_ReportName)
		$_bo_Continue:=($_l_OK>=0)  // See in Print_SetSIze about this
		If ($_bo_Continue)
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
			
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303(v0; v31; v61; v91)
			FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases_AC")
		End if 
	Else 
		$_t_ReportName:="AgedCreditorCompanies"
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_ReportName)
		$_bo_Continue:=($_l_OK>=0)  // See in Print_SetSIze about this
		If ($_bo_Continue)
			SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
			
			CREATE SET:C116([PURCHASE_INVOICES:37]; "Master2")
			RELATE ONE SELECTION:C349([PURCHASE_INVOICES:37]; [COMPANIES:2])
			vCompany:=""
			vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
			FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases_AC")
			//vNo:=Records in selection([COMPANIES])
			//FORM SET OUTPUT([COMPANIES];"Aged Creditors")
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303(v0; v31; v61; v91)
			SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
			
			Case of 
				: ($_l_SortedOrder=1)
					ORDER BY:C49([PURCHASE_INVOICES:37]; [COMPANIES:2]Company_Name:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
				: ($_l_SortedOrder=0)
					ORDER BY:C49([PURCHASE_INVOICES:37]; [COMPANIES:2]Company_Code:1; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
				Else 
					//custom sort
			End case 
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		
		
	End if 
	//Gen_Alert ("Change the Scaling Print Settings to 90% to print a Totals Column";"
	If ($_bo_Continue)  // NG Feb 2007
		PRINT SELECTION:C60([PURCHASE_INVOICES:37])
		
		PRT_SetPrinterPaperOptions($_t_ReportName)  //NG June 2005
	End if 
	
End if 
//Close_ProWin
vPu:=0
ERR_MethodTrackerReturn("Purchases_AC2"; $_t_oldMethodName)
