//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DecryptCardNumber
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
	C_BLOB:C604(CC_bo_EncryptedCCnum; CC_blb_vvv108013)
	C_LONGINT:C283($_l_BlobSize; $_l_CharacterPosition; $_l_offset)
	C_TEXT:C284($_t_oldMethodName; CC_T_CCX99999999999)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DecryptCardNumber")

//The encrpytion keys are generated on the server at startup and remain static
$_l_BlobSize:=BLOB size:C605([xCreditCardDetails:132]CardNumber:9)
If ($_l_BlobSize>0)
	CC_GetEncryptionKeys
	
	SET BLOB SIZE:C606(CC_bo_EncryptedCCnum; 0)
	$_l_offset:=0
	COPY BLOB:C558([xCreditCardDetails:132]CardNumber:9; CC_bo_EncryptedCCnum; $_l_offset; $_l_offset; $_l_BlobSize)
	DECRYPT BLOB:C690(CC_bo_EncryptedCCnum; CC_blb_vvv108013)
	CC_T_CCX99999999999:=BLOB to text:C555(CC_bo_EncryptedCCnum; 3)
	Repeat 
		$_l_CharacterPosition:=Position:C15("  "; CC_T_CCX99999999999)
		If ($_l_CharacterPosition>0)
			CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; "  "; " ")
		End if 
	Until ($_l_CharacterPosition=0)
	
Else 
	CC_T_CCX99999999999:=""
End if 
ERR_MethodTrackerReturn("CCM_DecryptCardNumber"; $_t_oldMethodName)