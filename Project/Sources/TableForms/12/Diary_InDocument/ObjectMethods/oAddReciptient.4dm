If (False:C215)
	//object Name: [DIARY]Diary_InDocument.oAddReciptient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_LB_MailRecipients;0)
	//ARRAY TEXT(EMAIL_at_MailTypes;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	C_LONGINT:C283($_l_ArraySize; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectLeft4; $_l_ObjectMove; $_l_ObjectMove2)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; Baddattachements; BDELETEattachements; BMinus)
	C_LONGINT:C283(WS_l_SelectedEmailName)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_EmailType; EMAIL_t_EmailTypeOLD; WS_t_ContactID; WS_t_ContactIDOLD; WS_t_EmailAddress; WS_t_EmailAddressOLD; WS_t_EmailName; WS_t_EmailNameOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InDocument.oAddReciptient"; Form event code:C388)
WS_l_SelectedEmailName:=0
EMAIL_t_EmailTypeOLD:=EMAIL_t_EmailType
WS_t_EmailAddressOLD:=WS_t_EmailAddress
WS_t_ContactIDOLD:=WS_t_ContactID
WS_t_EmailNameOLD:=WS_t_EmailName
EMAIL_t_EmailType:=""
WS_t_EmailAddress:=""
WS_t_ContactID:=""
WS_t_EmailName:=""
If (False:C215)
	
	
	Case of 
		: (Size of array:C274(WS_at_Attachments)=0)
			OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Subject:40; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(WS_t_EmailAddress; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			OBJECT SET VISIBLE:C603(*; "oLBAttachments"; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBAttachments"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_ObjectMove:=$_l_ObjectTop4-($_l_ObjectBottom3+3+6)
			OBJECT MOVE:C664(*; "oLBAttachments"; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664(Baddattachements; 0; -$_l_ObjectMove)
			OBJECT GET COORDINATES:C663(*; "oLBAttachments"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_ObjectMove:=$_l_ObjectTop-($_l_ObjectBottom4+3+6)
			
			OBJECT MOVE:C664([DIARY:12]Email_Subject:40; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664(*; "Text_Subject"; 0; -$_l_ObjectMove)
			$_l_ObjectBottom:=$_l_ObjectBottom-$_l_ObjectMove
			//GET OBJECT RECT([DIARY]Email_Subject;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectMove:=$_l_ObjectTop2-($_l_ObjectBottom+(6+12))
			$_l_ObjectMove2:=$_l_ObjectTop2-($_l_ObjectBottom+6)
			OBJECT MOVE:C664(*; "Text_EmailText"; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664([DIARY:12]Email_Text:42; 0; -$_l_ObjectMove; 0; $_l_ObjectMove)
			OBJECT SET VISIBLE:C603(SD2_at_EmailType; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_EmailName; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_EmailAddresses; False:C215)
			OBJECT SET VISIBLE:C603(BMinus; False:C215)
			OBJECT SET VISIBLE:C603(EMAIL_t_EmailType; True:C214)
			OBJECT SET VISIBLE:C603(WS_t_EmailName; True:C214)
			OBJECT SET VISIBLE:C603(WS_t_EmailAddress; True:C214)
			OBJECT SET ENTERABLE:C238(EMAIL_t_EmailType; True:C214)
			OBJECT SET ENTERABLE:C238(WS_t_EmailName; True:C214)
			OBJECT SET ENTERABLE:C238(WS_t_EmailAddress; True:C214)
			OBJECT SET VISIBLE:C603(WS_at_Attachments; False:C215)
			OBJECT SET VISIBLE:C603(*; "oLBAttachments"; True:C214)
			OBJECT SET VISIBLE:C603(BDELETEattachements; False:C215)
			ARRAY TEXT:C222(EMAIL_at_MailTypes; 3)
			EMAIL_at_MailTypes{1}:="To"
			EMAIL_at_MailTypes{2}:="CC"
			EMAIL_at_MailTypes{3}:="Bcc"
			EMAIL_at_MailTypes:=1
			EMAIL_t_EmailType:=EMAIL_at_MailTypes{EMAIL_at_MailTypes}
			OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
		: (Size of array:C274(WS_at_Attachments)>0)
			OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Subject:40; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(WS_t_EmailAddress; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			OBJECT SET VISIBLE:C603(*; "oLBAttachments"; True:C214)
			OBJECT SET VISIBLE:C603(WS_at_Attachments; True:C214)
			OBJECT SET VISIBLE:C603(BDELETEattachements; True:C214)
			OBJECT GET COORDINATES:C663(*; "oLBAttachments"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_ObjectMove:=$_l_ObjectTop4-($_l_ObjectBottom3+3+6)
			OBJECT MOVE:C664(*; "oLBAttachments"; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664(Baddattachements; 0; -$_l_ObjectMove)
			
			OBJECT GET COORDINATES:C663(*; "oLBAttachments"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			
			OBJECT GET COORDINATES:C663(WS_at_Attachments; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_ObjectMove:=$_l_ObjectTop4-($_l_ObjectBottom3+3+6)
			OBJECT MOVE:C664(WS_at_Attachments; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664(BDeleteattachements; 0; -$_l_ObjectMove)
			OBJECT GET COORDINATES:C663(WS_at_Attachments; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_ObjectMove:=$_l_ObjectTop-($_l_ObjectBottom4+3+6)
			OBJECT MOVE:C664([DIARY:12]Email_Subject:40; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664(*; "Text_Subject"; 0; -$_l_ObjectMove)
			$_l_ObjectBottom:=$_l_ObjectBottom-$_l_ObjectMove
			//GET OBJECT RECT([DIARY]Email_Subject;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectMove:=$_l_ObjectTop2-($_l_ObjectBottom+(6+12))
			$_l_ObjectMove2:=$_l_ObjectTop2-($_l_ObjectBottom+6)
			OBJECT MOVE:C664(*; "Text_EmailText"; 0; -$_l_ObjectMove)
			OBJECT MOVE:C664([DIARY:12]Email_Text:42; 0; -$_l_ObjectMove; 0; $_l_ObjectMove)
			
			OBJECT SET VISIBLE:C603(SD2_at_EmailType; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_EmailName; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_EmailAddresses; False:C215)
			OBJECT SET VISIBLE:C603(BMinus; False:C215)
			OBJECT SET VISIBLE:C603(EMAIL_t_EmailType; True:C214)
			OBJECT SET VISIBLE:C603(WS_t_EmailName; True:C214)
			OBJECT SET VISIBLE:C603(WS_t_EmailAddress; True:C214)
			OBJECT SET ENTERABLE:C238(EMAIL_t_EmailType; True:C214)
			OBJECT SET ENTERABLE:C238(WS_t_EmailName; True:C214)
			OBJECT SET ENTERABLE:C238(WS_t_EmailAddress; True:C214)
			OBJECT SET VISIBLE:C603(WS_at_Attachments; True:C214)
			ARRAY TEXT:C222(EMAIL_at_MailTypes; 3)
			EMAIL_at_MailTypes{1}:="To"
			EMAIL_at_MailTypes{2}:="CC"
			EMAIL_at_MailTypes{3}:="Bcc"
			EMAIL_at_MailTypes:=1
			EMAIL_t_EmailType:=EMAIL_at_MailTypes{EMAIL_at_MailTypes}
			OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
	End case 
	
Else 
	OBJECT SET VISIBLE:C603(BMinus; False:C215)
	LB_SetEnterable(->DIA_LB_MailRecipients; True:C214; 1)
	LB_SetEnterable(->DIA_LB_MailRecipients; True:C214; 2)
	LB_SetEnterable(->DIA_LB_MailRecipients; True:C214; 3)
	
	
	GOTO OBJECT:C206(DIA_LB_MailRecipients)
	$_l_ArraySize:=Size of array:C274(SD2_at_EmailType)
	
	INSERT IN ARRAY:C227(SD2_at_EmailType; 1; 1)
	INSERT IN ARRAY:C227(SD2_at_EmailName; 1; 1)
	INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 1; 1)
	INSERT IN ARRAY:C227(SD2_at_ContactIDs; 1; 1)
	GOTO OBJECT:C206(DIA_LB_MailRecipients)
	LB_SetChoiceList("aDiaRec"; ->EMAIL_at_MailTypes; ->SD2_at_EmailType)
	LB_GoToCell(->DIA_LB_MailRecipients; 1; 1)
	OBJECT SET VISIBLE:C603(DIA_LB_MailRecipients; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InDocument.oAddReciptient"; $_t_oldMethodName)
