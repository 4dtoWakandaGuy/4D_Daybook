//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetResponseValidFromTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(CCM_Bl_TransResponse)
	C_BOOLEAN:C305($0; CCM_bo_OfflineHandling)
	C_LONGINT:C283($_l_CCMID; $_l_StringPosition; $1)
	C_TEXT:C284($_t_AuthorizationCode; $_t_oldMethodName; $_t_oldMethodName2; $_t_RequestModule; $_t_ResponseCode; $_t_ResponseReasonCodeSTR; $_t_ResponseText; $_t_TransactionDetails; $CCM_T_Response; $ValidResponse)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_GetResponseValidFromTrans")

$0:=False:C215
If (Count parameters:C259>=1)
	$_l_CCMID:=$1
	If ($_l_CCMID>0)
		If ([CCM_PSPTransaction:136]x_ID:1#$_l_CCMID)
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCMID)
		End if 
		$_t_ResponseCode:=""
		$_t_AuthorizationCode:=""
		$CCM_T_Response:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
		Case of 
			: ([CCM_PSPTransaction:136]PSPUSED:4="DUMMY")
				$0:=True:C214
			: ([CCM_PSPTransaction:136]PSPUSED:4="Transax")
				$_t_ResponseCode:=(CCM_ExtractField("Transax"; "STATUS_CODE"; $CCM_T_Response; "|"; 1; ->CCM_Bl_TransResponse))
				Case of 
					: ($_t_ResponseCode="1")  // card is accepted
						
						$0:=True:C214
					: ($_t_ResponseCode="2")  // card is declined
						//If ($_t_ResponseReasonCodeSTR#"27")
						$0:=False:C215
						//Else
						//$0:=True
						//End if
					: ($_t_ResponseCode="10")  //error in card handling
						$0:=False:C215
						
					: ($_t_ResponseCode="20")
						$0:=False:C215
						
				End case 
				
			: ([CCM_PSPTransaction:136]PSPUSED:4="Authorize Net")
				If (Not:C34(CCM_bo_OfflineHandling))  //set this to true so we can test logic without using AN
					$_t_ResponseCode:=CCM_ExtractField("Authorize Net"; "Response Code"; $CCM_T_Response)
					$_t_ResponseReasonCodeSTR:=CCM_ExtractField("Authorize Net"; "Response Reason Code"; $CCM_T_Response)
				Else 
					$_t_ResponseCode:="1"
					$_t_ResponseReasonCodeSTR:=""
				End if 
				
				$_t_oldMethodName2:=ERR_MethodTracker("Response string ="+$_t_ResponseCode)
				Case of 
					: ($_t_ResponseCode="1")  // card is accepted
						
						$0:=True:C214
					: ($_t_ResponseCode="2")  // card is declined
						//If ($_t_ResponseReasonCodeSTR#"27")
						$0:=False:C215
						//Else
						//$0:=True
						//End if
					: ($_t_ResponseCode="3")  //error in card handling
						$0:=False:C215
					: ($_t_ResponseCode="4")  //transaction being held for review
						$0:=False:C215
						Gen_Confirm("This card transaction is held for review. Would you like to set the payment as re"+"ceived on Daybook?"; "NO"; "YES")
						If (OK=0)
							$0:=True:C214
						End if 
						OK:=1
						//maybe an alert here!
					: ($_t_ResponseCode="-1")
						$0:=False:C215
						
				End case 
			: ([CCM_PSPTransaction:136]PSPUSED:4="Paypal")
				//TRACE
				//Here get the response data string
				$_l_StringPosition:=Position:C15("END REQUEST TYPE"; $CCM_T_Response)
				$_t_RequestModule:=Substring:C12($CCM_T_Response; 1; $_l_StringPosition-1)
				$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_StringPosition+Length:C16("END REQUEST TYPE"))
				$_l_StringPosition:=Position:C15("END REQUEST RESPONSE"; $CCM_T_Response)
				$_t_ResponseText:=Substring:C12($CCM_T_Response; 1; $_l_StringPosition-1)
				$CCM_T_Response:=Substring:C12($CCM_T_Response; $_l_StringPosition+Length:C16("END REQUEST RESPONSE"))
				$_l_StringPosition:=Position:C15("END TRANSACTION DETAILS"; $CCM_T_Response)
				$_t_TransactionDetails:=Substring:C12($CCM_T_Response; 1; $_l_StringPosition-1)
				$_t_ResponseCode:=CCM_ExtractField("Paypal"; "PaymentStatus"; $_t_TransactionDetails; "Transaction")
				//$ResponseString:=CCM_ExtractField ("Paypal";"PendingReason";$_t_TransactionDetails)
				//Note that with paypal here we have recorded the detail as at the time of capture.-in the context of how i am using this here this is ok
				//however the detail of the transaction could change-for example if you take the payment so this is only from the snapshot
				Case of 
						
					: ($_t_ResponseCode="None")
						$0:=False:C215
					: ($_t_ResponseCode="Canceled-Reversal")
						$0:=False:C215
					: ($_t_ResponseCode="Completed")
						$0:=True:C214
					: ($_t_ResponseCode="Denied")
						$0:=False:C215
					: ($_t_ResponseCode="Expired")
						$0:=False:C215
					: ($_t_ResponseCode="Failed")
						$0:=False:C215
						
					: ($_t_ResponseCode="In-Progress")
						$0:=True:C214
					: ($_t_ResponseCode="Partially-Redunded")
						$0:=True:C214
					: ($_t_ResponseCode="Pending")
						$0:=True:C214
					: ($_t_ResponseCode="Refunded")
						$0:=True:C214
					: ($_t_ResponseCode="Reversed")
						$0:=True:C214
					: ($_t_ResponseCode="Processed")
						$0:=True:C214
					: ($_t_ResponseCode="Voided")
						$0:=True:C214
				End case 
				
		End case 
		
		
	Else 
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("CCM_GetResponseValidFromTrans"; $_t_oldMethodName)