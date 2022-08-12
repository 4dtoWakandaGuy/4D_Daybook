If (False:C215)
	//object Name: [USER]SD2_EmailEntry.oDeleteAttachment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2013 10:27
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
	C_LONGINT:C283($_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]SD2_EmailEntry.oDeleteAttachment"; Form event code:C388)
If (WS_at_Attachments>0)
	$_l_SelectedRow:=WS_at_Attachments
	If ($_l_SelectedRow>0)
		DELETE FROM ARRAY:C228(WS_at_Attachments; $_l_SelectedRow; 1)
		DELETE FROM ARRAY:C228(WS_at_AttachmentsPath; $_l_SelectedRow; 1)
		DELETE FROM ARRAY:C228(WS_al_EmailID; $_l_SelectedRow; 1)
		DELETE FROM ARRAY:C228(SD3_at_DocDiaryCode; $_l_SelectedRow; 1)
		
		SD2_DiaryINLLPInterface("SD2_EmailEntry")
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.oDeleteAttachment"; $_t_oldMethodName)
