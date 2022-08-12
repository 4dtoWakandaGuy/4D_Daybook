If (False:C215)
	//object Name: [USER]CO_EditTokenField.oSaveToken
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
	C_LONGINT:C283(CO_l_TokenFIeld; CO_l_TokenSave)
	C_TEXT:C284(CO_t_TokenOption; $_t_oldMethodName; CO_t_TokenOption)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CO_EditTokenField.oSaveToken"; Form event code:C388)

If (CO_l_TokenFIeld#0) & (CO_t_TokenOption#"")
	CO_l_TokenSave:=1
	CANCEL:C270
Else 
	Gen_Alert("You must enter a token and select a field before you can save the token")
End if 
ERR_MethodTrackerReturn("OBJ [USER].CO_EditTokenField.oSaveToken"; $_t_oldMethodName)
