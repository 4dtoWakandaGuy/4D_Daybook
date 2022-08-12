If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.Variable46
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CH0)
	C_TEXT:C284($_t_oldMethodName; TR_t_ReconcilliationReference)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.Variable46"; Form event code:C388)
If (TR_t_ReconcilliationReference#"")
	CH0:=1
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.Variable46"; $_t_oldMethodName)
