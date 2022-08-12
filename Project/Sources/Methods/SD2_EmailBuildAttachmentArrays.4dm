//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EmailBuildAttachmentArrays
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
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_POINTER:C301($_ptr_DiaryCode; $_ptr_DiaryID; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EmailBuildAttachmentArrays")

//SD2_EmailBuildRecipientArrays -Added 21/10/08 v621b120a -kmw (Code factored out with Minor_Modifcations from SD2_DiaryInLLB to tidy it up and allow to be called more than once)


//
$_ptr_DiaryCode:=$1
$_ptr_DiaryID:=$2
//
If ($_ptr_DiaryID-><=0)
	QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=$_ptr_DiaryCode->)
Else   //this is needed so that where a group of diary items relate to a single email `there is only one group of records containing the attachments
	QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Email_ID:2=$_ptr_DiaryID->)
End if 
SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; WS_at_Attachments; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; WS_at_AttachmentsPath; [EMAIL_ATTACHMENTS:103]Email_ID:2; WS_al_EmailID; [EMAIL_ATTACHMENTS:103]DiaryID:1; SD3_at_DocDiaryCode)
ERR_MethodTrackerReturn("SD2_EmailBuildAttachmentArrays"; $_t_oldMethodName)
