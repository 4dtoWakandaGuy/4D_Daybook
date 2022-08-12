If (False:C215)
	//object Name: [USER]CCM_CardsListing.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/03/2010 09:51
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
	C_BOOLEAN:C305($_bo_CardAdded)
	C_LONGINT:C283($_l_ArraySIze; $_l_Height; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_REAL:C285(CCM_R_AuthAmount; CCM_R_TotalAuthAvailable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_CardsListing.Variable7"; Form event code:C388)
//HIDE WINDOW
$_bo_CardAdded:=CCM_AddRecord(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID)
CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
$_l_ArraySIze:=Size of array:C274(CCM_at_CardTypes)
$_l_Height:=12*$_l_ArraySIze
Case of 
	: ($_l_Height>508)
		$_l_Height:=508
	: ($_l_Height<218)
		$_l_Height:=218
End case 

//CLOSE WINDOW

//SHOW WINDOW
//HIDE PROCESS(Current process)
//SHOW PROCESS(Current process)


//Open window((Screen width/2);(Screen width/2);(Screen width/2);(Screen width/2);4)
//CLOSE WINDOW
//CON_ShowCards
//WS_AutoscreenSize (3;$_l_Height-1;537)
CCM_R_AuthAmount:=CCM_R_TotalAuthAvailable  //default to the total amount
//WS_AutoscreenSize (3;$_l_Height;538)
ERR_MethodTrackerReturn("OBJ:CCM_CardsListing,baddCard"; $_t_oldMethodName)
