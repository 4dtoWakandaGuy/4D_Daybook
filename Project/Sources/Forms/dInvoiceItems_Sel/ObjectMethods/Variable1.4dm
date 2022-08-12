If (False:C215)
	//object Name: Object Name:      dInvoiceItems_Sel.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable1")

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable1"; Form event code:C388)
<>NAL:=(cNAL=1)
ERR_MethodTrackerReturn("OBJ dInvoiceItems_Sel.Variable1"; $_t_oldMethodName)