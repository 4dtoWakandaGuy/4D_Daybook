If (False:C215)
	//object Name: [INVOICES]dAllocation.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(GEN_l_NameSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dAllocation.Variable18"; Form event code:C388)
If (GEN_l_NameSelected>0)
	ACCEPT:C269
Else 
	ALERT:C41("You must select a deposit before you press OK")
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dAllocation.Variable18"; $_t_oldMethodName)
