If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.Variable35
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vFromPos)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.Variable35"; Form event code:C388)
vFromPos:=Uppers2(vFromPos)
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Print.Variable35"; $_t_oldMethodName)