If (False:C215)
	//object Name: [USER]CCM_CardsListing.oCCM_CardListing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/03/2010 10:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; CCM_T_Warning)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_CardsListing.oCCM_CardListing"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			
			
			If (CCM_at_AVSFailCodes{$_l_Row}#"")
				If (CCM_at_AVSFailCodes{$_l_Row}[[1]]="-")
					CCM_T_Warning:="There was an address verification problem with this address the "+Substring:C12(CCM_at_AVSFailCodes{$_l_Row}; 2; Length:C16(CCM_at_AVSFailCodes{$_l_Row}))+", you should try to correct this"
				Else 
					CCM_T_Warning:="There was an address verification problem with this address the "+CCM_at_AVSFailCodes{$_l_Row}+", you should try to correct this"
				End if 
			Else 
				CCM_T_Warning:=""
			End if 
		End if 
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			CCM_EditRecord(CCM_al_CardRecordIDs{$_l_Row})
			CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_CardsListing.oCCM_CardListing"; $_t_oldMethodName)
