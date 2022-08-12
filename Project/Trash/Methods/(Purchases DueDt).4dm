//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases DueDt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Purchases DueDt
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_NextDate; $_d_PurchaseInvoiceDate; $_d_StartDate)
	C_LONGINT:C283($_l_PositionPlus)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases DueDt")
If ([PURCHASE_INVOICES:37]Invoice_Date:5#!00-00-00!)
	$_d_PurchaseInvoiceDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
	[PURCHASE_INVOICES:37]Due_Date:17:=[PURCHASE_INVOICES:37]Invoice_Date:5+Num:C11([PURCHASE_INVOICES:37]Terms:31)
	If (([PURCHASE_INVOICES:37]Terms:31="@End of month@") | ([PURCHASE_INVOICES:37]Terms:31="@EOM@") | ([PURCHASE_INVOICES:37]Terms:31="@E.O.M.@") | ([PURCHASE_INVOICES:37]Terms:31="@End of mth@"))
		$_d_StartDate:=Date_FromNums(1; Month of:C24([PURCHASE_INVOICES:37]Invoice_Date:5); Year of:C25([PURCHASE_INVOICES:37]Invoice_Date:5))
		$_d_NextDate:=Date_FromNums(1; Month of:C24($_d_StartDate+35); Year of:C25($_d_StartDate+35))
		[PURCHASE_INVOICES:37]Due_Date:17:=$_d_NextDate-1
		$_d_PurchaseInvoiceDate:=$_d_NextDate-1
	Else 
		
	End if 
	$_l_PositionPlus:=Position:C15("+"; [PURCHASE_INVOICES:37]Terms:31)
	If ($_l_PositionPlus>0)
		[PURCHASE_INVOICES:37]Due_Date:17:=$_d_PurchaseInvoiceDate+Num:C11(Substring:C12([PURCHASE_INVOICES:37]Terms:31; $_l_PositionPlus+1; 32000))
	End if 
	If ([PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)
		[PURCHASE_INVOICES:37]Due_Date:17:=[PURCHASE_INVOICES:37]Invoice_Date:5
	End if 
	Purchases_LPAge
End if 
ERR_MethodTrackerReturn("Purchases DueDt"; $_t_oldMethodName)