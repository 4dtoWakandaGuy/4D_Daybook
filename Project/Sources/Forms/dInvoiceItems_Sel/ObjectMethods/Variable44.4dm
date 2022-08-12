If (False:C215)
	//object Name: Object Name:      dInvoiceItems_Sel.Variable44
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable44")

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable44"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->ACC_t_PeriodFrom; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
End if 
ERR_MethodTrackerReturn("OBJ dInvoiceItems_Sel.Variable44"; $_t_oldMethodName)
