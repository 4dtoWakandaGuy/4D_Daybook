
If (False:C215)
	//Object Name:      [TYPES].types_in.oNonDefaultAddress
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(TYP_l_DefaultHomeAddress; TYP_l_DefaultWorkAddress; TYP_l_nonDefaultAddress)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		//no need to check here
		
		OB SET:C1220([TYPES:5]TypeAttributes:9; "addresstypedefault"; 1)
		
		TYP_l_nonDefaultAddress:=1
		TYP_l_DefaultWorkAddress:=0
		TYP_l_DefaultHomeAddress:=0
		
End case 
