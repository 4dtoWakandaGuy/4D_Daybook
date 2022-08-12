//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_GetAge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 13:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_GetAge")

If ([INVOICES:39]Invoice_Number:1#"")
	If ([INVOICES:39]Invoice_Date:4#!00-00-00!)
		$0:=String:C10(Current date:C33(*)-[INVOICES:39]Invoice_Date:4)
	Else 
		$0:=""
	End if 
	
Else 
	
	$0:=""
	
	
End if 
ERR_MethodTrackerReturn("INV_GetAge"; $_t_oldMethodName)