//%attributes = {}
If (False:C215)
	//Project Method Name:      RESET_DIARY_EMAIL_OBJS
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
	C_BOOLEAN:C305($_bo_ShowAttachments; $_bo_ShowEmailArray; EMAIL_bo_MailListBuilt)
	C_LONGINT:C283($_l_Bottom2; $_l_Bottom3; $_l_Bottom4; $_l_Left2; $_l_Left3; $_l_Left4; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_Right2; $_l_Right3; $_l_Right4; $_l_Top2; $_l_Top3; $_l_Top4; $_l_TopofnextItem; BADD; Baddattachements; BDELETEattachements; bminus)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_AttachmentsLabel; EMAIL_t_BodyText; EMAIL_t_EmailType; EMAIL_t_Subject; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RESET_DIARY_EMAIL_OBJS")
//BSW 17/09/02
//THE EMAIL ENTRY FORM NEED SO FANCY OBJECT POSITION SO I AM
//MANAGING IT IN A SINGLE METHOD

Case of 
	: (Size of array:C274(SD2_at_EmailType)<=1) & (Size of array:C274(WS_at_Attachments)=0)
		$_bo_ShowAttachments:=False:C215
		$_bo_ShowEmailArray:=False:C215
	: (Size of array:C274(SD2_at_EmailType)<=1) & (Size of array:C274(WS_at_Attachments)>0)
		$_bo_ShowAttachments:=True:C214
		$_bo_ShowEmailArray:=False:C215
	: (Size of array:C274(SD2_at_EmailType)>1) & (Size of array:C274(WS_at_Attachments)=0)
		$_bo_ShowAttachments:=False:C215
		$_bo_ShowEmailArray:=True:C214
	: (Size of array:C274(SD2_at_EmailType)>1) & (Size of array:C274(WS_at_Attachments)>0)
		$_bo_ShowAttachments:=True:C214
		$_bo_ShowEmailArray:=True:C214
