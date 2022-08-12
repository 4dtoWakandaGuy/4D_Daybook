If (False:C215)
	//object Name: [COMPANIES]dAsk_Startup2.Variable5
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
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Startup2.Variable5"; Form event code:C388)
[USER:15]VAT Cash:212:=(r1=1)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Startup2.Variable5"; $_t_oldMethodName)