If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oClearDates3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(ViDateF; viDateT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oClearDates3"; Form event code:C388)

ViDateF:=!00-00-00!
viDateT:=!00-00-00!
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oClearDates3"; $_t_oldMethodName)