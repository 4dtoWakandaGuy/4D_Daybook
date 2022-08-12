//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_MoveDocToserver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2010 01:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BlobIDS; 0)
	C_LONGINT:C283($DOCISOK; $I; $ITEM; $_l_Process)
	C_TEXT:C284($_t_oldMethodName; $Owner)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_MoveDocToServer")
//NG June 2007 Based on DS_DocsToserver this method works in a similare was except that the source of data in daybook is the DOCUMENTS table
//this method will find any external documents on this machine
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

If ((Application type:C494=4) | (True:C214))
	//we run this only on the client
	//no point doing this is single user version
	READ WRITE:C146([DOCUMENTS:7])
	READ WRITE:C146([DATA_AUDITS:102])
	$Owner:=Get_Email_Owner
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]DOC_LOCATION:22=$Owner)
	ARRAY LONGINT:C221($_al_BlobIDS; Records in selection:C76([DOCUMENTS:7]))
	$item:=1
	If (Records in selection:C76([DOCUMENTS:7])>0)
		For ($i; 1; Records in selection:C76([DOCUMENTS:7]))
			If (Check_Locked(->[DOCUMENTS:7]; 1))
				$DocisOK:=Test path name:C476([DOCUMENTS:7]DOC_PATH:21)
				If ($DOCisOK=1)  //doc is on this machine(just in case)
					//Document is not locked by another process
					//i am using the data audit table because it has a blob field        `
					CREATE RECORD:C68([DATA_AUDITS:102])
					[DATA_AUDITS:102]TABLE_NUMBER:2:=-3
					[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
					[DATA_AUDITS:102]DOCUMENT_NAME:5:=[DOCUMENTS:7]Heading:2
					DOCUMENT TO BLOB:C525([DOCUMENTS:7]DOC_PATH:21; [DATA_AUDITS:102]DATA:6)
					DB_SaveRecord(->[DATA_AUDITS:102])
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
					$_al_BlobIDS{$item}:=[DATA_AUDITS:102]X_ID:1
					$item:=$item+1
					[DOCUMENTS:7]DOC_LOCATION:22:="BLOB: "+String:C10([DATA_AUDITS:102]X_ID:1)
					DB_SaveRecord(->[DOCUMENTS:7])
					
					
					
				End if 
			End if 
			NEXT RECORD:C51([DOCUMENTS:7])
		End for 
		UNLOAD RECORD:C212([DOCUMENTS:7])
		UNLOAD RECORD:C212([DATA_AUDITS:102])
		READ ONLY:C145([DOCUMENTS:7])
		READ ONLY:C145([DATA_AUDITS:102])
		//now run a process on the server to pick these up
		If (Application type:C494=4D Remote mode:K5:5)
			$_l_Process:=Execute on server:C373("DOC_PickupDocs"; 512000; "Copy Documents"; -3; $Owner)
		Else 
			$_l_Process:=New process:C317("DOC_PickupDocs"; 512000; "Copy Documents"; -3; $Owner)
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("DOC_MoveDocToServer"; $_t_oldMethodName)