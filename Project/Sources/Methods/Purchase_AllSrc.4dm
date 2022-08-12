//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchase_AllSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 11:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PurchaseCodes; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchase_AllSrc")
//Purchase_AllSrc
QUERY SELECTION BY FORMULA:C207([PURCHASE_INVOICES:37]; Purchase_AllSr2)
Gen_Confirm("Do you want to apply a correction to "+String:C10(Records in selection:C76([PURCHASE_INVOICES:37]))+" records?"; "Yes"; "No")
If (OK=1)
	DB_lockFile(->[PURCHASE_INVOICES:37])
	SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseCodes)
	QUERY WITH ARRAY:C644([PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6; $_at_PurchaseCodes)
	APPLY TO SELECTION:C70([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=Round:C94((0-[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2); 2))
	
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
End if 
ERR_MethodTrackerReturn("Purchase_AllSrc"; $_t_oldMethodName)
