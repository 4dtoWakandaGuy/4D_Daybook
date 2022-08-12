If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.oButtonCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CCM_bo_SaveCardDetails)
	C_TEXT:C284($_t_oldMethodName; CCM_T_CardNumber)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oButtonCancel"; Form event code:C388)
If (CCM_T_CardNumber#"")
	If ([xCreditCardDetails:132]x_ID:1=0)
		Gen_Confirm("Are you sure you want to cancel this card"; "No"; "Yes")
		
		If (OK=0)
			CCM_bo_SaveCardDetails:=False:C215
			CANCEL:C270
		End if 
	Else 
		CCM_bo_SaveCardDetails:=False:C215
		CANCEL:C270
	End if 
Else 
	CCM_bo_SaveCardDetails:=False:C215
	CANCEL:C270
	
End if 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oButtonCancel"; $_t_oldMethodName)
