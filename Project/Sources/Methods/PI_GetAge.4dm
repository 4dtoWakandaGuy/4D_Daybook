//%attributes = {}
If (False:C215)
	//Project Method Name:      PI_GetAge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/05/2010 12:07
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

$_t_oldMethodName:=ERR_MethodTracker("PI_GetAge")
If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
	If ([PURCHASE_INVOICES:37]Invoice_Date:5#!00-00-00!)
		$0:=String:C10(Current date:C33(*)-[PURCHASE_INVOICES:37]Invoice_Date:5)
	Else 
		$0:=""
	End if 
	
Else 
	
	$0:=""
	
	
End if 
ERR_MethodTrackerReturn("PI_GetAge"; $_t_oldMethodName)