//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetAuthCodeFromTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/07/2012 08:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CCM_bo_OfflineHandling)
	C_LONGINT:C283($_l_CCMID; $_l_CharacterPosition; $1; CCM_l_authCode)
	C_TEXT:C284($_t_AuthorizationCode; $_t_CCMResponse; $_t_CCMResponseText; $_t_CCMTransactionDetails; $_t_oldMethodName; $_t_RequestModule; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetAuthCodeFromTrans")
If (Count parameters:C259>=1)
	$_l_CCMID:=$1
	If ($_l_CCMID>0)
		If ([CCM_PSPTransaction:136]x_ID:1#$_l_CCMID)
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCMID)
		End if 
		$_t_AuthorizationCode:=""
		$_t_CCMResponse:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
		Case of 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
				If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
					
					$_t_AuthorizationCode:=CCM_ExtractField("Transax"; "AUTH_CODE"; $_t_CCMResponse; "| "; 1; ->[CCM_PSPTransaction:136]RESPONSEDATA:7)
				Else 
					CCM_l_authCode:=0
					$_t_AuthorizationCode:=String:C10(AA_GetNextID(->CCM_l_authCode; 1000))
				End if 
				
			: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
				If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
					
					$_t_AuthorizationCode:=CCM_ExtractField("Authorize Net"; "Approval Code"; $_t_CCMResponse)
				Else 
					CCM_l_authCode:=0
					$_t_AuthorizationCode:=String:C10(AA_GetNextID(->CCM_l_authCode; 1000))
				End if 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
				$_l_CharacterPosition:=Position:C15("END REQUEST TYPE"; $_t_CCMResponse)
				$_t_RequestModule:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
				$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST TYPE"))
				$_l_CharacterPosition:=Position:C15("END REQUEST RESPONSE"; $_t_CCMResponse)
				$_t_CCMResponseText:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
				$_t_CCMResponse:=Substring:C12($_t_CCMResponse; $_l_CharacterPosition+Length:C16("END REQUEST RESPONSE"))
				$_l_CharacterPosition:=Position:C15("END TRANSACTION DETAILS"; $_t_CCMResponse)
				$_t_CCMTransactionDetails:=Substring:C12($_t_CCMResponse; 1; $_l_CharacterPosition-1)
				$_t_AuthorizationCode:=CCM_ExtractField("Paypal"; "CorrelationID"; $_t_CCMTransactionDetails; "Transaction")
				//$ResponseString:=CCM_ExtractField ("Paypal";"PendingReason";$_t_CCMTransactionDetails)
				//Note that with paypal here we have recorded the detail as at the time of capture.-in the context of how i am using this here this is ok
				//however the detail of the transaction could change-for example if you take the payment so this is only from the snapshot
		End case 
		$0:=$_t_AuthorizationCode
	Else 
		$0:="9999"
	End if 
	
Else 
	$0:=$_t_AuthorizationCode
End if 
ERR_MethodTrackerReturn("CCM_GetAuthCodeFromTrans"; $_t_oldMethodName)