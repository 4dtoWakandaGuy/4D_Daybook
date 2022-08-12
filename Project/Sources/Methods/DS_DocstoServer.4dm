//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_DocstoServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2010 01:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BlobIDS; 0)
	C_LONGINT:C283($_l_AttachementsIndex; $_l_CurrentRow; $_l_DocIsOK; $_l_Process; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Owner)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_DocstoServer")
//this method will find any diary attachments on this machine
//it will put them into a blob
//reset the location
//and then start a process on the server
//NB the server process will take the blob put it in a document
//delete the blob
//and then update the location again.
//This process executes on a client machine
//and by its very nature is self correcting

ARRAY LONGINT:C221($_al_BlobIDS; 0)
//$1 email id
If (Count parameters:C259>=2)
	//wait till the calling Process_Ends-if its in a transaction it gets a prob
	Repeat 
		DelayTicks(60*6)
	Until (Process state:C330($2)<0)
	
End if 

If ((Application type:C494=4) | (True:C214))
	//we run this only on the client
	//no point doing this is single user version
	READ WRITE:C146([EMAIL_ATTACHMENTS:103])
	READ WRITE:C146([DATA_AUDITS:102])
	$_t_Owner:=Get_Email_Owner
	QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]Location:6=$_t_Owner; *)
	QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Email_ID:2>0)
	ARRAY LONGINT:C221($_al_BlobIDS; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
	$_l_CurrentRow:=1
	If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
		For ($_l_AttachementsIndex; 1; Records in selection:C76([EMAIL_ATTACHMENTS:103]))
			If (Check_Locked(->[EMAIL_ATTACHMENTS:103]; 0))
				$_l_DocIsOK:=Test path name:C476([EMAIL_ATTACHMENTS:103]Attachment_Path:3)
				If ($_l_DocIsOK=1)  //doc is on this machine(just in case)
					//Document is not locked by another process
					//i am using the data audit table because it has a blob field        `
					CREATE RECORD:C68([DATA_AUDITS:102])
					[DATA_AUDITS:102]TABLE_NUMBER:2:=-3
					[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
					[DATA_AUDITS:102]DOCUMENT_NAME:5:=[EMAIL_ATTACHMENTS:103]Attachment_Name:4
					DOCUMENT TO BLOB:C525([EMAIL_ATTACHMENTS:103]Attachment_Path:3; [DATA_AUDITS:102]DATA:6)
					DB_SaveRecord(->[DATA_AUDITS:102])
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
					$_al_BlobIDS{$_l_CurrentRow}:=[DATA_AUDITS:102]X_ID:1
					$_l_CurrentRow:=$_l_CurrentRow+1
					[EMAIL_ATTACHMENTS:103]Location:6:="BLOB: "+String:C10([DATA_AUDITS:102]X_ID:1)
					DB_SaveRecord(->[EMAIL_ATTACHMENTS:103])
					AA_CheckFileUnlocked(->[EMAIL_ATTACHMENTS:103]FileNo:5)
					NEXT RECORD:C51([EMAIL_ATTACHMENTS:103])
					
				End if 
			End if 
		End for 
		UNLOAD RECORD:C212([EMAIL_ATTACHMENTS:103])
		UNLOAD RECORD:C212([DATA_AUDITS:102])
		READ ONLY:C145([EMAIL_ATTACHMENTS:103])
		READ ONLY:C145([DATA_AUDITS:102])
		//now run a process on the server to pick these up
		If (Application type:C494=4D Remote mode:K5:5)
			$_l_Process:=Execute on server:C373("DS_PickupDocs"; 64000; "Copy Documents"; -3; $_t_Owner)
		Else 
			$_l_Process:=New process:C317("DS_PickupDocs"; 64000; "Copy Documents"; -3; $_t_Owner)
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("DS_DocstoServer"; $_t_oldMethodName)