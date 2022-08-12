//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_EmailCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EMAIL_at_MailTypes;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	C_BOOLEAN:C305($_bo_ShowAttachments)
	C_LONGINT:C283($_l_Event; $_l_objectbottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectHeight; $_l_objectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectLeft4; $_l_objectRight)
	C_LONGINT:C283($_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_objectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_TopofNextItem; Baddattachements; BDELETEattachements; WS_l_SelectedEmailName)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_AttachmentsLabel; EMAIL_t_EmailType; EMAIL_t_BodyText; EMAIL_t_Subject; WS_t_EmailAddress; WS_t_EmailName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_EmailCheck")

// SD_EmailCheck
// 18/02/03 pb
// combined from the various Email entry fields
// parameters: $1 = pointer to the field it was called from

$_t_oldMethodName:=ERR_MethodTracker("SD_EmailCheck"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Double Clicked:K2:5)
		Case of 
			: (Size of array:C274(WS_at_Attachments)=0)
				$_bo_ShowAttachments:=False:C215
			Else 
				$_bo_ShowAttachments:=True:C214
		End case 
		OBJECT SET VISIBLE:C603(SD2_at_EmailType; False:C215)
		OBJECT SET VISIBLE:C603(SD2_at_EmailName; False:C215)
		OBJECT SET VISIBLE:C603(SD2_at_EmailAddresses; False:C215)
		OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
		OBJECT SET VISIBLE:C603(*; "WS_S5_EmailTypeGraphic"; True:C214)
		OBJECT SET VISIBLE:C603(WS_t_EmailName; True:C214)
		OBJECT SET VISIBLE:C603(WS_t_EmailAddress; True:C214)
		OBJECT SET ENTERABLE:C238(WS_t_EmailName; True:C214)
		OBJECT SET ENTERABLE:C238(WS_t_EmailAddress; True:C214)
		OBJECT GET COORDINATES:C663(WS_t_EmailName; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_TopofNextItem:=$_l_ObjectBottom2+8
		If ($_bo_ShowAttachments)
			OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
			OBJECT GET COORDINATES:C663(EMAIL_t_AttachmentsLabel; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
			$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
			OBJECT MOVE:C664(EMAIL_t_AttachmentsLabel; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(BDELETEattachements; True:C214)
			OBJECT GET COORDINATES:C663(BDELETEattachements; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
			$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
			OBJECT MOVE:C664(BDELETEattachements; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(Baddattachements; True:C214)
			OBJECT GET COORDINATES:C663(Baddattachements; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
			$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
			OBJECT MOVE:C664(Baddattachements; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
			OBJECT SET VISIBLE:C603(WS_at_Attachments; True:C214)
			OBJECT GET COORDINATES:C663(WS_at_Attachments; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
			$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
			OBJECT MOVE:C664(WS_at_Attachments; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
			$_l_TopofNextItem:=($_l_TopofNextItem+$_l_ObjectHeight)+10
		Else 
			OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; False:C215)
			OBJECT SET VISIBLE:C603(BDELETEattachements; False:C215)
			OBJECT SET VISIBLE:C603(Baddattachements; False:C215)
			OBJECT SET VISIBLE:C603(WS_at_Attachments; False:C215)
		End if 
		OBJECT SET VISIBLE:C603(EMAIL_t_Subject; True:C214)
		OBJECT GET COORDINATES:C663(EMAIL_t_Subject; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
		$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
		OBJECT MOVE:C664(EMAIL_t_Subject; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
		OBJECT SET VISIBLE:C603(*; "Text_Subject"; True:C214)
		OBJECT GET COORDINATES:C663(*; "Text_Subject"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
		$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
		OBJECT MOVE:C664(*; "Text_Subject"; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
		$_l_TopofNextItem:=($_l_TopofNextItem+$_l_ObjectHeight)+10
		//Text_EmailText
		OBJECT GET COORDINATES:C663(*; "Text_EmailText"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
		$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
		OBJECT MOVE:C664(*; "Text_EmailText"; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_TopofNextItem+$_l_ObjectHeight; *)
		$_l_TopofNextItem:=($_l_TopofNextItem+$_l_ObjectHeight)+5
		//EMAIL_t_BodyText
		OBJECT SET VISIBLE:C603(EMAIL_t_BodyText; True:C214)
		OBJECT GET COORDINATES:C663(EMAIL_t_BodyText; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
		$_l_ObjectHeight:=$_l_objectbottom-$_l_objectTop
		OBJECT MOVE:C664(EMAIL_t_BodyText; $_l_objectLeft; $_l_TopofNextItem; $_l_objectRight; $_l_objectbottom; *)
		EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_SelectedEmailName}
		WS_t_EmailName:=SD2_at_EmailName{WS_l_SelectedEmailName}
		WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_SelectedEmailName}
		//   GOTO AREA(WS_t_EmailName)
		GOTO OBJECT:C206($1->)
		
	: ($_l_Event=On Clicked:K2:4)
		EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_SelectedEmailName}
		WS_t_EmailName:=SD2_at_EmailName{WS_l_SelectedEmailName}
		WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_SelectedEmailName}
End case 
ERR_MethodTrackerReturn("SD_EmailCheck"; $_t_oldMethodName)