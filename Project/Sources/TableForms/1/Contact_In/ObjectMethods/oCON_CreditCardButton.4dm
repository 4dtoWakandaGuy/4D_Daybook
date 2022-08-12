If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CreditCardButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CON_l_SubInfoProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CreditCardButton"; Form event code:C388)
HIDE PROCESS:C324(CON_l_SubInfoProcess)

CON_ShowCards
SHOW PROCESS:C325(CON_l_SubInfoProcess)
ERR_MethodTrackerReturn("OBJ:Contact_In,bAddComp2Contact"; $_t_oldMethodName)