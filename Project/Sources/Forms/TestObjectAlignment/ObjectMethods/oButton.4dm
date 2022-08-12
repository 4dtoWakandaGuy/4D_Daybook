
If (False:C215)
	//Object Name:      TestObjectAlignment.oButton
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
	C_LONGINT:C283(VAR_l_TEst; VAR_l_TEst2)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		VAR_l_TEst:=0
		VAR_l_TEst2:=Milliseconds:C459
		
		GOTO OBJECT:C206(*; "otest2")
End case 
