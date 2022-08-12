If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.Variable16
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
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_BOOLEAN:C305($_bo_CarAdded)
	C_LONGINT:C283(CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CC_CreditCardProcessor.Variable16"; Form event code:C388)
HIDE WINDOW:C436
$_bo_CarAdded:=CCM_AddRecord(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID)
CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ [USER].CC_CreditCardProcessor.Variable16"; $_t_oldMethodName)
