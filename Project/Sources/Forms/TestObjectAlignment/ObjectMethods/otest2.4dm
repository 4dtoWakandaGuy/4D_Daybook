
If (False:C215)
	//Object Name:      TestObjectAlignment.otest2
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
	//C_UNKNOWN($i)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		GOTO OBJECT:C206(*; "otest")
		For ($i; 1; 10000)
			MESSAGE:C88(String:C10($i))
		End for 
End case 
