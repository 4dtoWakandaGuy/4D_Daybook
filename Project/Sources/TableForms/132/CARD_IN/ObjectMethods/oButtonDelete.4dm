If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.oButtonDelete
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oButtonDelete"; Form event code:C388)
Gen_Confirm("Are you sure you wish to delete this credit card?"; "No"; "Yes")
If (Ok=0)
	If ([xCreditCardDetails:132]x_ID:1>0)
		[xCreditCardDetails:132]xDeleted:18:=1
		CCM_bo_SaveCardDetails:=True:C214
		ACCEPT:C269
	Else 
		CCM_bo_SaveCardDetails:=False:C215
		CANCEL:C270
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oButtonDelete"; $_t_oldMethodName)
