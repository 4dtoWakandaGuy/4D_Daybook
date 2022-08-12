//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PrintPIList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; DB_l_CurrentDisplayedForm)
	C_REAL:C285(v0; v31)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vInvTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PrintPIList")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])>=1)
	If (Not:C34(SR_ReportOK("PurchList")))
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "List Purchases")
		
		If ($_l_OK>=0)  // See in Print_Setsizeabout this
			vInvTitle:=Uppercase:C13(Term_SLPLWT("PURCHASE LEDGER LIST"))
			FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases_List")
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303([PURCHASE_INVOICES:37]Total_Invoiced:7; [PURCHASE_INVOICES:37]Total_Due:9; v0; v31)
			PRINT SELECTION:C60([PURCHASE_INVOICES:37])
			PRT_SetPrinterPaperOptions("List Purchases")  //NG June 2005
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PUR_PrintPIList"; $_t_oldMethodName)