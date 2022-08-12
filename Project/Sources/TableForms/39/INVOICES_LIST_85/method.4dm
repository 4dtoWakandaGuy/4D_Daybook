If (False:C215)
	//Table Form Method Name: [INVOICES]INVOICES_LIST_85
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/04/2011 14:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_REAL:C285(INV_R_TotalInvoicedOUt; INV_R_TotdueOUT; v0; v31; vTotalOUT)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ouputCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].INVOICES_LIST_85"; Form event code:C388)
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		RELATE ONE:C42([INVOICES:39]Contact_Code:3)
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		Contact_Details
		INV_R_TotalInvoicedOUt:=CUR_ConvertValue([INVOICES:39]Total_Invoiced:5; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		INV_R_TotdueOUT:=CUR_ConvertValue([INVOICES:39]Total_Due:7; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		If ([INVOICES:39]State:10<-1)
			v31:=CUR_ConvertValue([INVOICES:39]Total_Paid:6; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
			v0:=0
		Else 
			v0:=CUR_ConvertValue([INVOICES:39]Total_Paid:6; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
			v31:=0
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:INVOICES_LIST_85"; $_t_oldMethodName)