End case 
If ($_bo_ShowEmailArray=False:C215)
	OBJECT SET VISIBLE:C603(SD2_at_EmailType; False:C215)
	OBJECT SET VISIBLE:C603(SD2_at_EmailName; False:C215)
	OBJECT SET VISIBLE:C603(SD2_at_EmailAddresses; False:C215)
	OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; True:C214)
	OBJECT SET VISIBLE:C603(*; "WS_S5_EmailTypeGraphic"; True:C214)
	OBJECT SET VISIBLE:C603(WS_t_EmailName; True:C214)
	OBJECT SET VISIBLE:C603(WS_t_EmailAddress; True:C214)
	OBJECT SET ENTERABLE:C238(WS_t_EmailName; False:C215)
	OBJECT SET ENTERABLE:C238(WS_t_EmailAddress; False:C215)
	OBJECT SET VISIBLE:C603(EMAIL_t_EmailType; True:C214)
	OBJECT GET COORDINATES:C663(WS_t_EmailName; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
	$_l_TopofnextItem:=$_l_Bottom2+8+15
	OBJECT SET VISIBLE:C603(bminus; False:C215)  // 18/02/03 pb
Else 
	OBJECT SET VISIBLE:C603(SD2_at_EmailType; True:C214)
	OBJECT SET VISIBLE:C603(SD2_at_EmailName; True:C214)
	OBJECT SET VISIBLE:C603(SD2_at_EmailAddresses; True:C214)
	OBJECT SET VISIBLE:C603(EMAIL_at_MailTypes; False:C215)
	OBJECT SET VISIBLE:C603(*; "WS_S5_EmailTypeGraphic"; False:C215)
	OBJECT SET VISIBLE:C603(WS_t_EmailName; False:C215)
	OBJECT SET VISIBLE:C603(WS_t_EmailAddress; False:C215)
	OBJECT SET ENTERABLE:C238(WS_t_EmailName; False:C215)
	OBJECT SET ENTERABLE:C238(WS_t_EmailAddress; False:C215)
	OBJECT SET VISIBLE:C603(EMAIL_t_EmailType; False:C215)
	OBJECT GET COORDINATES:C663(SD2_at_EmailName; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
	$_l_TopofnextItem:=$_l_Bottom2+8+15
	OBJECT SET VISIBLE:C603(bminus; True:C214)  // 18/02/03 pb
End if 
If ($_bo_ShowAttachments)
	OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
	OBJECT GET COORDINATES:C663(EMAIL_t_AttachmentsLabel; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(EMAIL_t_AttachmentsLabel; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(BDELETEattachements; True:C214)
	OBJECT GET COORDINATES:C663(BDELETEattachements; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(BDELETEattachements; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(Baddattachements; True:C214)
	OBJECT GET COORDINATES:C663(Baddattachements; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(Baddattachements; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(WS_at_Attachments; True:C214)
	OBJECT GET COORDINATES:C663(WS_at_Attachments; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectTop+(Size of array:C274(WS_at_Attachments)*12)
	If ($_l_ObjectHeight>50)
		$_l_ObjectHeight:=50
	End if 
	
	OBJECT MOVE:C664(WS_at_Attachments; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	$_l_TopofnextItem:=($_l_TopofnextItem+$_l_ObjectHeight)+10
Else 
	OBJECT SET VISIBLE:C603(EMAIL_t_AttachmentsLabel; True:C214)
	OBJECT GET COORDINATES:C663(EMAIL_t_AttachmentsLabel; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(EMAIL_t_AttachmentsLabel; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(BDELETEattachements; False:C215)
	OBJECT GET COORDINATES:C663(BDELETEattachements; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(BDELETEattachements; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(Baddattachements; True:C214)
	OBJECT GET COORDINATES:C663(Baddattachements; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(Baddattachements; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	OBJECT SET VISIBLE:C603(WS_at_Attachments; True:C214)
	OBJECT GET COORDINATES:C663(WS_at_Attachments; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	//$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(WS_at_Attachments; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
	$_l_TopofnextItem:=($_l_TopofnextItem+$_l_ObjectHeight)+10
End if 
OBJECT SET VISIBLE:C603(EMAIL_t_Subject; True:C214)
OBJECT GET COORDINATES:C663(EMAIL_t_Subject; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
OBJECT MOVE:C664(EMAIL_t_Subject; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
OBJECT SET VISIBLE:C603(*; "Text_Subject"; True:C214)
OBJECT GET COORDINATES:C663(*; "Text_Subject"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
OBJECT MOVE:C664(*; "Text_Subject"; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
$_l_TopofnextItem:=($_l_TopofnextItem+$_l_ObjectHeight)+10
//Text_EmailText
OBJECT GET COORDINATES:C663(*; "Text_EmailText"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
OBJECT MOVE:C664(*; "Text_EmailText"; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_TopofnextItem+$_l_ObjectHeight; *)
$_l_TopofnextItem:=($_l_TopofnextItem+$_l_ObjectHeight)+5
//EMAIL_t_BodyText
OBJECT SET VISIBLE:C603(EMAIL_t_BodyText; True:C214)
OBJECT GET COORDINATES:C663(EMAIL_t_BodyText; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
OBJECT MOVE:C664(EMAIL_t_BodyText; $_l_ObjectLeft; $_l_TopofnextItem; $_l_ObjectRight; $_l_ObjectBottom; *)

If ([DIARY:12]Document_Code:15#"") & (Record number:C243([DIARY:12])#-3)
	//NOT A NEW RECORD!
	If ([DIARY:12]Email_ID:41#0)
		OBJECT SET VISIBLE:C603(BMinus; False:C215)
		OBJECT SET VISIBLE:C603(BADD; False:C215)
	Else 
		If ($_bo_ShowEmailArray=False:C215)  //One name
			OBJECT GET COORDINATES:C663(*; "WS_S5_EmailTypeGraphic"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(badd; ($_l_ObjectLeft-5)-16; $_l_ObjectTop; $_l_ObjectLeft-5; $_l_ObjectTop+16; *)
		Else 
			OBJECT GET COORDINATES:C663(*; "WS_S5_EmailTypeGraphic"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(badd; ($_l_ObjectRight-5)-16; $_l_ObjectBottom+10; $_l_ObjectRight-5; ($_l_ObjectBottom+10)+16; *)
			OBJECT MOVE:C664(bMinus; ((($_l_ObjectRight-5)-16)-5)-16; $_l_ObjectBottom+10; ((($_l_ObjectRight-5)-16)-5); ($_l_ObjectBottom+10)+16; *)
		End if 
		
		
	End if 
End if 
If (EMAIL_bo_MailListBuilt)
	OBJECT SET VISIBLE:C603(BMinus; False:C215)
	OBJECT SET VISIBLE:C603(badd; False:C215)
Else 
	If ($_bo_ShowEmailArray=False:C215)  //One name
		OBJECT SET VISIBLE:C603(badd; True:C214)
		OBJECT SET VISIBLE:C603(BMinus; False:C215)
		OBJECT GET COORDINATES:C663(*; "WS_S5_EmailTypeGraphic"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(badd; ($_l_ObjectLeft-5)-16; $_l_ObjectTop; $_l_ObjectLeft-5; $_l_ObjectTop+16; *)
	Else 
		OBJECT SET VISIBLE:C603(badd; True:C214)
		OBJECT SET VISIBLE:C603(BMinus; True:C214)
		OBJECT GET COORDINATES:C663(*; "WS_S5_EmailTypeGraphic"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(badd; ($_l_ObjectRight-5)-16; $_l_ObjectBottom+10; $_l_ObjectRight-5; ($_l_ObjectBottom+10)+16; *)
		OBJECT MOVE:C664(bMinus; ((($_l_ObjectRight-5)-16)-5)-16; $_l_ObjectBottom+10; ((($_l_ObjectRight-5)-10))-10; ($_l_ObjectBottom+10)+16; *)
	End if 
	
End if 
Case of 
	: (Size of array:C274(SD2_at_EmailType)=0)
		EMAIL_t_EmailType:="To"
		WS_t_EmailName:=""
		WS_t_EmailAddress:=""
	: (Size of array:C274(SD2_at_EmailType)=1)
		EMAIL_t_EmailType:=SD2_at_EmailType{1}
		WS_t_EmailName:=SD2_at_EmailName{1}
		WS_t_EmailAddress:=SD2_at_EmailAddresses{1}
		SD2_at_EmailName:=1
End case 
ERR_MethodTrackerReturn("RESET_DIARY_EMAIL_OBJS"; $_t_oldMethodName)
