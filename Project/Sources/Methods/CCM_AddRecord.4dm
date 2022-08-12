//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AddRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN($2)
	//C_UNKNOWN($4)
	C_BOOLEAN:C305(CCM_bo_SaveCardDetails; $0; CCM_bo_SaveCardDetails)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $1; $2; $4; CCM_l_RelatedCoID; CCM_l_RelatedRecordID; CCM_l_RELATEDTABLE; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CardID; $_l_CurrentWinRefOLD)
	C_LONGINT:C283(CCM_l_RelatedCoID; CCM_l_RelatedRecordID; CCM_l_Relatedtable; WIN_l_CurrentWinRef)
	C_TEXT:C284($3; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_T_CardNumber; CCM_t_CardOwnerDetails; CCM_t_Country; CCM_t_County; CCM_T_NameOnCard; CCM_t_PostalCode; CCM_t_Town; $_t_oldMethodName)
	C_TEXT:C284($3; CCM_t_AddressLine1; CCM_t_AddressLine2; CCM_T_CardNumber; CCM_t_CardOwnerDetails; CCM_t_Country; CCM_t_County; CCM_T_NameOnCard; CCM_t_PostalCode; CCM_t_Town)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_AddRecord")

$0:=False:C215



CCM_t_CardOwnerDetails:=""
If (Count parameters:C259>=2)
	
	If (Count parameters:C259>=3)
		CCM_t_CardOwnerDetails:=$3
	End if 
	If (Count parameters:C259>=4)
		CCM_l_RelatedCoID:=$4
	End if 
	
	CCM_l_Relatedtable:=$1
	CCM_l_RelatedRecordID:=$2
	
End if 
CCM_bo_SaveCardDetails:=False:C215
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
READ WRITE:C146([xCreditCardDetails:132])
//CREATE RECORD([XCreditCardDetails])
FORM SET INPUT:C55([xCreditCardDetails:132]; "CARD_IN")
ADD RECORD:C56([xCreditCardDetails:132]; *)
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (CCM_bo_SaveCardDetails)
	CCM_EncryptCardNumber(CCM_T_CardNumber)
	CCM_EncryptCardName(CCM_T_NameOnCard)
	//here we need to put the card details(card number and name)
	//from the text entry variables into the encrypted blob
	//and did we put an address in?
	
	SAVE RECORD:C53([xCreditCardDetails:132])
	If (CCM_t_AddressLine1#"") | (CCM_t_AddressLine2#"") | (CCM_t_Town#"") | (CCM_t_County#"") | (CCM_t_PostalCode#"") | (CCM_t_Country#"")
		$_l_CardID:=[xCreditCardDetails:132]x_ID:1
		CREATE RECORD:C68([AddressRecords:125])
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
		$0:=True:C214
	End if 
	CCM_t_AddressLine1:=""
	CCM_t_AddressLine2:=""
	CCM_t_Town:=""
	CCM_t_County:=""
	CCM_t_PostalCode:=""
	CCM_t_Country:=""
	
End if 
UNLOAD RECORD:C212([xCreditCardDetails:132])
ERR_MethodTrackerReturn("CCM_AddRecord"; $_t_oldMethodName)
