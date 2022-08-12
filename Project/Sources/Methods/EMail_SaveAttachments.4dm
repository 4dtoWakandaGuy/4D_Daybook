//%attributes = {}
If (False:C215)
	//Project Method Name:      EMail_SaveAttachments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 18:36`Method: EMail_SaveAttachments
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_attachmentNames; 0)
	ARRAY TEXT:C222($_at_attachmentPaths; 0)
	C_BOOLEAN:C305($_bo_DocPathOK)
	C_LONGINT:C283($_l_Index; $_l_Process; $5; $7)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_DiaryCode; $_t_oldMethodName; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EMail_SaveAttachments")

READ WRITE:C146([EMAIL_ATTACHMENTS:103])
LOAD RECORD:C52([EMAIL_ATTACHMENTS:103])

If (Count parameters:C259>=5)
	Case of 
		: ($5=1)
			//update existing
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			SELECTION TO ARRAY:C260([EMAIL_ATTACHMENTS:103]Attachment_Name:4; $_at_attachmentNames; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; $_at_attachmentPaths)
			If (Size of array:C274($_at_attachmentNames)>Size of array:C274($1->))
				DELETE SELECTION:C66([EMAIL_ATTACHMENTS:103])
				ARRAY TO SELECTION:C261($1->; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; $2->; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; $3->; [EMAIL_ATTACHMENTS:103]DiaryID:1; $4->; [EMAIL_ATTACHMENTS:103]Email_ID:2)
			Else 
				ARRAY TO SELECTION:C261($1->; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; $2->; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; $3->; [EMAIL_ATTACHMENTS:103]DiaryID:1; $4->; [EMAIL_ATTACHMENTS:103]Email_ID:2)
			End if 
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			
			If (Count parameters:C259>=6)
				If ($6#"")
					DB_lockFile(->[EMAIL_ATTACHMENTS:103])
					$_t_DiaryCode:=$6
					APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=$_t_DiaryCode)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				End if 
			End if 
			If (Count parameters:C259>=7)
				If ($7#0)
					QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
					
					FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
					For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
						[EMAIL_ATTACHMENTS:103]Email_ID:2:=$7
						DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
						AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
						NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
					End for 
					
					
				End if 
			End if 
			
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6:=Get_Email_Owner)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
			For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
				$_bo_DocPathOK:=Test path name:C476([EMAIL_ATTACHMENTS:103]Attachment_Path:3)=Is a document:K24:1
				If ($_bo_DocPathOK)
					[EMAIL_ATTACHMENTS:103]Document_Type:7:=_o_Document type:C528([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					[EMAIL_ATTACHMENTS:103]Document_Creator:8:=_o_Document creator:C529([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					
				End if 
				
				NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
			End for 
			
			
		: ($5=2)
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			ARRAY TO SELECTION:C261($1->; [EMAIL_ATTACHMENTS:103]Attachment_Name:4; $2->; [EMAIL_ATTACHMENTS:103]Attachment_Path:3; $3->; [EMAIL_ATTACHMENTS:103]DiaryID:1; $4->; [EMAIL_ATTACHMENTS:103]Email_ID:2)
			If (Count parameters:C259>=6)
				DB_lockFile(->[EMAIL_ATTACHMENTS:103])
				APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=$6)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			End if 
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6:=Get_Email_Owner)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
			For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
				$_bo_DocPathOK:=Test path name:C476([EMAIL_ATTACHMENTS:103]Attachment_Path:3)=Is a document:K24:1
				If ($_bo_DocPathOK)
					[EMAIL_ATTACHMENTS:103]Document_Type:7:=_o_Document type:C528([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					[EMAIL_ATTACHMENTS:103]Document_Creator:8:=_o_Document creator:C529([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
				End if 
				NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
			End for 
			
			If (Count parameters:C259>=6)
				If ($6#"")
					DB_lockFile(->[EMAIL_ATTACHMENTS:103])
					APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=$6)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				End if 
			End if 
			If (Count parameters:C259>=7)
				If ($7#0)
					QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
					FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
					For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
						[EMAIL_ATTACHMENTS:103]Email_ID:2:=$7
						DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
						AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
						NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
					End for 
					
				End if 
				
			End if 
		: ($5=3)
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			
			DB_lockFile(->[EMAIL_ATTACHMENTS:103])
			APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6:=Get_Email_Owner)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
			For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
				$_bo_DocPathOK:=Test path name:C476([EMAIL_ATTACHMENTS:103]Attachment_Path:3)=Is a document:K24:1
				If ($_bo_DocPathOK)
					[EMAIL_ATTACHMENTS:103]Document_Type:7:=_o_Document type:C528([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					[EMAIL_ATTACHMENTS:103]Document_Creator:8:=_o_Document creator:C529([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
					DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					
				End if 
				NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
			End for 
			
			
			If (Count parameters:C259>=6)
				If ($6#"")
					DB_lockFile(->[EMAIL_ATTACHMENTS:103])
					$_t_DiaryCode:=$6
					APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1:=$_t_DiaryCode)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[EMAIL_ATTACHMENTS:103]))
				End if 
			End if 
			If (Count parameters:C259>=7)
				If ($7#0)
					
					QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
					FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
					For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
						[EMAIL_ATTACHMENTS:103]Email_ID:2:=$7
						DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
						AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
						NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
					End for 
					
				End if 
				
			End if 
			
		: ($5=4)
			If (Count parameters:C259>=7)
				QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
				FIRST RECORD:C50([EMAIL_ATTACHMENTS:103])
				For ($_l_Index; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
					[EMAIL_ATTACHMENTS:103]Email_ID:2:=$7
					DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
				End for 
			End if 
		: ($5=5)
			QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=[DIARY:12]Diary_Code:3)
			If (Count parameters:C259>=7)
				$_l_Process:=New process:C317("DS_DocstoServer"; 128000; "Moving Documents"; [DIARY:12]Email_ID:41)
			End if 
			
	End case 
End if 
UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])

READ ONLY:C145([EMAIL_ATTACHMENTS:103])
LOAD RECORD:C52([EMAIL_ATTACHMENTS:103])
ERR_MethodTrackerReturn("EMail_SaveAttachments"; $_t_oldMethodName)