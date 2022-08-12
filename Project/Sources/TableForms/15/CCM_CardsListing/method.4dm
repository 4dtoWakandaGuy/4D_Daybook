If (False:C215)
	//Table Form Method Name: [USER]CCM_CardsListing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 17:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_LB_Cards;0)
	//ARRAY DATE(CCM_ad_CardExpiries;0)
	//ARRAY LONGINT(CCM_al_CardOwnerIDRange;0)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	//ARRAY TEXT(CCM_at_CardOwnersRange;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_BOOLEAN:C305(<>CCM_bo_Inited; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ArraySize; $_l_event; $_l_Height; Bexit; CCM_l_BUT1; CCM_l_BUT10; CCM_l_BUT11; CCM_l_BUT12; CCM_l_BUT13; CCM_l_BUT14; CCM_l_BUT15)
	C_LONGINT:C283(CCM_l_BUT16; CCM_l_BUT17; CCM_l_BUT18; CCM_l_BUT19; CCM_l_BUT2; CCM_l_BUT20; CCM_l_BUT21; CCM_l_BUT22; CCM_l_BUT23; CCM_l_BUT24; CCM_l_BUT25)
	C_LONGINT:C283(CCM_l_BUT26; CCM_l_BUT27; CCM_l_BUT3; CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8; CCM_l_BUT9; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_REAL:C285(CCM_R_AuthAmount; CCM_R_TotalAuthAvailable)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; CCM_t_CardOwnerName; CCM_T_Warning; oCCM_COL1; oCCM_COL10; oCCM_COL11; oCCM_COL12; oCCM_COL13; oCCM_COL14; oCCM_COL15)
	C_TEXT:C284(oCCM_COL16; oCCM_COL17; oCCM_COL18; oCCM_COL19; oCCM_COL2; oCCM_COL20; oCCM_COL21; oCCM_COL22; oCCM_COL23; oCCM_COL24; oCCM_COL25)
	C_TEXT:C284(oCCM_COL26; oCCM_COL27; oCCM_COL3; oCCM_COL4; oCCM_COL5; oCCM_COL6; oCCM_COL7; oCCM_COL8; oCCM_COL9; oCCM_HED1; oCCM_HED10)
	C_TEXT:C284(oCCM_HED11; oCCM_HED12; oCCM_HED13; oCCM_HED14; oCCM_HED15; oCCM_HED16; oCCM_HED17; oCCM_HED18; oCCM_HED19; oCCM_HED2; oCCM_HED20)
	C_TEXT:C284(oCCM_HED21; oCCM_HED22; oCCM_HED23; oCCM_HED24; oCCM_HED25; oCCM_HED26; oCCM_HED27; oCCM_HED3; oCCM_HED4; oCCM_HED5; oCCM_HED6)
	C_TEXT:C284(oCCM_HED7; oCCM_HED8; oCCM_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CCM_CardsListing"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(<>CCM_bo_Inited))
			CCM_InitCreditCardModule
		End if 
		
		OpenHelp(Table:C252(->[USER:15]); "CCM_CardsListing")
		$_t_WindowTitle:=Get window title:C450
		Case of 
			: ($_t_WindowTitle="Select Card for payment")
				OBJECT SET TITLE:C194(Bexit; "Select")
		End case 
		
		ARRAY TEXT:C222(CCM_at_CardOwnersRange; 0)
		ARRAY LONGINT:C221(CCM_al_CardOwnerIDRange; 0)
		ARRAY LONGINT:C221(CCM_al_CardRecordIDs; 0)
		ARRAY TEXT:C222(CCM_at_CardExpiries; 0)
		ARRAY TEXT:C222(CCM_at_CardTypes; 0)
		ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
		ARRAY TEXT:C222(CCM_at_CardNumbers; 0)
		ARRAY TEXT:C222(CCM_at_CardOwnerName; 0)
		ARRAY DATE:C224(CCM_ad_CardExpiries; 0)
		ARRAY TEXT:C222(CCM_at_AVSFailCodes; 0)
		CCM_T_Warning:=""
		CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
		
		$_l_ArraySize:=Size of array:C274(CCM_at_CardTypes)
		$_l_Height:=12*$_l_ArraySize
		Case of 
			: ($_l_Height>508)
				$_l_Height:=508
			: ($_l_Height<218)
				$_l_Height:=238
		End case 
		
		If (Size of array:C274(CC_at_CardOwnerRange)>1)
			OBJECT SET VISIBLE:C603(CCM_at_CardOwnersRange; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCCM_Cardowner_Picture"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(CC_at_CardOwnerRange; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCCM_Cardowner_Picture"; False:C215)
		End if 
		//```
		//We will display fields
		
		//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
		LB_SetupListbox(->CCM_LB_Cards; "oCCM"; "CCM_L"; 1; ->CCM_at_CardTypes; ->CCM_at_CardIssuers; ->CCM_at_CardNumbers; ->CCM_at_CardExpiries; ->CCM_al_CardRecordIDs; ->CCM_at_CardOwnerName; ->CCM_at_AVSFailCodes)
		LB_SetColumnHeaders(->CCM_LB_Cards; "CCM_L"; 1; "Card Type"; "Issued by"; "Card Number"; "Expiry Date"; ""; ""; "")
		
		LB_SetColumnWidths(->CCM_LB_Cards; "oCCM"; 1; 109; 109; 162; 59; 0; 0; 0)
		LB_SetScroll(->CCM_LB_Cards; -3; -2)
		LB_SetEnterable(->CCM_LB_Cards; False:C215; 0; "")
		LB_StyleSettings(->CCM_LB_Cards; "Black"; 9; "COM_t"; ->[COMPANIES:2])
		
		//```
		CCM_R_AuthAmount:=CCM_R_TotalAuthAvailable  //default to the total amount
		WS_AutoscreenSize(3; $_l_Height; 538)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM:CCM_CardsListing"; $_t_oldMethodName)
