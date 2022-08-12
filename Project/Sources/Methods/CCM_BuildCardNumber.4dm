//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_BuildCardNumber
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
	C_LONGINT:C283($_l_BlobSIze; $_l_Characterindex; $_l_CharacterPositon; $_l_offset)
	C_TEXT:C284($_t_oldMethodName; $0; $1; CC_T_CCX99999999999; CCM_T_Card901Number)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_BuildCardNumber")
If (Count parameters:C259>=1)
	CCM_T_Card901Number:=$1
	CC_GetEncryptionKeys
	If (BLOB size:C605([xCreditCardDetails:132]CardNumber:9)>0)
		$_l_BlobSIze:=BLOB size:C605([xCreditCardDetails:132]CardNumber:9)
		SET BLOB SIZE:C606(CC_bo_EncryptedCCnum; 0)
		$_l_offset:=0
		//The encrpytion keys are generated on the server at startup and remain static
		COPY BLOB:C558([xCreditCardDetails:132]CardNumber:9; CC_bo_EncryptedCCnum; $_l_offset; $_l_offset; $_l_BlobSIze)
		DECRYPT BLOB:C690(CC_bo_EncryptedCCnum; CC_blb_vvv108013)
		CC_T_CCX99999999999:=BLOB to text:C555(CC_bo_EncryptedCCnum; 3)
		Repeat 
			$_l_CharacterPositon:=Position:C15("  "; CC_T_CCX99999999999)
			If ($_l_CharacterPositon>0)
				CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; "  "; " ")
			End if 
		Until ($_l_CharacterPositon=0)
		
	Else 
		CC_T_CCX99999999999:=CCM_T_Card901Number
		Repeat 
			$_l_CharacterPositon:=Position:C15("  "; CC_T_CCX99999999999)
			If ($_l_CharacterPositon>0)
				CC_T_CCX99999999999:=Replace string:C233(CC_T_CCX99999999999; "  "; " ")
			End if 
		Until ($_l_CharacterPositon=0)
		
	End if 
	For ($_l_Characterindex; 1; Length:C16(CCM_T_Card901Number))
		If (Length:C16(CC_T_CCX99999999999)>=$_l_Characterindex)
			If (CCM_T_Card901Number[[$_l_Characterindex]]="X")
				CCM_T_Card901Number[[$_l_Characterindex]]:=CC_T_CCX99999999999[[$_l_Characterindex]]
			End if 
		End if 
	End for 
	$0:=CCM_T_Card901Number
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("CCM_BuildCardNumber"; $_t_oldMethodName)