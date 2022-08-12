
If (False:C215)
	//Object Name:      [ORDERS].Orders_In.oorderStateUpDown
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ORD_but_StateupDown; ORD_l_StartingState)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		//ORD_but_StateupDown
		TRACE:C157
		
		If (ORD_but_StateupDown>ORD_l_StartingState)
			Order_TitUp
			ORD_l_StartingState:=ORD_l_StartingState+1
		Else 
			Order_TitDown
			ORD_l_StartingState:=ORD_l_StartingState-1
		End if 
		//ORD_l_StartingState:=ORD_but_StateupDown
		
		
End case 
