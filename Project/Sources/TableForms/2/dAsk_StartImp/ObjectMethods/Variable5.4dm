If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.Variable5"; Form event code:C388)
//Gen_Confirm ("Are you sure that you want to complete the setups manually?";"Manual";"Select")
If (OK=1)
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_StartImp,xCancel"; $_t_oldMethodName)
