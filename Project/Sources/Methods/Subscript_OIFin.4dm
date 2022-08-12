//%attributes = {}
If (False:C215)
	//Project Method Name:      Subscript_OIFin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SUBS_at_CompanyCodes;0)
	//ARRAY TEXT(SUBS_at_OrderCodes;0)
	C_LONGINT:C283($_l_CompanyCodeRow; $_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript_OIFin")
//Subscript_OIFin - Order Items Find for Delivery Notes & Invoices
//& in Letter_AllDets
USE SET:C118("OMaster")
$_l_CompanyCodeRow:=Find in array:C230(SUBS_at_CompanyCodes; [ORDERS:24]Company_Code:1)
$_l_SizeofArray:=Size of array:C274(SUBS_at_OrderCodes{$_l_CompanyCodeRow})
If ($_l_SizeofArray<256)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=SUBS_at_OrderCodes{$_l_CompanyCodeRow}{1}; *)
	For ($_l_Index; 2; $_l_SizeofArray)
		QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Order_Code:1=SUBS_at_OrderCodes{$_l_CompanyCodeRow}{$_l_Index}; *)
	End for 
	QUERY SELECTION:C341([ORDER_ITEMS:25])
	OK:=1
Else 
	Gen_Alert([ORDERS:24]Company_Code:1+" has too many Items to process"; "Cancel")
	OK:=0
End if 
ERR_MethodTrackerReturn("Subscript_OIFin"; $_t_oldMethodName)
