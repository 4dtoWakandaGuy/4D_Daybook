//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_unPaySelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/03/2013 14:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PurchaseCodes; 0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_unPaySelected")
COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$PaySel")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])>1)
	$_bo_Continue:=False:C215
	Gen_Confirm("Undo "+String:C10(Records in selection:C76([PURCHASE_INVOICES:37]))+" Payments?")
	If (OK=1)
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseCodes)
	UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
	READ WRITE:C146([PURCHASE_INVOICES:37])
	For ($_l_Index; 1; Size of array:C274($_at_PurchaseCodes))
		INV_PPaymentUNDO($_at_PurchaseCodes{$_l_Index})
	End for 
	UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
	READ ONLY:C145([PURCHASE_INVOICES:37])
	
End if 
USE NAMED SELECTION:C332("$PaySel")
ERR_MethodTrackerReturn("PUR_unPaySelected"; $_t_oldMethodName)
