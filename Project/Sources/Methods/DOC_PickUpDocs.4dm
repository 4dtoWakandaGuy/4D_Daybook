//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_PickUpDocs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AuditIDS; 0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_bo_FolderisOK; $_l_Delay; $_l_DocumentPathLength; $_l_DocumentType; $_l_Index; $_l_Iteration; $_l_Repeats; $1)
	C_TEXT:C284($_t_ApplicationPath; $_t_DirectoryLevelString; Folder separator:K24:12; $_t_DocumenExtension; $_t_DocumentNameMinusExtension; $_t_FullDocumentPath; $_t_IterationString; $_t_oldMethodName; $_t_StoreDocumentsPath; $2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DOC_PickUpDocs")

//This method is based on DOC_PickupDocs

//this method runs on the server-NEVER ON SINGLE USER OR CLIENT
//and array of [DATA_AUDITS]X_ID's is passed to this process
//this will find those records and move them to folders on the server
//it will then find the corresponding record in the[EMAIL_ATTACHMENTS] table
//and update the path and location
//TRACE
//Fri, Feb 17, 2006 root: Changed the code to save documents in a type folder and sublevel folders by year/month


ARRAY LONGINT:C221($_al_AuditIDS; 0)

If (Application type:C494=5) | (True:C214)
	//this is the server
	
	//Folder separator:=DB_DirSymbol
	
	
	If (Count parameters:C259>=2)
		$_t_ApplicationPath:=PathFromPathName(Data file:C490)
		$_t_StoreDocumentsPath:=$_t_ApplicationPath+"Documents"  //make a folder for the folders
		$_bo_FolderisOK:=Test path name:C476($_t_StoreDocumentsPath)
		If ($_bo_FolderisOK<0)  //folder does not exist
			//so create it
			CREATE FOLDER:C475($_t_StoreDocumentsPath)
		End if 
		
		$_t_StoreDocumentsPath:=$_t_ApplicationPath+"Documents"+Folder separator:K24:12+$2  //$2 is never empty it is the user name
		$_bo_FolderisOK:=Test path name:C476($_t_StoreDocumentsPath)
		If ($_bo_FolderisOK<0)  //folder does not exist
			CREATE FOLDER:C475($_t_StoreDocumentsPath)  //so create it
		End if 
		//Here check the number of folders in this folder...get the highest folder number and check the number of files in it..if it has more than 100 create a new folder at $_t_StoreDocumentsPath and store the doc in there
		$_t_DirectoryLevelString:=$_t_StoreDocumentsPath
		READ WRITE:C146([DATA_AUDITS:102])
		QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=$1)
		DB_lockFile(->[DATA_AUDITS:102])
		For ($_l_Index; 1; Records in selection:C76([DATA_AUDITS:102]))
			LOAD RECORD:C52([DATA_AUDITS:102])
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[DATA_AUDITS:102]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(10*$_l_Delay)
				End if 
			Until ($_bo_OK)
			[DATA_AUDITS:102]TABLE_NUMBER:2:=-4
			DB_SaveRecord(->[DATA_AUDITS:102])
		End for 
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DATA_AUDITS:102]))
		SELECTION TO ARRAY:C260([DATA_AUDITS:102]X_ID:1; $_al_AuditIDS)
		For ($_l_Index; 1; Size of array:C274($_al_AuditIDS))
			If ($_al_AuditIDS{$_l_Index}#0)
				QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]X_ID:1=$_al_AuditIDS{$_l_Index})
				If (Records in selection:C76([DATA_AUDITS:102])>0)
					If (Check_Locked(->[DATA_AUDITS:102]; 0))
						//record is not locked
						//test this document is not already here
						$_t_StoreDocumentsPath:=$_t_DirectoryLevelString
						$_t_FullDocumentPath:=$_t_StoreDocumentsPath+Folder separator:K24:12+[DATA_AUDITS:102]DOCUMENT_NAME:5
						$_l_DocumentPathLength:=Length:C16($_t_FullDocumentPath)
						If ($_t_FullDocumentPath[[$_l_DocumentPathLength-3]]=".")
							$_t_DocumentNameMinusExtension:=Substring:C12($_t_FullDocumentPath; 1; $_l_DocumentPathLength-4)
							$_t_DocumenExtension:=Substring:C12($_t_FullDocumentPath; $_l_DocumentPathLength-2; $_l_DocumentPathLength)
						Else 
							$_t_DocumentNameMinusExtension:=$_t_FullDocumentPath
							$_t_DocumenExtension:=""
						End if 
						
						If ($_t_DocumenExtension#"")
							$_t_StoreDocumentsPath:=$_t_StoreDocumentsPath+Folder separator:K24:12+$_t_DocumenExtension+"s"
							If (Test path name:C476($_t_StoreDocumentsPath)#Is a folder:K24:2)
								CREATE FOLDER:C475($_t_StoreDocumentsPath)
							End if 
						End if 
						
						$_t_StoreDocumentsPath:=$_t_StoreDocumentsPath+Folder separator:K24:12+String:C10(Year of:C25(Current date:C33(*)))
						If (Test path name:C476($_t_StoreDocumentsPath)#Is a folder:K24:2)
							CREATE FOLDER:C475($_t_StoreDocumentsPath)
						End if 
						
						$_t_StoreDocumentsPath:=$_t_StoreDocumentsPath+Folder separator:K24:12+MonthName(Current date:C33(*))
						If (Test path name:C476($_t_StoreDocumentsPath)#Is a folder:K24:2)
							CREATE FOLDER:C475($_t_StoreDocumentsPath)
						End if 
						
						$_t_FullDocumentPath:=$_t_StoreDocumentsPath+Folder separator:K24:12+[DATA_AUDITS:102]DOCUMENT_NAME:5
						$_l_DocumentPathLength:=Length:C16($_t_FullDocumentPath)
						If ($_t_FullDocumentPath[[$_l_DocumentPathLength-3]]=".")
							$_t_DocumentNameMinusExtension:=Substring:C12($_t_FullDocumentPath; 1; $_l_DocumentPathLength-4)
							$_t_DocumenExtension:=Substring:C12($_t_FullDocumentPath; $_l_DocumentPathLength-2; $_l_DocumentPathLength)
						Else 
							$_t_DocumentNameMinusExtension:=$_t_FullDocumentPath
							$_t_DocumenExtension:=""
						End if 
						
						$_l_Iteration:=1
						$_t_IterationString:=""
						Repeat 
							$_l_DocumentType:=Test path name:C476($_t_DocumentNameMinusExtension+$_t_IterationString+$_t_DocumenExtension)
							If ($_l_DocumentType=Is a document:K24:1)  //have to change name
								$_t_IterationString:=String:C10($_l_Iteration)
								$_l_Iteration:=$_l_Iteration+1
							End if 
						Until ($_l_DocumentType<=0)
						
						If ($_t_DocumenExtension#"")  //Sat, Feb 4, 2006 bwalia: minor bug which missed "." from file name is fixed here
							$_t_DocumenExtension:="."+$_t_DocumenExtension
						End if 
						
						$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentNameMinusExtension+$_t_IterationString+$_t_DocumenExtension)
						CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
						BLOB TO DOCUMENT:C526($_t_DocumentNameMinusExtension+$_t_IterationString+$_t_DocumenExtension; [DATA_AUDITS:102]DATA:6)
						//the blob is now on the server
						If (OK=1)
							READ WRITE:C146([DOCUMENTS:7])
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]DOC_LOCATION:22="BLOB: "+String:C10([DATA_AUDITS:102]X_ID:1))
							If (Records in selection:C76([DOCUMENTS:7])>0)
								If (Check_Locked(->[DOCUMENTS:7]; 99))
									[DOCUMENTS:7]DOC_PATH:21:=$_t_DocumentNameMinusExtension+$_t_IterationString+$_t_DocumenExtension  //new path
									[DOCUMENTS:7]DOC_LOCATION:22:="Server"
									
									If (Test path name:C476([DOCUMENTS:7]DOC_PATH:21)=Is a document:K24:1)  //BSW 13/09/02
										If ([DOCUMENTS:7]DOC_CREATOR:19#"")
											_O_SET DOCUMENT CREATOR:C531([DOCUMENTS:7]DOC_PATH:21; [DOCUMENTS:7]DOC_CREATOR:19)
										Else 
											_O_SET DOCUMENT CREATOR:C531([DOCUMENTS:7]DOC_PATH:21; "    ")
										End if 
										If ([DOCUMENTS:7]DOC_TYPE:18#"")
											//_O_SET DOCUMENT TYPE([DOCUMENTS]DOC_PATH;[DOCUMENTS]DOC_TYPE)
										Else 
											//_O_SET DOCUMENT TYPE([DOCUMENTS]DOC_PATH;" ")
										End if 
									End if 
									
									DB_SaveRecord(->[DOCUMENTS:7])
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))
									DB_DeletionControl(->[DATA_AUDITS:102])
									QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]X_ID:1=$_al_AuditIDS{$_l_Index})
									DELETE RECORD:C58([DATA_AUDITS:102])  //dont need this one
								End if 
							End if 
						End if 
						
					End if 
				End if 
			End if 
			
		End for 
		
	End if 
End if 
UNLOAD RECORD:C212([DATA_AUDITS:102])
UNLOAD RECORD:C212([DOCUMENTS:7])
READ ONLY:C145([DOCUMENTS:7])
READ ONLY:C145([DATA_AUDITS:102])
ERR_MethodTrackerReturn("DOC_PickupDocs"; $_t_oldMethodName)