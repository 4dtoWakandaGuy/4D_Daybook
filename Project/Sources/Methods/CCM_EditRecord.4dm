//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_EditRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	C_BOOLEAN:C305(CCM_bo_SaveCardDetails; $0; CCM_bo_SaveCardDetails)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CurrentWinRefOLD; $_l_Index; $_l_RecordsinSelection; $1; CCM_l_RelatedRecordID; CCM_l_Relatedtable; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CardID; $_l_CharacterPosition)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_RecordsinSelection; CCM_l_RelatedRecordID; CCM_l_Relatedtable; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CardNumber; $_t_CardNumberNEW; $_t_ModifiedText; $_t_oldMethodName; CC_T_CCX99999999999; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_T_CardNumber; CCM_t_Country; CCM_t_County; CCM_T_OLDnameOnCard)
	C_TEXT:C284(CCM_t_PostalCode; CCM_t_Town; <>PER_t_CurrentUserName; $_t_CardNumber; $_t_CardNumberNEW; $_t_ModifiedText; $_t_oldMethodName; CC_T_CCX99999999999; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_T_CardNumber)
	C_TEXT:C284(CCM_t_Country; CCM_t_County; CCM_T_NameOnCard; CCM_T_OLDnameOnCard; CCM_t_PostalCode; CCM_t_Town)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_EditRecord")

