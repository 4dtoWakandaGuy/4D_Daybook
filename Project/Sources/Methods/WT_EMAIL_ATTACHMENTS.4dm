//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_EMAIL_ATTACHMENTS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WS_al_EmailID;0)
	ARRAY TEXT:C222($_at_Attachments; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_LONGINT:C283($_l_Index; $_l_OK)
	C_TEXT:C284($_t_AttachmentPath; $_t_DocumentNamePath; $_t_DocumentPath; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_EMAIL_ATTACHMENTS")
ARRAY TEXT:C222($_at_Types; 0)
ARRAY TEXT:C222($_at_Attachments; 0)

$_t_DocumentPath:=DB_SelectDocument(""; "*"; "Select Document(s) to Attach"; 1; ->$_at_Attachments)
$_l_OK:=OK
//NG June 2007 changing this to use select document and allow multiple doc selection
//$_l_OK:=AP Select document ($_t_AttachmentPath;$_at_Types)
//$_l_OK:=ok BS this caues it to break
If ($_l_OK=1) & (Size of array:C274($_at_Attachments)>0)
	For ($_l_Index; 1; Size of array:C274($_at_Attachments))
		$_t_AttachmentPath:=$_at_Attachments{$_l_Index}
		$_t_DocumentNamePath:=FileNamefromPath($_t_AttachmentPath)
		
		If ((Find in array:C230(WS_at_Attachments; $_t_DocumentNamePath)=-1) & (Find in array:C230(WS_at_AttachmentsPath; $_t_AttachmentPath)=-1))
			
			INSERT IN ARRAY:C227(WS_at_Attachments; 9999; 1)
			INSERT IN ARRAY:C227(WS_at_AttachmentsPath; 9999; 1)
			INSERT IN ARRAY:C227(WS_al_EmailID; 9999; 1)
			INSERT IN ARRAY:C227(SD3_at_DocDiaryCode; 9999; 1)
			WS_al_EmailID{Size of array:C274(WS_al_EmailID)}:=0
			SD3_at_DocDiaryCode{Size of array:C274(SD3_at_DocDiaryCode)}:=[DIARY:12]Diary_Code:3
			WS_at_AttachmentsPath{Size of array:C274(WS_at_AttachmentsPath)}:=$_t_AttachmentPath
			WS_at_Attachments{Size of array:C274(WS_at_AttachmentsPath)}:=$_t_DocumentNamePath
			
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("WT_EMAIL_ATTACHMENTS"; $_t_oldMethodName)