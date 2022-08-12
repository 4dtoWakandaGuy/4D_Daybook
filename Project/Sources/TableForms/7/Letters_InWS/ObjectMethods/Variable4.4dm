If (False:C215)
	//object Name: [DOCUMENTS]Letters_inWS.Variable4
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
	//ARRAY TEXT(SRQtyT;0)
	C_LONGINT:C283(write)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inWS.Variable4"; Form event code:C388)
If (SRQtyT>1)
	//WR O DO COMMAND (Write;410+SRQtyT-2+(4*Num(SRQtyT>7))-(6*Num(SRQtyT>9));0)
	//NG April 2000 update to 4D write 655-replaced above command
	WR EXECUTE COMMAND:P12000:113(write; 410+SRQtyT-2+(4*Num:C11(SRQtyT>7))-(6*Num:C11(SRQtyT>9)))
End if 
SRQtyT:=1
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inWS.Variable4"; $_t_oldMethodName)
