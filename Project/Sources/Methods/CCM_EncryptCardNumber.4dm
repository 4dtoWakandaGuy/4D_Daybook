//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_EncryptCardNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(CC_bo_EncryptedCCnum; CC_blb_vvv101023)
	C_TEXT:C284($_t_oldMethodName; $1; CCM_T_Card901Number)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_EncryptCardNumber")

//The encrpytion keys are generated on the server at startup and remain static
If (Count parameters:C259>=1)
	CCM_T_Card901Number:=CCM_BuildCardNumber($1)
	//CCM_T_Card901Number has now got actual number in
	SET BLOB SIZE:C606([xCreditCardDetails:132]CardNumber:9; 0)
	TEXT TO BLOB:C554(CCM_T_Card901Number; [xCreditCardDetails:132]CardNumber:9; 3)
	ENCRYPT BLOB:C689([xCreditCardDetails:132]CardNumber:9; CC_blb_vvv101023)
End if 
ERR_MethodTrackerReturn("CCM_EncryptCardNumber"; $_t_oldMethodName)