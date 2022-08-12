If (False:C215)
	//object Name: [DOCUMENTS]Letters_inWS.Variable3
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
	//ARRAY TEXT(SRProdCode;0)
	C_LONGINT:C283(write)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inWS.Variable3"; Form event code:C388)
If (SRProdCode>1)
	//WR O DO COMMAND (Write;300+SRProdCode-1;0)
	//NG April 2000 update to 4D write 655-replaced above command
	WR EXECUTE COMMAND:P12000:113(write; 300+SRPRODCODE-1)
	
	
End if 
SRProdCode:=1
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inWS.Variable3"; $_t_oldMethodName)
