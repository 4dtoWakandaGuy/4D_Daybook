If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; CCM_l_cardIDtoAuth)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CC_CreditCardProcessor.Variable13"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (CCM_l_cardIDtoAuth=0)
			Gen_Alert("You must select the card first")
			CC_t_AuthCode:=""
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CC_CreditCardProcessor.Variable13"; $_t_oldMethodName)
