//%attributes = {}
If (False:C215)
	//Project Method Name:      PI_GetOverdue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/05/2010 12:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Overdue)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PI_GetOverdue")
If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
	
	If ([PURCHASE_INVOICES:37]Total_Due:9>0)
		If ([PURCHASE_INVOICES:37]Due_Date:17>!00-00-00!)
			
			$_l_Overdue:=Current date:C33(*)-[PURCHASE_INVOICES:37]Due_Date:17
		Else 
			$_l_Overdue:=Current date:C33(*)-[PURCHASE_INVOICES:37]Invoice_Date:5
		End if 
	Else 
		$_l_Overdue:=0
		
	End if 
	If ($_l_Overdue<0)
		$0:=""
	Else 
		$0:=String:C10($_l_Overdue)
	End if 
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("PI_GetOverdue"; $_t_oldMethodName)
