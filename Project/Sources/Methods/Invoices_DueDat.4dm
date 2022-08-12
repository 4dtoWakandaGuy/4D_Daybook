//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_DueDat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 13:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_InvoiceDate; $_d_NextDate; $_d_StartDate)
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_DueDat")
$_d_InvoiceDate:=[INVOICES:39]Invoice_Date:4
[INVOICES:39]Due_Date:18:=[INVOICES:39]Invoice_Date:4+Num:C11([INVOICES:39]Terms:11)
If (([INVOICES:39]Terms:11="@End of month@") | ([INVOICES:39]Terms:11="@EOM@") | ([INVOICES:39]Terms:11="@E.O.M.@") | ([INVOICES:39]Terms:11="@End of mth@"))
	$_d_StartDate:=Date_FromNums(1; Month of:C24([INVOICES:39]Invoice_Date:4); Year of:C25([INVOICES:39]Invoice_Date:4))
	$_d_NextDate:=Date_FromNums(1; Month of:C24($_d_StartDate+35); Year of:C25($_d_StartDate+35))
	[INVOICES:39]Due_Date:18:=$_d_NextDate-1
	$_d_InvoiceDate:=$_d_NextDate-1
Else 
	[INVOICES:39]Due_Date:18:=[INVOICES:39]Invoice_Date:4+Num:C11([INVOICES:39]Terms:11)
End if 
$_l_CharPosition:=Position:C15("+"; [INVOICES:39]Terms:11)
If ($_l_CharPosition>0)
	[INVOICES:39]Due_Date:18:=$_d_InvoiceDate+Num:C11(Substring:C12([INVOICES:39]Terms:11; $_l_CharPosition+1; 32000))
End if 
If ([INVOICES:39]Due_Date:18=!00-00-00!)
	[INVOICES:39]Due_Date:18:=$_d_InvoiceDate
End if 
Invoices_LPAge
ERR_MethodTrackerReturn("Invoices_DueDat"; $_t_oldMethodName)