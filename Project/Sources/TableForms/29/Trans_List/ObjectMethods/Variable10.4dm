If (False:C215)
	//object Name: [TRANSACTIONS]Trans_List.Variable10
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
	C_REAL:C285(vVAT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_List.Variable10"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vVAT:=Round:C94(Subtotal:C97([TRANSACTIONS:29]Tax_Amount:16); 2)
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_List.Variable10"; $_t_oldMethodName)
