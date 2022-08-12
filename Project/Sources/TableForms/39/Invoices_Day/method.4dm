If (False:C215)
	//Table Form Method Name: [INVOICES]Invoices_Day
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/02/2012 00:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(INV_R_InvAmount; INV_R_InvCostPrice; INV_R_InvSalesPrice; INV_R_InvTaxAmount; INV_R_InvTotal; Vamount)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ouputCurrency; DB_t_CurrentFormUsage; vContName; vInvTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Invoices_Day"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Printing Detail:K2:18)
		
		Case of 
			: ([INVOICES:39]State:10=-3)
				vInvTitle:="Receipt"
			: ([INVOICES:39]State:10=-2)
				vInvTitle:="Deposit"
			: ([INVOICES:39]State:10=-1)
				vInvTitle:="Proforma"
			Else 
				If ([INVOICES:39]Total_Invoiced:5<0)
					vInvTitle:="Credit Note"
				Else 
					vInvTitle:="Invoice"
				End if 
		End case 
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		RELATE ONE:C42([INVOICES:39]Contact_Code:3)
		vContName:=[CONTACTS:1]Contact_Name:31
		If (DB_t_CurrentFormUsage#"Items")
			REDUCE SELECTION:C351([INVOICES_ITEMS:161]; 0)
			
		End if 
		If (DB_t_CurrentFormUsage#"Items@")
			$_bo_UseOld:=False:C215
			If ($_bo_UseOld)
				
			Else 
				REDUCE SELECTION:C351([XInvoiceAllocation:126]; 0)
			End if 
			
		End if 
		
		INV_R_InvCostPrice:=CUR_ConvertValue(INV_R_InvCostPrice; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		INV_R_InvSalesPrice:=CUR_ConvertValue(INV_R_InvSalesPrice; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		INV_R_InvAmount:=CUR_ConvertValue(INV_R_InvAmount; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		INV_R_InvTaxAmount:=CUR_ConvertValue(INV_R_InvTaxAmount; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		INV_R_InvTotal:=CUR_ConvertValue(INV_R_InvTotal; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=CUR_ConvertValue([INVOICES:39]Total_Invoiced_Excluding_Tax:26; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		[INVOICES:39]Total_Tax:35:=CUR_ConvertValue([INVOICES:39]Total_Tax:35; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		[INVOICES:39]Total_Invoiced:5:=CUR_ConvertValue([INVOICES:39]Total_Invoiced:5; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		Vamount:=CUR_ConvertValue(Vamount; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		
		//If ([INVOICES]State<-1)
		//vAmount:=[INVOICES]Total Paid
		//Else
		//vAmount:=0
		//End if
End case 
ERR_MethodTrackerReturn("FM:Invoices_Day"; $_t_oldMethodName)
