//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DecryptCardName
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
	C_BLOB:C604(CC_blb_EncryptedCCName; CC_blb_vvv108013)
	C_LONGINT:C283($_l_BlobSize; $_l_offset)
	C_TEXT:C284($_t_NameOnCard; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DecryptCardName")
//The encrpytion keys are generated on the server at startup and remain static
If (BLOB size:C605([xCreditCardDetails:132]NameonCard:11)>0)
	CC_GetEncryptionKeys
	$_l_BlobSize:=BLOB size:C605([xCreditCardDetails:132]NameonCard:11)
	$_l_offset:=0
	COPY BLOB:C558([xCreditCardDetails:132]NameonCard:11; CC_blb_EncryptedCCName; $_l_offset; $_l_offset; $_l_BlobSize)
	DECRYPT BLOB:C690(CC_blb_EncryptedCCName; CC_blb_vvv108013)
	$_t_NameOnCard:=BLOB to text:C555(CC_blb_EncryptedCCName; 3)
	$0:=$_t_NameOnCard
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("CCM_DecryptCardName"; $_t_oldMethodName)