$0:=False:C215
If (Count parameters:C259>=1)
	QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$1)
	CCM_t_AddressLine1:=""
	CCM_t_AddressLine2:=""
	CCM_t_Town:=""
	CCM_t_County:=""
	CCM_t_PostalCode:=""
	CCM_t_Country:=""
	
	If (Records in selection:C76([xCreditCardDetails:132])>0)
		
		
		CCM_l_Relatedtable:=[xCreditCardDetails:132]RelatedTableNumber:12
		CCM_l_RelatedRecordID:=[xCreditCardDetails:132]RelatedRecordIdent:13
		
		CCM_bo_SaveCardDetails:=False:C215
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
		READ WRITE:C146([xCreditCardDetails:132])
		//CREATE RECORD([XCreditCardDetails])
		FORM SET INPUT:C55([xCreditCardDetails:132]; "CARD_IN")
		MODIFY RECORD:C57([xCreditCardDetails:132]; *)
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (CCM_bo_SaveCardDetails)
			Repeat 
				$_l_CharacterPosition:=Position:C15("  "; CCM_T_CardNumber)
				If ($_l_CharacterPosition>0)
					CCM_T_CardNumber:=Replace string:C233(CCM_T_CardNumber; "  "; " ")
				End if 
			Until ($_l_CharacterPosition=0)
			
			$_l_CharacterPosition:=Position:C15("X"; CCM_T_CardNumber)
			$_t_CardNumber:=""
			
			If ($_l_CharacterPosition>0)
				For ($_l_Index; 1; Length:C16(CCM_T_CardNumber))
					If (CCM_T_CardNumber[[$_l_Index]]="X")
						$_t_CardNumber:=$_t_CardNumber+CC_T_CCX99999999999[[$_l_Index]]
					Else 
						$_t_CardNumber:=$_t_CardNumber+CCM_T_CardNumber[[$_l_Index]]
					End if 
				End for 
				$_t_CardNumberNEW:=$_t_CardNumber
				CCM_EncryptCardNumber($_t_CardNumber)
			Else 
				$_t_CardNumberNEW:=CCM_T_CardNumber
				CCM_EncryptCardNumber(CCM_T_CardNumber)
			End if 
			
			CCM_EncryptCardName(CCM_T_NameOnCard)
			$_t_ModifiedText:=""
			
			If (Old:C35([xCreditCardDetails:132]StartDate:7)#[xCreditCardDetails:132]StartDate:7) & (Old:C35([xCreditCardDetails:132]StartDate:7)#!00-00-00!)
				$_t_ModifiedText:="Start Date Modified from"+String:C10(Old:C35([xCreditCardDetails:132]StartDate:7); 4)+" to "+String:C10([xCreditCardDetails:132]StartDate:7)+Char:C90(13)
			End if 
			If (Old:C35([xCreditCardDetails:132]EndDate:8)#[xCreditCardDetails:132]EndDate:8) & (Old:C35([xCreditCardDetails:132]EndDate:8)#!00-00-00!)
				$_t_ModifiedText:=$_t_ModifiedText+"End Date Modified from"+String:C10(Old:C35([xCreditCardDetails:132]EndDate:8); 4)+" to "+String:C10([xCreditCardDetails:132]EndDate:8)+Char:C90(13)
			End if 
			
			If (CCM_T_OLDnameOnCard#CCM_T_NameOnCard) & (CCM_T_OLDnameOnCard#"")
				$_t_ModifiedText:=$_t_ModifiedText+"Name on Card Modified From"+CCM_T_OLDnameOnCard+" to "+CCM_T_NameOnCard+Char:C90(13)
			End if 
			If ($_t_CardNumberNEW#CC_T_CCX99999999999) & (CC_T_CCX99999999999#"")
				$_t_ModifiedText:=$_t_ModifiedText+"Credit/Debit Card number changed"+Char:C90(13)
			End if 
			If (Old:C35([xCreditCardDetails:132]IssueNumber:10)#[xCreditCardDetails:132]IssueNumber:10) & (Old:C35([xCreditCardDetails:132]IssueNumber:10)#"")
				$_t_ModifiedText:=$_t_ModifiedText+"Card issue number"+Old:C35([xCreditCardDetails:132]IssueNumber:10)+" to "+[xCreditCardDetails:132]IssueNumber:10+Char:C90(13)
			End if 
			If (Old:C35([xCreditCardDetails:132]Card_TypeName:5)#[xCreditCardDetails:132]Card_TypeName:5) & (Old:C35([xCreditCardDetails:132]Card_TypeName:5)#"")
				$_t_ModifiedText:=$_t_ModifiedText+"Card Type Modified from"+Old:C35([xCreditCardDetails:132]Card_TypeName:5)+" to "+[xCreditCardDetails:132]Card_TypeName:5+Char:C90(13)
			End if 
			If (Old:C35([xCreditCardDetails:132]Card_Issuer:6)#[xCreditCardDetails:132]Card_Issuer:6) & (Old:C35([xCreditCardDetails:132]Card_Issuer:6)#"")
				$_t_ModifiedText:=$_t_ModifiedText+"Card issuer Modified from"+Old:C35([xCreditCardDetails:132]Card_Issuer:6)+" to "+[xCreditCardDetails:132]Card_Issuer:6+Char:C90(13)
			End if 
			If ($_t_ModifiedText#"")
				$_t_ModifiedText:=Char:C90(13)+" "+String:C10(Current date:C33(*); 4)+" "+<>PER_t_CurrentUserName+" "+$_t_ModifiedText
				TEXT TO BLOB:C554($_t_ModifiedText; [xCreditCardDetails:132]ModificationDetails:16; 3; *)
			End if 
			
			//here we need to put the card details(card number and name)
			//from the text entry variables into the encrypted blob
			SAVE RECORD:C53([xCreditCardDetails:132])
			If (CCM_t_AddressLine1#"") | (CCM_t_AddressLine2#"") | (CCM_t_Town#"") | (CCM_t_County#"") | (CCM_t_PostalCode#"") | (CCM_t_Country#"")
				$_l_CardID:=[xCreditCardDetails:132]x_ID:1
				READ WRITE:C146([AddressRecords:125])
				QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerRecordID:5=$_l_CardID; *)
				QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerTableID:4=(Table:C252(->[xCreditCardDetails:132])))
				If (Records in selection:C76([AddressRecords:125])=0)
					CREATE RECORD:C68([AddressRecords:125])
				Else 
					If (Records in selection:C76([AddressRecords:125])>1)
						$_l_RecordsinSelection:=Records in selection:C76([AddressRecords:125])
						REDUCE SELECTION:C351([AddressRecords:125]; $_l_RecordsinSelection-1)
						DELETE SELECTION:C66([AddressRecords:125])
						QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerRecordID:5=$_l_CardID; *)
						QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerTableID:4=(Table:C252(->[xCreditCardDetails:132])))
					End if 
					
					
				End if 
				[AddressRecords:125]AddressClass:3:="Credit Card"
				[AddressRecords:125]AddressClassID:2:=4
				[AddressRecords:125]AddressLine1:6:=CCM_t_AddressLine1
				[AddressRecords:125]AddressLine2:7:=CCM_t_AddressLine2
				[AddressRecords:125]Country:11:=CCM_t_Country
				[AddressRecords:125]County_State:9:=CCM_t_County
				[AddressRecords:125]Postal_Code:10:=CCM_t_PostalCode
				[AddressRecords:125]Town_City:8:=CCM_t_Town
				[AddressRecords:125]X_OwnerRecordID:5:=$_l_CardID
				[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[xCreditCardDetails:132])
				DB_SaveRecord(->[AddressRecords:125])
				UNLOAD RECORD:C212([AddressRecords:125])
				READ ONLY:C145([AddressRecords:125])
				[xCreditCardDetails:132]xAVSStatus:19:=""
				
				SAVE RECORD:C53([xCreditCardDetails:132])
			End if 
			CCM_t_AddressLine1:=""
			CCM_t_AddressLine2:=""
			CCM_t_Town:=""
			CCM_t_County:=""
			CCM_t_PostalCode:=""
			CCM_t_Country:=""
		End if 
		UNLOAD RECORD:C212([xCreditCardDetails:132])
		ERR_MethodTrackerReturn("CCM_EditRecord"; $_t_oldMethodName)
	End if 
End if 
ERR_MethodTrackerReturn("CCM_EditRecord"; $_t_oldMethodName)
