//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPDC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 15:28`Method: Invoices_InLPDC
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Details)
	C_TEXT:C284($_t_oldMethodName; Vdetails)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPDC")
$_bo_Details:=False:C215
If ([INVOICES:39]Delivery_Company:30#"")
	RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
	$_bo_Details:=True:C214
End if 
If ([INVOICES:39]Delivery_Contact:31#"")
	RELATE ONE:C42([INVOICES:39]Delivery_Contact:31)
	$_bo_Details:=True:C214
End if 
If ($_bo_Details)
	Letter_Details
Else 
	Vdetails:=""
End if 
ERR_MethodTrackerReturn("Invoices_InLPDC"; $_t_oldMethodName)