If (False:C215)
	//object Name: [TRANSACTIONS]Trans_Accs.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_Accs.Variable6"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vAmount:=Round:C94(Subtotal:C97([TRANSACTIONS:29]Amount:6); 2)
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_Accs.Variable6"; $_t_oldMethodName)
