If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsAuthd)
	C_LONGINT:C283(CCM_l_SaveAuth)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CC_CreditCardProcessor.Variable19"; Form event code:C388)
$_bo_IsAuthd:=(CC_t_AuthCode#"")
CCM_l_SaveAuth:=Num:C11($_bo_IsAuthd)
If (CCM_l_SaveAuth=0)
	Gen_Confirm("You did not get an authorization!"+Char:C90(13)+"Do you wish to exit this window?"; "Exit"; "Stay")
	If (OK=1)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].CC_CreditCardProcessor.Variable19"; $_t_oldMethodName)
