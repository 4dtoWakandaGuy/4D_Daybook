//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_GetOverdue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 13:01
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

$_t_oldMethodName:=ERR_MethodTracker("INV_GetOverdue")

If ([INVOICES:39]Invoice_Number:1#"")
	
	If ([INVOICES:39]Total_Due:7>0)
		If ([INVOICES:39]Due_Date:18>!00-00-00!)
			
			$_l_Overdue:=(Current date:C33(*)-[INVOICES:39]Due_Date:18)
		Else 
			$_l_Overdue:=(Current date:C33(*)-[INVOICES:39]Invoice_Date:4)
			
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
ERR_MethodTrackerReturn("INV_GetOverdue"; $_t_oldMethodName)