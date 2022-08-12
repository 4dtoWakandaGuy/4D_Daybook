//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryINLLPInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_lb_Attachments;0)
	//ARRAY BOOLEAN(DOC_lb_Recipients;0)
	//ARRAY LONGINT(SD2_al_SentStatus;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	//ARRAY TEXT(WS_at_EmailComb;0)
	C_BOOLEAN:C305($_bo_SeeAttachments; $_bo_ShowScroll; DB_bo_FontsInited; SD2_bo_AttachmentBoxDone; SD2_bo_RecipientBoxDone)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_ArraySize; $_l_AttachBottom; $_l_AttachHeight; $_l_AttachLeft; $_l_Attachright; $_l_AttachTop; $_l_But1Bottom; $_l_But1Left; $_l_But1Right)
	C_LONGINT:C283($_l_But1Top; $_l_ButtonBottom; $_l_ButtonHeight; $_l_FromBottom; $_l_FromHeight; $_l_FromLeft; $_l_FromPopBottom; $_l_FromPopLeft; $_l_FromPopRight; $_l_FromPopTop; $_l_FromRight)
	C_LONGINT:C283($_l_FromTop; $_l_LabelBottom; $_l_LabelHeight; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop; $_l_popBottom; $_l_popHeight; $_l_RecipBottom; $_l_RecipientHeight; $_l_RecipLeft)
	C_LONGINT:C283($_l_RecipRight; $_l_RecipTop; $_l_SelectBottom; $_l_SelectLeft; $_l_SelectRight; $_l_SelectTop; $_l_SubjectBottom; $_l_SubjectHeight; $_l_SubjectLeft; $_l_SubjectRight; $_l_SubjectTop)
	C_LONGINT:C283($_l_TextBottom; $_l_TextLeft; $_l_TextRight; $_l_TextTop; BgetTemplate; DOC_l_BUT1; DOC_l_But2; DOC_l_BUT3; DOC_l_BUT4; DOC_l_BUT5; DOC_l_BUT6)
	C_LONGINT:C283(DOC_l_BUT7; DOC_l_BUT8; DOC_l_BUT9; DOCT_l_BUT1; DOCT_l_But2; DOCT_l_BUT3; DOCT_l_BUT4; DOCT_l_BUT5; DOCT_l_BUT6; DOCT_l_BUT7; DOCT_l_BUT8)
	C_LONGINT:C283(DOCT_l_BUT9; SD2_l_DocType)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; $1; DOC_t_COL1; DOC_t_COL2; DOC_t_COL3; DOC_t_COL4; DOC_t_COL5; DOC_t_COL6; DOC_t_COL7)
	C_TEXT:C284(DOC_t_COL8; DOC_t_COL9; DOC_t_HED1; DOC_t_HED2; DOC_t_HED3; DOC_t_HED4; DOC_t_HED5; DOC_t_HED6; DOC_t_HED7; DOC_t_HED8; DOC_t_HED9)
	C_TEXT:C284(DOCT_t_COL1; DOCT_t_COL2; DOCT_t_COL3; DOCT_t_COL4; DOCT_t_COL5; DOCT_t_COL6; DOCT_t_COL7; DOCT_t_COL8; DOCT_t_COL9; DOCT_t_HED1; DOCT_t_HED2)
	C_TEXT:C284(DOCT_t_HED3; DOCT_t_HED4; DOCT_t_HED5; DOCT_t_HED6; DOCT_t_HED7; DOCT_t_HED8; DOCT_t_HED9; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryINLLPInterface")

If (Count parameters:C259>=1)
	//TRACE
	Case of 
		: (SD2_l_DocType=Text Email)
			Case of 
				: (WIN_t_CurrentInputForm="SD2_EmailEntry") | ($1="SD2_EmailEntry")
					If ([DIARY:12]Email_ID:41>0)  //this is sent
						OBJECT SET ENTERABLE:C238([DIARY:12]Email_Subject:40; False:C215)
						OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; False:C215)
						
						OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
						OBJECT SET VISIBLE:C603(*; "oAddrecipient"; False:C215)
						OBJECT SET VISIBLE:C603(*; "asubtractrecipient"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oaddAttachment"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDeleteAttachment"; False:C215)
						If (Size of array:C274(WS_at_Attachments)>0)
							$_bo_SeeAttachments:=True:C214
							OBJECT SET VISIBLE:C603(*; "omLBAttachments"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oattachmentLabel"; True:C214)
						Else 
							$_bo_SeeAttachments:=False:C215
							OBJECT SET VISIBLE:C603(*; "omLBAttachments"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oattachmentLabel"; False:C215)
						End if 
						
						OBJECT SET VISIBLE:C603(*; "OModifyOrReSend"; True:C214)  //added 08/07/08 -kmw
						OBJECT SET VISIBLE:C603(SD2_l_SendEmailNow; False:C215)  //moved to here from inside if ($_bo_SeeAttachments) check later on 09/07/08 -kmw
						OBJECT SET VISIBLE:C603(SD2_l_SaveDraft; False:C215)  //moved to here from inside if ($_bo_SeeAttachments) check later on 09/07/08 -kmw
					Else 
						//not sent yet
						$_bo_SeeAttachments:=True:C214
						OBJECT SET ENTERABLE:C238([DIARY:12]Email_Subject:40; True:C214)
						OBJECT SET ENTERABLE:C238([DIARY:12]Email_Text:42; True:C214)
						OBJECT SET VISIBLE:C603(*; "omLBAttachments"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oattachmentLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oAddrecipient"; True:C214)
						OBJECT SET VISIBLE:C603(*; "asubtractrecipient"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oaddAttachment"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oDeleteAttachment"; True:C214)
						
						OBJECT SET VISIBLE:C603(BgetTemplate; True:C214)
						
						OBJECT SET VISIBLE:C603(*; "OModifyOrReSend"; False:C215)  //added 08/07/08 -kmw
						OBJECT SET VISIBLE:C603(SD2_l_SendEmailNow; True:C214)  //moved to here from inside if ($_bo_SeeAttachments) check later on 09/07/08 -kmw
						OBJECT SET VISIBLE:C603(SD2_l_SaveDraft; True:C214)  //moved to here from inside if ($_bo_SeeAttachments) check later on 09/07/08 -kmw
					End if 
					If (Not:C34(SD2_bo_RecipientBoxDone))
						//````
						
						LB_SetupListbox(->DOC_lb_Recipients; "DOC_t"; "DOC_L"; 1; ->SD2_at_EmailType; ->WS_at_EmailComb; ->SD2_at_EmailAddresses; ->SD2_at_EmailName; ->SD2_at_ContactIDs; ->WS_al_PersonID; ->SD2_al_SentStatus)
						
						LB_SetColumnHeaders(->DOC_lb_Recipients; "DOC_L"; 1; "AddressType"; "AddressComb"; "Address"; "Name"; "ContactID"; "PersonID"; "SentStatus")
						
						LB_SetColumnWidths(->DOC_lb_Recipients; "DOC_t"; 1; 87; 250; 0; 0; 0; 0; 0)
						
						LB_SetEnterable(->DOC_lb_Recipients; False:C215; 0)
						LB_SetScroll(->DOC_lb_Recipients; -3; -2)
						LB_SETENTRYOPTIONS
						If (Not:C34(DB_bo_FontsInited))
							DB_SetDefaultFonts
						End if 
						
						If (Is Windows:C1573)  //If the Font Size of the first col = 9
							LB_SETFONT(->DOC_lb_Recipients; "DOC_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
							LB_SETFONT(->DOC_lb_Recipients; "DOC_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
							
							
						Else 
							LB_SETFONT(->DOC_lb_Recipients; "DOC_t"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
							LB_SETFONT(->DOC_lb_Recipients; "DOC_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
							
						End if 
						LB_Setdividers(->DOC_lb_Recipients; 0; 0)  //Both on
						LB_SetColours(->DOC_lb_Recipients; Black:K11:16; White:K11:1; White:K11:1)
						SD2_bo_RecipientBoxDone:=True:C214
					End if 
					
					//LB_StyleSettings (->DOC_lb_Recipients;"Black";9;"DOC_t";->[ACCOUNTS])
					$_l_ArraySize:=Size of array:C274(SD2_at_EmailType)  //`````
					$_l_RecipientHeight:=$_l_ArraySize*18
					If ($_l_RecipientHeight>60)
						$_l_RecipientHeight:=60
						$_bo_ShowScroll:=True:C214
					Else 
						If ($_l_RecipientHeight<29)
							$_l_RecipientHeight:=29
						End if 
						$_bo_ShowScroll:=False:C215
					End if 
					OBJECT GET COORDINATES:C663(DOC_lb_Recipients; $_l_RecipLeft; $_l_RecipTop; $_l_RecipRight; $_l_RecipBottom)
					OBJECT MOVE:C664(DOC_lb_Recipients; $_l_RecipLeft; $_l_RecipTop; $_l_RecipRight; ($_l_RecipTop+$_l_RecipientHeight); *)
					
					//LBI_Scrollonresize (->DOC_lb_Recipients)
					If ($_bo_SeeAttachments)
						OBJECT SET VISIBLE:C603(*; "oattachmentLabel"; True:C214)
						If ([DIARY:12]Email_ID:41>0)
							OBJECT SET VISIBLE:C603(*; "oaddAttachment"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oDeleteAttachment"; False:C215)
						Else 
							OBJECT SET VISIBLE:C603(*; "oaddAttachment"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oDeleteAttachment"; True:C214)
						End if 
						If (SD2_bo_AttachmentBoxDone=False:C215)
							LB_SetupListbox(->DOC_lb_Attachments; "DOCT_t"; "DOCT_L"; 1; ->WS_at_Attachments; ->WS_at_AttachmentsPath; ->WS_al_EmailID; ->SD3_at_DocDiaryCode)
							LB_SetColumnHeaders(->DOC_lb_Attachments; "DOCT_L"; 1; "Name"; "Path"; "EmailID"; "DiaryID")
							LB_SetColumnWidths(->DOC_lb_Attachments; "DOCT_t"; 1; 255; 0; 0; 0)
							LB_SetEnterable(->DOC_lb_Attachments; False:C215; 0)
							LB_SetScroll(->DOC_lb_Attachments; -3; -2)
							LB_SETENTRYOPTIONS
							If (Not:C34(DB_bo_FontsInited))
								DB_SetDefaultFonts
							End if 
							
							
							LB_SETFONT(->DOC_lb_Attachments; "DOTC_S55"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
							LB_SETFONT(->DOC_lb_Attachments; "DOCT_t"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
							
							
							LB_Setdividers(->DOC_lb_Attachments; 0; 0)  //Both off
							LB_SetColours(->DOC_lb_Attachments; Light grey:K11:13; White:K11:1; White:K11:1)
							SD2_bo_AttachmentBoxDone:=True:C214
						End if 
						$_l_RecipBottom:=$_l_RecipTop+$_l_RecipientHeight
						//GET OBJECT RECT(DOC_lb_Recipients;$_l_RecipLeft;$_l_RecipTop;$_l_RecipRight;$_l_RecipBottom)
						//Std=52 top of label 37 bottom of recipient box-=15
						If (True:C214)
							OBJECT GET COORDINATES:C663(*; "oattachmentLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
							$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
							OBJECT MOVE:C664(*; "oattachmentLabel"; $_l_LabelLeft; $_l_RecipBottom+15; $_l_LabelRight; $_l_RecipBottom+15+$_l_LabelHeight; *)
							
							OBJECT GET COORDINATES:C663(DOC_lb_Attachments; $_l_AttachLeft; $_l_AttachTop; $_l_Attachright; $_l_AttachBottom)
							$_l_ArraySize:=Size of array:C274(WS_at_Attachments)
							$_l_AttachHeight:=$_l_ArraySize*15
							If ($_l_AttachHeight>60)
								$_l_AttachHeight:=60
								$_bo_ShowScroll:=True:C214
							Else 
								If ($_l_AttachHeight<29)
									$_l_AttachHeight:=29
								End if 
								$_bo_ShowScroll:=False:C215
							End if 
							OBJECT MOVE:C664(DOC_lb_Attachments; $_l_AttachLeft; $_l_RecipBottom+15; $_l_Attachright; $_l_RecipBottom+15+$_l_AttachHeight; *)
							OBJECT GET COORDINATES:C663(*; "oaddAttachment"; $_l_But1Left; $_l_But1Top; $_l_But1Right; $_l_But1Bottom)
							$_l_ButtonHeight:=$_l_But1Bottom-$_l_But1Top
							OBJECT MOVE:C664(*; "oaddAttachment"; $_l_But1Left; $_l_RecipBottom+15; $_l_But1Right; $_l_RecipBottom+15+$_l_ButtonHeight; *)
							OBJECT MOVE:C664(*; "oDeleteAttachment"; $_l_But1Left; $_l_RecipBottom+15+$_l_ButtonHeight+3; $_l_But1Right; $_l_RecipBottom+15+$_l_ButtonHeight+3+$_l_ButtonHeight; *)
							
							$_l_AttachBottom:=$_l_RecipBottom+15+$_l_AttachHeight
							//Distance to subject=10
							OBJECT GET COORDINATES:C663(*; "oSubJectLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
							OBJECT MOVE:C664(*; "oSubJectLabel"; $_l_LabelLeft; $_l_AttachBottom+10; $_l_LabelRight; $_l_AttachBottom+10+$_l_LabelHeight; *)
							OBJECT GET COORDINATES:C663([DIARY:12]Email_Subject:40; $_l_SubjectLeft; $_l_SubjectTop; $_l_SubjectRight; $_l_SubjectBottom)
							$_l_SubjectHeight:=$_l_SubjectBottom-$_l_SubjectTop
							OBJECT MOVE:C664([DIARY:12]Email_Subject:40; $_l_SubjectLeft; $_l_AttachBottom+10; $_l_SubjectRight; $_l_AttachBottom+10+$_l_SubjectHeight; *)
							$_l_SubjectBottom:=$_l_AttachBottom+10+$_l_SubjectHeight
							//Distance to 'from'=10
							OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
							OBJECT MOVE:C664(*; "oFromLabel"; $_l_LabelLeft; $_l_SubjectBottom+10; $_l_LabelRight; $_l_SubjectBottom+10+$_l_LabelHeight; *)
							OBJECT GET COORDINATES:C663(*; "oEmailFromName"; $_l_FromLeft; $_l_FromTop; $_l_FromRight; $_l_FromBottom)
							$_l_FromHeight:=$_l_FromBottom-$_l_FromTop
							OBJECT MOVE:C664(*; "oEmailFromName"; $_l_FromLeft; $_l_SubjectBottom+10; $_l_FromRight; $_l_SubjectBottom+10+$_l_FromHeight; *)
							If ([DIARY:12]Email_ID:41>0)
								$_l_ButtonBottom:=$_l_SubjectBottom+10+$_l_FromHeight
								OBJECT SET VISIBLE:C603(PER_at_EmailNames; False:C215)
								OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
								OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_TextTop; $_l_TextRight; $_l_TextBottom)
								OBJECT MOVE:C664([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_ButtonBottom+5; $_l_TextRight; $_l_TextBottom; *)
							Else 
								OBJECT SET VISIBLE:C603(PER_at_EmailNames; True:C214)
								OBJECT SET VISIBLE:C603(BgetTemplate; True:C214)
								OBJECT GET COORDINATES:C663(PER_at_EmailNames; $_l_FromPopLeft; $_l_FromPopTop; $_l_FromPopRight; $_l_FromPopBottom)
								$_l_popHeight:=$_l_FromPopBottom-$_l_FromPopTop
								OBJECT MOVE:C664(PER_at_EmailNames; $_l_FromPopLeft; $_l_SubjectBottom+8; $_l_FromPopRight; $_l_SubjectBottom+8+$_l_popHeight; *)
								$_l_popBottom:=$_l_SubjectBottom+8+$_l_popHeight
								//distance to 'select tempate=1
								OBJECT GET COORDINATES:C663(BgetTemplate; $_l_SelectLeft; $_l_SelectTop; $_l_SelectRight; $_l_SelectBottom)
								$_l_ButtonHeight:=$_l_SelectBottom-$_l_SelectTop
								OBJECT MOVE:C664(BgetTemplate; $_l_SelectLeft; $_l_popBottom+1; $_l_SelectRight; $_l_popBottom+1+$_l_ButtonHeight; *)
								$_l_ButtonBottom:=$_l_popBottom+1+$_l_ButtonHeight
								//Distance to text...5
								OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_TextTop; $_l_TextRight; $_l_TextBottom)
								OBJECT MOVE:C664([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_ButtonBottom+5; $_l_TextRight; $_l_TextBottom; *)
								
							End if 
						End if 
					Else 
						OBJECT SET VISIBLE:C603(DOC_lb_Attachments; False:C215)
						OBJECT SET VISIBLE:C603(*; "oattachmentLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oaddAttachment"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDeleteAttachment"; False:C215)
						$_l_RecipBottom:=$_l_RecipTop+$_l_RecipientHeight
						OBJECT GET COORDINATES:C663(*; "oSubJectLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
						$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
						
						OBJECT MOVE:C664(*; "oSubJectLabel"; $_l_LabelLeft; $_l_RecipBottom+10; $_l_LabelRight; $_l_RecipBottom+10+$_l_LabelHeight; *)
						OBJECT GET COORDINATES:C663([DIARY:12]Email_Subject:40; $_l_SubjectLeft; $_l_SubjectTop; $_l_SubjectRight; $_l_SubjectBottom)
						$_l_SubjectHeight:=$_l_SubjectBottom-$_l_SubjectTop
						OBJECT MOVE:C664([DIARY:12]Email_Subject:40; $_l_SubjectLeft; $_l_RecipBottom+10; $_l_SubjectRight; $_l_RecipBottom+10+$_l_SubjectHeight; *)
						$_l_SubjectBottom:=$_l_RecipBottom+10+$_l_SubjectHeight
						//Distance to 'from'=10
						OBJECT GET COORDINATES:C663(*; "oFromLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
						OBJECT MOVE:C664(*; "oFromLabel"; $_l_LabelLeft; $_l_SubjectBottom+10; $_l_LabelRight; $_l_SubjectBottom+10+$_l_LabelHeight; *)
						OBJECT GET COORDINATES:C663(*; "oEmailFromName"; $_l_FromLeft; $_l_FromTop; $_l_FromRight; $_l_FromBottom)
						$_l_FromHeight:=$_l_FromBottom-$_l_FromTop
						OBJECT MOVE:C664(*; "oEmailFromName"; $_l_FromLeft; $_l_SubjectBottom+10; $_l_FromRight; $_l_SubjectBottom+10+$_l_FromHeight; *)
						If ([DIARY:12]Email_ID:41>0)
							OBJECT SET VISIBLE:C603(PER_at_EmailNames; False:C215)
							OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
							$_l_ButtonBottom:=$_l_SubjectBottom+10+$_l_FromHeight
							OBJECT SET VISIBLE:C603(PER_at_EmailNames; False:C215)
							OBJECT SET VISIBLE:C603(BgetTemplate; False:C215)
							OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_TextTop; $_l_TextRight; $_l_TextBottom)
							OBJECT MOVE:C664([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_ButtonBottom+5; $_l_TextRight; $_l_TextBottom; *)
							//SET VISIBLE(SD2_l_SendEmailNow;False)`moved to top of this method 09/07/08 -kmw
							//SET VISIBLE(SD2_l_SaveDraft;False)`moved to top of this method 09/07/08 -kmw
							
						Else 
							OBJECT SET VISIBLE:C603(PER_at_EmailNames; True:C214)
							OBJECT SET VISIBLE:C603(BgetTemplate; True:C214)
							OBJECT GET COORDINATES:C663(PER_at_EmailNames; $_l_FromPopLeft; $_l_FromPopTop; $_l_FromPopRight; $_l_FromPopBottom)
							$_l_popHeight:=$_l_FromPopBottom-$_l_FromPopTop
							OBJECT MOVE:C664(PER_at_EmailNames; $_l_FromPopLeft; $_l_SubjectBottom+8; $_l_FromPopRight; $_l_SubjectBottom+8+$_l_FromHeight+1; *)
							$_l_popBottom:=$_l_SubjectBottom+8+$_l_FromHeight+1
							//distance to 'select tempate=1
							OBJECT GET COORDINATES:C663(BgetTemplate; $_l_SelectLeft; $_l_SelectTop; $_l_SelectRight; $_l_SelectBottom)
							$_l_ButtonHeight:=$_l_SelectBottom-$_l_SelectTop
							OBJECT MOVE:C664(BgetTemplate; $_l_SelectLeft; $_l_popBottom+1; $_l_SelectRight; $_l_popBottom+1+$_l_ButtonHeight; *)
							$_l_ButtonBottom:=$_l_popBottom+1+$_l_ButtonHeight
							//Distance to text...5
							OBJECT GET COORDINATES:C663([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_TextTop; $_l_TextRight; $_l_TextBottom)
							OBJECT MOVE:C664([DIARY:12]Email_Text:42; $_l_TextLeft; $_l_ButtonBottom+5; $_l_TextRight; $_l_TextBottom; *)
						End if 
						
						
						
					End if 
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("SD2_DiaryINLLPInterface"; $_t_oldMethodName)
