If (False:C215)
	//object Name: [USER]CCM_CardsListing.Variable2
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
	//ARRAY DATE(CCM_ad_CardExpiries;0)
	//ARRAY LONGINT(CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(CC_al_CardOwnerXID;0)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	C_LONGINT:C283(CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_TEXT:C284($_t_oldMethodName; CC_t_CardOwnerName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_CardsListing.Variable2"; Form event code:C388)
If (CC_at_CardOwnerRange>0)
	If (CC_at_CardOwnerRange=1)
		ARRAY LONGINT:C221(CCM_al_CardRecordIDs; 0)
		ARRAY TEXT:C222(CCM_at_CardExpiries; 0)
		ARRAY TEXT:C222(CCM_at_CardTypes; 0)
		ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
		ARRAY TEXT:C222(CCM_at_CardNumbers; 0)
		ARRAY TEXT:C222(CCM_at_CardOwnerName; 0)
		
		ARRAY DATE:C224(CCM_ad_CardExpiries; 0)
		CC_t_CardOwnerName:=CC_at_CardOwnerRange{CC_at_CardOwnerRange}
		CCM_l_CurrentOwnerTable:=CC_al_CardOwnerTable{CC_at_CardOwnerRange}
		CCM_l_CurrentOwnerID:=CC_al_CardOwnerXID{CC_at_CardOwnerRange}
		CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
		
		CC_at_CardOwnerRange:=0
		
	Else 
		//only load 'company' cards
		ARRAY LONGINT:C221(CCM_al_CardRecordIDs; 0)
		ARRAY TEXT:C222(CCM_at_CardExpiries; 0)
		ARRAY TEXT:C222(CCM_at_CardTypes; 0)
		ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
		ARRAY TEXT:C222(CCM_at_CardNumbers; 0)
		ARRAY TEXT:C222(CCM_at_CardOwnerName; 0)
		
		ARRAY DATE:C224(CCM_ad_CardExpiries; 0)
		CC_t_CardOwnerName:=CC_at_CardOwnerRange{CC_at_CardOwnerRange}
		CCM_l_CurrentOwnerTable:=CC_al_CardOwnerTable{CC_at_CardOwnerRange}
		CCM_l_CurrentOwnerID:=CC_al_CardOwnerXID{CC_at_CardOwnerRange}
		CCM_LoadRelatedCards(-CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName)
		CC_at_CardOwnerRange:=0
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].CCM_CardsListing.Variable2"; $_t_oldMethodName)
