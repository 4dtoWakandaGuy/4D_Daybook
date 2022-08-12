
If (False:C215)
	//Object Name:      [ORDERS].Orders_In.Field10
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/03/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS]Orders_In.Field10"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS]Orders_In.Field10"; $_t_oldMethodName)
