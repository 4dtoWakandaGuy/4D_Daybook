//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_RemittancePrint2010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(PRT_Count)
	C_BOOLEAN:C305($_bo_ReportExists; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview; $_bo_Continue; $_bo_ReportExists; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; PRT_Count; $_l_Index; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; DB_t_CurrentContext; DB_t_CurrentFormUsage; PRT_t_pdfOutputFilePath; $_t_InvoiceTitle; $_t_oldMethodName; $_t_WindowTitle; DB_t_CurrentContext; DB_t_CurrentFormUsage; PRT_t_pdfOutputFilePath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_RemittancePrint2010")
CREATE SET:C116([INVOICES:39]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([INVOICES:39])>0)
	ORDER BY:C49([INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
	$_bo_ReportExists:=SR_GetReport(->[INVOICES:39]; "Receipt Rem"; ""; "Invoice Receipt Remittance")
	
	If (Not:C34($_bo_ReportExists))
		
		FORM SET OUTPUT:C54([INVOICES:39]; "Receipt_Rem")
		PRINT SELECTION:C60([INVOICES:39])
		FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_Out")
	Else 
		FIRST RECORD:C50([INVOICES:39])
		PRT_Count:=Records in selection:C76([INVOICES:39])
		PRT_bo_ToScreenPreview:=False:C215
		PRT_bo_ToPdf:=False:C215
		PRT_bo_AskPerIteration:=False:C215
		PRT_bo_AutoIteration:=False:C215
		PRT_t_pdfOutputFilePath:=""
		$_t_WindowTitle:=Get window title:C450
		For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
			$_t_InvoiceTitle:=[INVOICES:39]Invoice_Number:1
			
			$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; ":"; "")
			$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "/"; "_")
			$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "\\"; "_")
			
			SET WINDOW TITLE:C213($_t_InvoiceTitle)
			
			//******************************************************** Added  kmw 02/03/09 v631b120o ********************************************************
			
			//****************************************************************************************************************************************************************
			
			
			
			
			$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ALLOCATIONS:162]; "Receipt_Rem"; "Alloc_SubRec"; "Invoices_Out"; DB_t_CurrentFormUsage; "Inv Remittance"; "INV_ReceiptFormMethod"; 0; ->[INVOICES:39]State:10; "Receipt Rem"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index)
			
			
			
			
			NEXT RECORD:C51([INVOICES:39])
			If ($_bo_Continue=False:C215)
				$_l_Index:=Records in selection:C76([INVOICES:39])
			End if 
		End for 
		SET WINDOW TITLE:C213($_t_WindowTitle)
	End if 
	
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("INV_RemittancePrint2010"; $_t_oldMethodName)
