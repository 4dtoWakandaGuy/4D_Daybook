If (False:C215)
	//Table Form Method Name: Object Name:      [xCreditCardDetails].CARD_IN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardClasses;0)
	//ARRAY LONGINT(CCM_al_CardIssuers;0)
	//ARRAY LONGINT(CCM_al_CardOwnerClasses;0)
	//ARRAY LONGINT(CCM_al_CardTypes;0)
	//ARRAY TEXT(CCM_at_CardClasses;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardOwnerClasses;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	//ARRAY TEXT(CCM_at_MonthNames;0)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; <>CCM_bo_UseCoRef; DB_bo_NoLoad; INT_bo_SkinsPrefsLoaded)
	C_LONGINT:C283(<>PER_l_allowDecode; $_HL_MonthsList; $_l_AddedItemID; $_l_CardTypePosition; $_l_CurrentYear; $_l_Event; $_l_Index; $_l_index2; $_l_ListID; $_l_MonthID; $_l_MonthNumber)
	C_LONGINT:C283($_l_Security; bUnlock; CCM_HL_MonthPicker1; CCM_HL_MonthPicker2; CCM_l_RelatedCoID; CCM_l_RelatedRecordID; CCM_l_Relatedtable; CCM_RB_COMPANYCARD; CCM_Rb_PersonalCard)
	C_TEXT:C284($_t_MonthString; $_t_NameOnCard; $_t_oldMethodName; $_t_YearString; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_t_CardOwnerDetails; CCM_t_CardClass; CCM_t_CardClasses; CCM_t_StartDate; CCM_t_CardOwner)
	C_TEXT:C284(CCM_t_AddressLine1; CCM_t_AddressLine1OLD; CCM_t_AddressLine2; CCM_t_AddressLine2OLD; CCM_T_CardNumber; CCM_t_CardType; CCM_t_Country; CCM_t_CountryOLD; CCM_t_County; CCM_t_CountyOLD; CCM_t_EndDate)
	C_TEXT:C284(CCM_T_NameOnCard; CCM_T_OLDnameOnCard; CCM_t_PostalCode; CCM_t_PostalCodeOLD; CCM_t_Town; CCM_t_TownOLD; WIN_t_FormSettingsLoaded; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [xCreditCardDetails].CARD_IN"; Form event code:C388)
$_l_Event:=Form event code:C388


Case of 
	: ($_l_Event=On Header:K2:17)
		
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(<>CCM_bo_Inited))
			CCM_InitCreditCardModule
		Else 
			
		End if 
		OpenHelp(Table:C252(->[xCreditCardDetails:132]); "CARD IN")
		WS_AutoscreenSize(2; 460; 530)
		WIN_t_CurrentInputForm:="CARD IN"
		INT_SetInput(Table:C252(->[xCreditCardDetails:132]); WIN_t_CurrentInputForm)
		//If this is called from a company record or contact record this CCM_t_CardOwnerDetails will be set
		//Get the card owner class(company/personal)
		If ([xCreditCardDetails:132]RelatedTableNumber:12=0)
			[xCreditCardDetails:132]RelatedTableNumber:12:=CCM_l_Relatedtable
			[xCreditCardDetails:132]RelatedRecordIdent:13:=CCM_l_RelatedRecordID
		End if 
		If (<>PER_l_allowDecode=1) & (CCM_bo_CardDecode)
			OBJECT SET VISIBLE:C603(bUnlock; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(bUnlock; False:C215)
		End if 
		CCM_t_CardType:=""
		CCM_t_CardOwnerDetails:=""
		CCM_Rb_PersonalCard:=1
		CCM_Rb_CompanyCard:=0
		ARRAY LONGINT:C221(CCM_al_CardOwnerClasses; 2)
		ARRAY TEXT:C222(CCM_at_CardOwnerClasses; 2)
		CCM_al_CardOwnerClasses{1}:=1
		CCM_al_CardOwnerClasses{2}:=2
		CCM_at_CardOwnerClasses{1}:="Company"
		CCM_at_CardOwnerClasses{2}:="Personal"
		If (CCM_t_CardOwnerDetails="")
			Case of 
				: ([xCreditCardDetails:132]RelatedTableNumber:12=Table:C252(->[CONTACTS:1]))
					If ([xCreditCardDetails:132]RelatedRecordIdent:13#[CONTACTS:1]x_ID:33)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[xCreditCardDetails:132]RelatedRecordIdent:13)
					End if 
					If ([xCreditCardDetails:132]CardHolderClass:2>0)
						Case of 
							: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Company")})
								//This is a company card so company might matter
								
								QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[xCreditCardDetails:132]); *)
								QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=[xCreditCardDetails:132]x_ID:1)
								If (Records in selection:C76([AddressRecords:125])=0)
									If (CCM_l_RelatedCoID>0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=CCM_l_RelatedCoID)
									Else 
										//First company
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
									End if 
									
									CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31+", "+[COMPANIES:2]Company_Name:2
									CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]Company_Name:2+Char:C90(13)+[COMPANIES:2]ADDRESS:60
									CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
									CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
									CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
									CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
									CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
									CCM_t_CountryOLD:=[COMPANIES:2]Country:8
									
								Else 
									CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31+", "+[COMPANIES:2]Company_Name:2
									If ([AddressRecords:125]FormattedAddress:12="")
										CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]Company_Name:2+Char:C90(13)+WS_BUILDADDRESS([AddressRecords:125]AddressLine1:6; [AddressRecords:125]AddressLine2:7; [AddressRecords:125]Town_City:8; [AddressRecords:125]County_State:9; [AddressRecords:125]Postal_Code:10; [AddressRecords:125]Country:11)
									Else 
										CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
										
									End if 
								End if 
							: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Personal")})
								//this is a personal card so company does not matter
								
								QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[xCreditCardDetails:132]); *)
								QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=[xCreditCardDetails:132]x_ID:1)
								If (Records in selection:C76([AddressRecords:125])=0)
									If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
										
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
									End if 
									CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
									CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]ADDRESS:60
									CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
									CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
									CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
									CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
									CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
									CCM_t_CountryOLD:=[COMPANIES:2]Country:8
								Else 
									CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
									//CCM_t_CardOwnerDetails:=[CONTACTS]Contact_Name+Char(13)+[AddressRecords]FormattedAddress
									If ([AddressRecords:125]FormattedAddress:12="")
										CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+WS_BUILDADDRESS([AddressRecords:125]AddressLine1:6; [AddressRecords:125]AddressLine2:7; [AddressRecords:125]Town_City:8; [AddressRecords:125]County_State:9; [AddressRecords:125]Postal_Code:10; [AddressRecords:125]Country:11)
									Else 
										CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
										
									End if 
								End if 
								
							Else 
						End case 
						
					Else 
						
						
						
						QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[xCreditCardDetails:132]); *)
						QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=[xCreditCardDetails:132]x_ID:1)
						If (Records in selection:C76([AddressRecords:125])=0)
							If (CCM_l_RelatedCoID>0)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=CCM_l_RelatedCoID)
							Else 
								//First company
								If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
									
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								End if 
							End if 
							CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
							CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[COMPANIES:2]ADDRESS:60
							CCM_t_AddressLine1OLD:=[COMPANIES:2]Address_Line_one:3
							CCM_t_AddressLine2OLD:=[COMPANIES:2]Address_Line_two:4
							CCM_t_TownOLD:=[COMPANIES:2]Town_or_City:5
							CCM_t_CountyOLD:=[COMPANIES:2]County_or_State:6
							CCM_t_PostalCodeOLD:=[COMPANIES:2]Postal_Code:7
							CCM_t_CountryOLD:=[COMPANIES:2]Country:8
							
						Else 
							CCM_t_CardOwner:=[CONTACTS:1]Contact_Name:31
							CCM_t_CardOwnerDetails:=[CONTACTS:1]Contact_Name:31+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
							
						End if 
						
					End if 
					
					
			End case 
		End if 
		OBJECT SET VISIBLE:C603(*; "oCCMCardAddress@"; False:C215)
		Case of 
			: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Company")})
				CCM_Rb_CompanyCard:=1
				CCM_Rb_PersonalCard:=0
			: ([xCreditCardDetails:132]CardHolderClass:2=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Personal")})
				CCM_Rb_PersonalCard:=1
				CCM_Rb_CompanyCard:=0
		End case 
		If (Not:C34(<>CCM_bo_CompanyCards))
			OBJECT SET VISIBLE:C603(CCM_Rb_CompanyCard; False:C215)
			OBJECT SET VISIBLE:C603(CCM_Rb_PersonalCard; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCardOwnershiplabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCardReferencelabel"; False:C215)
			OBJECT SET VISIBLE:C603([xCreditCardDetails:132]CompanyReference:17; False:C215)
		Else 
			If (Not:C34(<>CCM_bo_UseCoRef))
				OBJECT SET VISIBLE:C603(*; "oCardReferencelabel"; False:C215)
				OBJECT SET VISIBLE:C603([xCreditCardDetails:132]CompanyReference:17; False:C215)
				
			End if 
		End if 
		
		CCM_t_CardClasses:=""
		ARRAY TEXT:C222(CCM_at_CardClasses; 2)
		ARRAY LONGINT:C221(CCM_al_CardClasses; 2)
		CCM_at_CardClasses{1}:="Debit Card"
		CCM_at_CardClasses{2}:="Credit Card"
		CCM_al_CardClasses{1}:=1
		CCM_al_CardClasses{2}:=2
		
		If ([xCreditCardDetails:132]CardClass:3>0)
			$_l_CardTypePosition:=Find in array:C230(CCM_al_CardClasses; [xCreditCardDetails:132]CardClass:3)
			If ($_l_CardTypePosition>0)
				CCM_t_CardClass:=CCM_at_CardClasses{$_l_CardTypePosition}  //Set the string
				OBJECT SET VISIBLE:C603(*; "oCCM_CardClass@"; False:C215)  //hide the pop-up
				//Note: Under the ? on screen will be a change option which will set it back to visible
			End if 
		Else 
			CCM_t_CardClass:=""
			OBJECT SET VISIBLE:C603(*; "oCCM_CardClass@"; True:C214)
		End if 
		ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
		ARRAY LONGINT:C221(CCM_al_CardIssuers; 0)
		$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->CCM_al_CardIssuers; False:C215)
		ARRAY TEXT:C222(CCM_at_CardTypes; 0)
		ARRAY LONGINT:C221(CCM_al_CardTypes; 0)
		$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; False:C215)
		If (Size of array:C274(CCM_al_CardTypes)=0)
			$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_TypeNUM:4; "Visa"; "Amex"; "Mastercard")
		End if 
		If (User in group:C338(Current user:C182; "Administrator"))
			$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; True:C214)
		Else 
			OBJECT SET ENTERABLE:C238(CCM_t_CardType; False:C215)
		End if 
		
		If ([xCreditCardDetails:132]Card_TypeNUM:4>0)
			$_l_CardTypePosition:=Find in array:C230(CCM_al_CardTypes; [xCreditCardDetails:132]Card_TypeNUM:4)
			If ($_l_CardTypePosition>0)
				CCM_t_CardType:=CCM_at_CARDTYPES{$_l_CardTypePosition}  //Set the string
				OBJECT SET VISIBLE:C603(*; "oCCM_Cardtype@"; False:C215)  //hide the pop-up
				//Note: Under the ? on screen will be a change option which will set it back to visible
			End if 
		Else 
			CCM_t_CardType:=""
			OBJECT SET VISIBLE:C603(*; "oCCM_CardClass@"; True:C214)
		End if 
		
		//Set theCC
		If ([xCreditCardDetails:132]StartDate:7#!00-00-00!)
			$_l_MonthNumber:=Month of:C24([xCreditCardDetails:132]StartDate:7)
			If ($_l_MonthNumber<10)
				$_t_MonthString:="0"+String:C10($_l_MonthNumber)
			Else 
				$_t_MonthString:=String:C10($_l_MonthNumber)
			End if 
			$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]StartDate:7))
			If (Length:C16($_t_YearString)>3)
				$_t_YearString:=Substring:C12($_t_YearString; 3; Length:C16($_t_YearString))
			End if 
			
			
			CCM_t_StartDate:=$_t_MonthString+"/"+$_t_YearString
		Else 
			CCM_t_StartDate:=""
		End if 
		
		If ([xCreditCardDetails:132]EndDate:8#!00-00-00!)
			$_l_MonthNumber:=Month of:C24([xCreditCardDetails:132]EndDate:8)
			If ($_l_MonthNumber<10)
				$_t_MonthString:="0"+String:C10($_l_MonthNumber)
			Else 
				$_t_MonthString:=String:C10($_l_MonthNumber)
				
			End if 
			$_t_YearString:=String:C10(Year of:C25([xCreditCardDetails:132]EndDate:8))
			If (Length:C16($_t_YearString)>3)
				$_t_YearString:=Substring:C12($_t_YearString; 3; Length:C16($_t_YearString))
			End if 
			
			
			CCM_t_EndDate:=$_t_MonthString+"/"+$_t_YearString
		Else 
			CCM_t_EndDate:=""
		End if 
		
		
		CCM_DecryptCardNumber  //Note this does not return a value it sets a specific variable
		
		//DO NOT PUBLISH THAT VARIABLE NAME ANYWHERE
		$_t_NameOnCard:=CCM_DecryptCardName
		//Only display the number if....security--actually only the last 4 digits
		$_l_Security:=4
		If (Length:C16(CC_T_CCX99999999999)>0)
			For ($_l_index2; 1; Length:C16(CC_T_CCX99999999999))
				If (CC_T_CCX99999999999[[$_l_index2]]=" ")
					$_l_Security:=(Length:C16(CC_T_CCX99999999999))-$_l_index2
				End if 
			End for 
		End if 
		
		CCM_T_CardNumber:=""
		If (CC_T_CCX99999999999#"")
			For ($_l_index2; 1; (Length:C16(CC_T_CCX99999999999)-$_l_Security))
				If (CC_T_CCX99999999999[[$_l_index2]]#" ")
					CCM_T_CardNumber:=CCM_T_CardNumber+"X"
				Else 
					CCM_T_CardNumber:=CCM_T_CardNumber+" "
				End if 
			End for 
			
		End if 
		If ($_l_Security>0) & (CC_T_CCX99999999999#"")
			CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_Security); (Length:C16(CC_T_CCX99999999999)))
		End if 
		CCM_T_NameOnCard:=$_t_NameOnCard
		CCM_T_OLDnameOnCard:=CCM_T_NameOnCard
		ARRAY TEXT:C222(CCM_at_MonthNames; 12)
		CCM_at_MonthNames{1}:="January"
		CCM_at_MonthNames{2}:="Febuary"
		CCM_at_MonthNames{3}:="March"
		CCM_at_MonthNames{4}:="April"
		CCM_at_MonthNames{5}:="May"
		CCM_at_MonthNames{6}:="June"
		CCM_at_MonthNames{7}:="July"
		CCM_at_MonthNames{8}:="August"
		CCM_at_MonthNames{9}:="September"
		CCM_at_MonthNames{10}:="October"
		CCM_at_MonthNames{11}:="November"
		CCM_at_MonthNames{12}:="December"
		$_l_CurrentYear:=Year of:C25(Current date:C33(*))
		$_l_MonthID:=0
		CCM_HL_MonthPicker1:=New list:C375
		For ($_l_Index; 5; 1; -1)
			$_t_YearString:=String:C10($_l_CurrentYear-($_l_Index-1))
			$_HL_MonthsList:=New list:C375
			For ($_l_index2; 1; 12)
				$_l_MonthID:=Num:C11($_t_YearString+String:C10($_l_index2))
				APPEND TO LIST:C376($_HL_MonthsList; CCM_at_MonthNames{$_l_index2}; $_l_MonthID)
			End for 
			APPEND TO LIST:C376(CCM_HL_MonthPicker1; $_t_YearString; Num:C11($_t_YearString); $_HL_MonthsList; True:C214)
		End for 
		CCM_HL_MonthPicker2:=New list:C375
		For ($_l_Index; 1; 10)
			$_t_YearString:=String:C10($_l_CurrentYear+($_l_Index-1))
			$_HL_MonthsList:=New list:C375
			For ($_l_index2; 1; 12)
				$_l_MonthID:=Num:C11($_t_YearString+String:C10($_l_index2))
				APPEND TO LIST:C376($_HL_MonthsList; CCM_at_MonthNames{$_l_index2}; $_l_MonthID)
			End for 
			
			APPEND TO LIST:C376(CCM_HL_MonthPicker2; $_t_YearString; Num:C11($_t_YearString); $_HL_MonthsList; True:C214)
		End for 
		Companies_vAT2(->CCM_t_Country)
		Macro_AccType("Load "+String:C10(Table:C252(->[xCreditCardDetails:132])))
		
		
		
	: ($_l_Event=On Data Change:K2:15)
		
	: ($_l_Event=On Outside Call:K2:11)
		
End case 
ERR_MethodTrackerReturn("FM [xCreditCardDetails].CARD_IN"; $_t_oldMethodName)
