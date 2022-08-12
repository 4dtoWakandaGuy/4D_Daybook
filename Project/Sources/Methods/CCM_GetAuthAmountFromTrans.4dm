//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetAuthAmountFromTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/07/2012 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CCM_bo_OfflineHandling)
	C_LONGINT:C283($_l_EndRequestPosition; $_l_TransactionID; $1)
	C_REAL:C285($0)
	C_TEXT:C284($_t_AuthorizationAmountSTR; $_t_AuthorizationCode; $_t_oldMethodName; $_t_RequestModule; $_t_Response; $_t_ResponseText; $_t_SentDateSTR; $_t_TransactionDetails)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetAuthAmountFromTrans")
If (Count parameters:C259>=1)
	$_l_TransactionID:=$1
	If ($_l_TransactionID>0)
		If ([CCM_PSPTransaction:136]x_ID:1#$_l_TransactionID)
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_TransactionID)
		End if 
		$_t_AuthorizationCode:=""
		$_t_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
		$_t_SentDateSTR:=BLOB to text:C555([CCM_PSPTransaction:136]SENTDATA:6; 3)
		Case of 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
				//NG-the resonse data from transax does not contain the amount is in the Sent string
				If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using Transax
					$_t_AuthorizationAmountSTR:=CCM_ExtractField("Transax"; "Amount"; $_t_SentDateSTR; "|"; 2; ->[CCM_PSPTransaction:136]SENTDATA:6)
				Else 
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=[CCM_PSPTransaction:136]x_ID:1)
					$_t_AuthorizationAmountSTR:=String:C10([CC_OrderAuths:133]AuthorizationAmount:5)
				End if 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
				If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
					$_t_AuthorizationAmountSTR:=CCM_ExtractField("Authorize Net"; "Amount"; $_t_Response)
				Else 
					QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]TransactionID:10=[CCM_PSPTransaction:136]x_ID:1)
					$_t_AuthorizationAmountSTR:=String:C10([CC_OrderAuths:133]AuthorizationAmount:5)
				End if 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
				$_l_EndRequestPosition:=Position:C15("END REQUEST TYPE"; $_t_Response)
				$_t_RequestModule:=Substring:C12($_t_Response; 1; $_l_EndRequestPosition-1)
				$_t_Response:=Substring:C12($_t_Response; $_l_EndRequestPosition+Length:C16("END REQUEST TYPE"))
				$_l_EndRequestPosition:=Position:C15("END REQUEST RESPONSE"; $_t_Response)
				$_t_ResponseText:=Substring:C12($_t_Response; 1; $_l_EndRequestPosition-1)
				$_t_Response:=Substring:C12($_t_Response; $_l_EndRequestPosition+Length:C16("END REQUEST RESPONSE"))
				$_l_EndRequestPosition:=Position:C15("END TRANSACTION DETAILS"; $_t_Response)
				$_t_TransactionDetails:=Substring:C12($_t_Response; 1; $_l_EndRequestPosition-1)
				$_t_AuthorizationAmountSTR:=CCM_ExtractField("Paypal"; "Amount"; $_t_Response; $_t_RequestModule)
				
		End case 
		$0:=Num:C11($_t_AuthorizationAmountSTR)
	Else 
		$0:=0
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("CCM_GetAuthAmountFromTrans"; $_t_oldMethodName)