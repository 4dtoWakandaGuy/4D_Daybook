If (False:C215)
	//Table Form Method Name: [USER]CC_CreditCardProcessor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 01:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CCM_lb_Cards;0)
	//ARRAY DATE(CCM_ad_CardExpiries;0)
	//ARRAY LONGINT(CCM_al_CardOwnerIDRange;0)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_BOOLEAN:C305(CCM_bo_HideAuth; CCM_bo_isCredit; CCM_bo_IsLicenced; CCM_bo_PaymentTaken; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ArraySize; $_l_CardIDRow; $_l_cardIDtoAuth; $_l_event; $_l_Height; bCardRecord; BGetAuth; Bpay; CCM_l_BUT1; CCM_l_But2; CCM_l_BUT3)
	C_LONGINT:C283(CCM_l_BUT4; CCM_l_BUT5; CCM_l_BUT6; CCM_l_BUT7; CCM_l_BUT8; CCM_l_BUT9; CCM_l_cardIDtoAuth; CCM_l_CardToUse; CCM_l_CCAuditID; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_LONGINT:C283(CCM_l_PreAuthID)
	C_REAL:C285(CCM_R_AuthAmount; CCM_R_TotalAuthAvailable)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode; CC_T_CardNumber; CC_t_CardType; CC_T_NameonCard; CCM_t_CardIssuer; CCM_t_CardOwnerName; CCM_t_CardType; CCM_t_COL1; CCM_t_COL2; CCM_t_COL3)
	C_TEXT:C284(CCM_t_COL4; CCM_t_COL5; CCM_t_COL6; CCM_t_COL7; CCM_t_COL8; CCM_T_Warning)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CC_CreditCardProcessor"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		SHOW PROCESS:C325(Current process:C322)
		BRING TO FRONT:C326(Current process:C322)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "CC_CreditCardProcessor")
		SET TIMER:C645(60*20)  // 200 seconds
		CC_t_AuthCode:=""
		CCM_R_AuthAmount:=0
		$_l_cardIDtoAuth:=0
		If (CCM_l_PreAuthID>0)  //this is an invoice or order auth already made
			
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=CCM_l_PreAuthID)
			CC_t_AuthCode:=[CC_OrderAuths:133]AuthorizationCode:6
			CCM_R_AuthAmount:=[CC_OrderAuths:133]AuthorizationAmount:5
			$_l_cardIDtoAuth:=[CC_OrderAuths:133]CC_RecordID:3
			OBJECT SET VISIBLE:C603(BGetAuth; False:C215)
			
		End if 
		If (CCM_bo_HideAuth)
			OBJECT SET VISIBLE:C603(BGetAuth; False:C215)
		End if 
		
		
		If (Size of array:C274(CC_at_CardOwnerRange)=1)
			ARRAY TEXT:C222(CC_at_CardOwnerRange; 0)
		End if 
		ARRAY LONGINT:C221(CCM_al_CardOwnerIDRange; 0)
		ARRAY LONGINT:C221(CCM_al_CardRecordIDs; 0)
		ARRAY TEXT:C222(CCM_at_CardExpiries; 0)
		ARRAY TEXT:C222(CCM_at_CardTypes; 0)
		ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
		ARRAY TEXT:C222(CCM_at_CardNumbers; 0)
		ARRAY TEXT:C222(CCM_at_CardOwnerName; 0)
		ARRAY TEXT:C222(CCM_at_AVSFailCodes; 0)
		CCM_T_Warning:=""
		CCM_bo_PaymentTaken:=False:C215
		ARRAY DATE:C224(CCM_ad_CardExpiries; 0)
		
		
		CCM_LoadRelatedCards(CCM_l_CurrentOwnerTable; CCM_l_CurrentOwnerID; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
		If ($_l_cardIDtoAuth=0)
			$_l_cardIDtoAuth:=CCM_l_CardToUse
		End if 
		CCM_l_CardToUse:=0
		CCM_t_CardType:=""
		CCM_t_CardType:=""
		
		CC_T_NameonCard:=""
		CC_T_CardNumber:=""
		
		$_l_ArraySize:=Size of array:C274(CCM_at_CardTypes)
		$_l_Height:=12*$_l_ArraySize
		If ($_l_Height>108)
			$_l_Height:=108
		End if 
		CCM_bo_isCredit:=False:C215
		If (CCM_R_TotalAuthAvailable>0) & (CCM_R_AuthAmount=0)
			CCM_R_AuthAmount:=CCM_R_TotalAuthAvailable  //default to the total amount
		Else 
			If (CCM_R_AuthAmount=0)
				CCM_R_AuthAmount:=Abs:C99(CCM_R_TotalAuthAvailable)
			End if 
			OBJECT SET VISIBLE:C603(BGetAuth; False:C215)
			If (CC_t_AuthCode="")  //if the auth code is filled in we are viewing an auth.
				OBJECT SET TITLE:C194(Bpay; "Make Payment")
				CCM_bo_isCredit:=True:C214
			End if 
		End if 
		If (Size of array:C274(CC_at_CardOwnerRange)>1)
			OBJECT SET VISIBLE:C603(CC_at_CardOwnerRange; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCCM_Cardowner_Picture"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(CC_at_CardOwnerRange; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCCM_Cardowner_Picture"; False:C215)
		End if 
		If ($_l_cardIDtoAuth>0)
			$_l_CardIDRow:=Find in array:C230(CCM_al_CardRecordIDs; $_l_cardIDtoAuth)
			If ($_l_CardIDRow>0)
				CCM_t_CardType:=CCM_at_CardTypes{$_l_CardIDRow}
				CCM_t_CardIssuer:=CCM_at_CardIssuers{$_l_CardIDRow}
				CC_T_NameonCard:=CCM_at_CardOwnerName{$_l_CardIDRow}
				CC_T_CardNumber:=CCM_at_CardNumbers{$_l_CardIDRow}
				CCM_l_cardIDtoAuth:=CCM_al_CardRecordIDs{$_l_CardIDRow}
				If (CCM_at_AVSFailCodes{$_l_CardIDRow}#"")
					If (CCM_at_AVSFailCodes{$_l_CardIDRow}[[1]]="-")
						CCM_T_Warning:="There was an address verification problem with this address the "+Substring:C12(CCM_at_AVSFailCodes{$_l_CardIDRow}; 2; Length:C16(CCM_at_AVSFailCodes{$_l_CardIDRow}))+", you should try to correct this"
					Else 
						CCM_T_Warning:="There was an address verification problem with this address the "+CCM_at_AVSFailCodes{$_l_CardIDRow}+", you should try to correct this"
					End if 
				Else 
					CCM_T_Warning:=""
				End if 
				CCM_at_CardTypes:=$_l_CardIDRow
				CCM_at_CardIssuers:=$_l_CardIDRow
				CCM_at_CardOwnerName:=$_l_CardIDRow
				CCM_at_CardNumbers:=$_l_CardIDRow
				CCM_al_CardRecordIDs:=$_l_CardIDRow
			End if 
			
		End if 
		If (Not:C34(CCM_bo_IsLicenced))
			OBJECT SET VISIBLE:C603(BGetAuth; False:C215)
			OBJECT SET VISIBLE:C603(Bpay; False:C215)
			OBJECT SET ENTERABLE:C238(CC_t_AuthCode; True:C214)
			CCM_l_CCAuditID:=-91234
			OBJECT SET VISIBLE:C603(bCardRecord; True:C214)
			
		Else 
			OBJECT SET VISIBLE:C603(bCardRecord; False:C215)
		End if 
		
		LB_SetupListbox(->CCM_lb_Cards; "CCM_t"; "CCM_L"; 1; ->CCM_at_CardTypes; ->CCM_at_CardIssuers; ->CCM_at_CardNumbers; ->CCM_at_CardExpiries; ->CCM_al_CardRecordIDs; ->CCM_at_CardOwnerName; ->CCM_at_AVSFailCodes)
		
		LB_SetColumnHeaders(->CCM_lb_Cards; "CCM_L"; 1; "Type"; "Issued By"; "Card Number"; "Expires")
		LB_SetColumnWidths(->CCM_lb_Cards; "CCM_t"; 1; 109; 109; 162; 69)
		LB_SetEnterable(->CCM_lb_Cards; False:C215; 0)
		LB_SetScroll(->CCM_lb_Cards; -3; -2)
		LB_StyleSettings(->CCM_lb_Cards; "Black"; 9; "CCM_t"; ->[COMPANIES:2])
		
		
		
		WS_AutoscreenSize(3; 405; 538)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM:CC_CreditCardProcessor"; $_t_oldMethodName)
