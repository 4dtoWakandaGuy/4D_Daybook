If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2010 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsOK; CCM_bo_CV2Retry; CCM_bo_DisableAVSTEMP)
	C_LONGINT:C283(CCM_l_cardIDtoAuth; CCM_l_CCAuditID; CCM_l_CurrentOwnerID; CCM_l_OrderID; CCM_l_RejectedID)
	C_REAL:C285(CCM_R_AuthAmount)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; CC_t_AuthCode; CC_T_CardNumber; CCM_t_CurrencyCode; CCM_t_InvoiceNumber)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]CC_CreditCardProcessor.Variable7"; Form event code:C388)

If (CC_T_CardNumber#"")
	
	If (CC_t_AuthCode="")
		If (CCM_R_AuthAmount>0)
			$_t_oldMethodName2:=ERR_MethodTracker("Getting auth "+String:C10(CCM_R_AuthAmount))
			
			CCM_l_CCAuditID:=CCMGetAuth(CCM_R_AuthAmount; CCM_t_CurrencyCode; CCM_l_cardIDtoAuth; CCM_l_CurrentOwnerID)
			If (CCM_l_CCAuditID>0)
				$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
				If ($_bo_IsOK)
					CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
					If (CC_t_AuthCode#"")
						
						OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
						
					End if 
				Else 
					CC_t_AuthCode:=""
				End if 
			Else 
				Case of 
					: (CCM_l_CCAuditID=-909)
						//Gen_Alert ("This received a 909. The daybook CCM record for the Rejected tranaction is "+String(CCM_l_RejectedID))
						CCM_l_CCAuditID:=0
						//AVS rejection
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
						
						
						//record the FAILED  but the amount was authd-NG 22/09/06 scrub that the card was declined--we will now reprocess with avs off'
						
						READ WRITE:C146([CC_OrderAuths:133])
						CREATE RECORD:C68([CC_OrderAuths:133])
						[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
						[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
						[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
						[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
						[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
						[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
						[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
						[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
						DB_SaveRecord(->[CC_OrderAuths:133])
						UNLOAD RECORD:C212([CC_OrderAuths:133])
						READ ONLY:C145([CC_OrderAuths:133])
						CCM_l_RejectedID:=0
						CCM_bo_DisableAVSTEMP:=True:C214
						CCM_l_CCAuditID:=CCMGetAuth(CCM_R_AuthAmount; CCM_t_CurrencyCode; CCM_l_cardIDtoAuth; CCM_l_CurrentOwnerID)
						If (CCM_l_CCAuditID>0)
							
							$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
							If ($_bo_IsOK)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
								If (CC_t_AuthCode#"")
									
									OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
									
								End if 
							Else 
								Gen_Alert("The response code in the CCM record is not ok")
							End if 
						Else 
							CC_t_AuthCode:=""
							Gen_Alert("The Auth method did not return an ID so the auth is not valid!")
						End if 
						CCM_bo_DisableAVSTEMP:=False:C215
					: (CCM_l_CCAuditID=-907)  // reject AVS but have to record AUTH
						//Gen_Alert ("This received a 907. The daybook CCM record for the Rejected tranaction is "+String(CCM_l_RejectedID)+". No retry will happen automatically")
						
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
						READ WRITE:C146([CC_OrderAuths:133])
						CREATE RECORD:C68([CC_OrderAuths:133])
						[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
						[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
						[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
						[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
						[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
						[CC_OrderAuths:133]xAuthStatus:7:=5  //awaiting payment(`and always will be!)
						[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
						[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
						DB_SaveRecord(->[CC_OrderAuths:133])
						UNLOAD RECORD:C212([CC_OrderAuths:133])
						READ ONLY:C145([CC_OrderAuths:133])
						CCM_l_RejectedID:=0
						
					: (CCM_l_CCAuditID=-908)
						//CVV2 Failure```
						CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_RejectedID)
						READ WRITE:C146([CC_OrderAuths:133])
						CREATE RECORD:C68([CC_OrderAuths:133])
						[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
						[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
						[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
						[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
						[CC_OrderAuths:133]Order_ID:2:=CCM_l_OrderID
						[CC_OrderAuths:133]xAuthStatus:7:=6  //awaiting payment(`and always will be!)
						[CC_OrderAuths:133]xinvoiceCode:9:=CCM_t_InvoiceNumber
						[CC_OrderAuths:133]TransactionID:10:=CCM_l_RejectedID
						DB_SaveRecord(->[CC_OrderAuths:133])
						UNLOAD RECORD:C212([CC_OrderAuths:133])
						READ ONLY:C145([CC_OrderAuths:133])
						
						//```
						CCM_l_CCAuditID:=0
						CCM_bo_CV2Retry:=True:C214
						//don't record this as an auth.
						CCM_l_CCAuditID:=CCMGetAuth(CCM_R_AuthAmount; CCM_t_CurrencyCode; CCM_l_cardIDtoAuth; CCM_l_CurrentOwnerID)
						If (CCM_l_CCAuditID>0)
							$_bo_IsOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
							If ($_bo_IsOK)
								CC_t_AuthCode:=CCM_GetAuthCodeFromTrans(CCM_l_CCAuditID)
								If (CC_t_AuthCode#"")
									
									OBJECT SET ENTERABLE:C238(CCM_R_AuthAmount; False:C215)
									
								End if 
							End if 
						Else 
							Gen_Alert("You may not retry a CVV2 again")
							CC_t_AuthCode:=""
						End if 
						CCM_bo_CV2Retry:=True:C214
				End case 
			End if 
			
		Else 
			Gen_Alert("You must enter an amount to authorize!")
			
		End if 
	Else 
		Gen_Alert("You have already authorized, you must exit this window and re-enter to do an addi"+"tional authorization")
	End if 
	
Else 
	Gen_Alert("You must select a card to use first!")
End if 
ERR_MethodTrackerReturn("OBJ:CC_CreditCardProcessor,BGetAuth"; $_t_oldMethodName)
