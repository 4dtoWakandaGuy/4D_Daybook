If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable14
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
	C_LONGINT:C283(CCM_l_cardIDtoAuth; CCM_l_SaveAuth)
	C_REAL:C285(CCM_R_AuthAmount)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CC_CreditCardProcessor.Variable14"; Form event code:C388)
If (CCM_l_cardIDtoAuth=0)
	Gen_Alert("You must select the card first")
Else 
	$_bo_IsAuthd:=(CC_t_AuthCode#"")
	CCM_l_SaveAuth:=Num:C11($_bo_IsAuthd)
	If (CCM_l_SaveAuth=0)
		CCM_l_SaveAuth:=1
		CC_t_AuthCode:="0000"
		CCM_R_AuthAmount:=0
		CANCEL:C270
		
	Else 
		CANCEL:C270
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].CC_CreditCardProcessor.Variable14"; $_t_oldMethodName)
