
If (False:C215)
	//Object Name:      TestObjectAlignment.otest
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(VAR_l_TEst)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		VAR_l_TEst:=Milliseconds:C459
		
End case 
