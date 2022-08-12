//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_EncryptCardName
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
	C_BLOB:C604(CC_blb_vvv101023)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_EncryptCardName")
If (Count parameters:C259>=1)
	SET BLOB SIZE:C606([xCreditCardDetails:132]NameonCard:11; 0)
	If ($1#"")
		TEXT TO BLOB:C554($1; [xCreditCardDetails:132]NameonCard:11; 3)
		ENCRYPT BLOB:C689([xCreditCardDetails:132]NameonCard:11; CC_blb_vvv101023)
	End if 
	
End if 
ERR_MethodTrackerReturn("CCM_EncryptCardName"; $_t_oldMethodName)