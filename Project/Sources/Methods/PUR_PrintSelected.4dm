//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PrintSelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   01/11/2010 09:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PrintSelected")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
If ($_l_RecordsinSelection>0)
	
	ORDER BY:C49([PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
	
	Gen_Confirm("Do you want to print Remittance Advices?"; "Yes"; "No")
	If (OK=1)
		Gen_PPMulti(->[PURCHASE_INVOICES:37]; "Remittance"; "Purchases_Pay"; "Remittance"; "Remittance"; "Purch_RemLP"; 0; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Remittance"; [PURCHASE_INVOICES:37]Analysis_Code:15)
		//   OUTPUT LAYOUT([PURCHASES];"Remittance")
		//   PRINT SELECTION([PURCHASES])
		//   OUTPUT LAYOUT([PURCHASES];"Purchases_Out")
	End if 
	
	Purchases_CheqP(0; 1)
	
End if 
USE SET:C118("$temp")
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Cheque_Number:26="")
SEL_UpdateRecordCache(Table:C252(->[PURCHASE_INVOICES:37]))
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PUR_PrintSelected"; $_t_oldMethodName)
