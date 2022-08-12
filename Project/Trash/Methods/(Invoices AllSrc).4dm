//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices AllSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 20:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld)
	C_LONGINT:C283($_l_InvoiceIndex)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices AllSrc")
//Invoices AllSrc
$_bo_UseOld:=False:C215
If ($_bo_UseOld)
	
Else 
	For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
		//this is the allocations
		$_r_Sum:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2))
		If (((([INVOICES:39]Total_Invoiced:5>0) & ($_r_Sum<0) & (Round:C94(([INVOICES:39]Total_Invoiced:5+$_r_Sum); 2)=0)) | (([INVOICES:39]Total_Invoiced:5<0) & ($_r_Sum>0) & (Round:C94(([INVOICES:39]Total_Invoiced:5+$_r_Sum); 2)=0))))
			ADD TO SET:C119([INVOICES:39]; "MODIFY")
		End if 
		NEXT RECORD:C51([INVOICES:39])
	End for 
	USE SET:C118("MODIFY")
	CLEAR SET:C117("MODIFY")
	If (Records in selection:C76([INVOICES:39])>0)
		Gen_Confirm("Do you want to apply a correction to "+String:C10(Records in selection:C76([INVOICES:39]))+" records?"; "Yes"; "No")
		If (OK=1)
			FIRST RECORD:C50([INVOICES:39])
			For ($_l_InvoiceIndex; 1; Records in selection:C76([INVOICES:39]))
				INV_GetAllocations([INVOICES:39]Invoice_Number:1)
				DB_lockFile(->[XInvoiceAllocation:126])
				APPLY TO SELECTION:C70([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAmount:7:=(Round:C94((0-[XInvoiceAllocation:126]xAmount:7); 2)))
				
				
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[XInvoiceAllocation:126]))
				NEXT RECORD:C51([INVOICES:39])
			End for 
		End if 
	Else 
		Gen_Alert("There are no invoices to be corrected?"; "OK")
	End if 
End if 
ERR_MethodTrackerReturn("Invoices AllSrc"; $_t_oldMethodName)