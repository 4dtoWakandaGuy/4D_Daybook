//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_CopyDocuments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 21:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SubDirectories; 0)
	//ARRAY TEXT(DOC_at_DocList;0)
	//ARRAY TEXT(DOC_at_RemoteDocuments;0)
	C_BOOLEAN:C305(<>SYS_bo_DelayedCopyofBackup; $_bo_CheckTiming; $_bo_DeferTillTime; $_bo_EmailOK; $_bo_IsMacintosh; $_bo_SendAlertEmail; $1; SYS_bo_BackupEnabled)
	C_DATE:C307($_d_BackupDate; BP_d_BackupDate)
	C_LONGINT:C283($_l_BackupHour; $_l_BackupMinute; $_l_DirectoriesIndex; $_l_DocumentIndex; $_l_Error; BP_l_DeleteArchives; BP_l_NumOfFile; BP_lastAlerttimestamp)
	C_TEXT:C284($_t_BackupMessage; $_t_BackupSubject; Folder separator:K24:12; $_t_LastCharacter; $_t_LocalBackupPath; $_t_LocalDirectory; $_t_LocalDocumentPath; $_t_oldMethodName; $_t_RemoteBackupPath; $_t_RemoteDirectory; $_t_RemoteFile)
	C_TEXT:C284($2; $3; BP_t_BackupAdminEmail; BP_t_LocalBackupPath; BP_t_RemoteBackupPath)
	C_TIME:C306(BP_ti_BackupTime)
End if 
//Code Starts Here

BP_LoadPrefs
$_t_oldMethodName:=ERR_MethodTracker("BP_CopyDocuments")
$_bo_CheckTiming:=False:C215

If (Count parameters:C259>=1)
	If ($1=True:C214)
		$_bo_CheckTiming:=True:C214
		
	End if 
End if 
$_bo_IsMacintosh:=Is macOS:C1572
//Folder separator:=DB_DirSymbol 
If (SYS_bo_BackupEnabled)  //Is backup sync enabled
	$_bo_DeferTillTime:=False:C215
	If ($_bo_CheckTiming)
		$_d_BackupDate:=BP_d_BackupDate
		$_l_BackupHour:=(BP_ti_BackupTime\3600)  //Backup Hour
		$_l_BackupMinute:=((BP_ti_BackupTime\60)%60)  //Backup Min
		If (Current time:C178(*)<BP_ti_BackupTime) & ($_d_BackupDate<=Current date:C33)
			$_bo_DeferTillTime:=True:C214
		End if 
	End if 
	If (Not:C34($_bo_DeferTillTime))
		If (Count parameters:C259<3)
			$_bo_SendAlertEmail:=(BP_lastAlerttimestamp+86400)<BP_Timestamp  //if last alert email was sent 24 hours before than sent again
		Else 
			$_bo_SendAlertEmail:=False:C215
		End if 
		If (Count parameters:C259>=3)
			$_t_LocalBackupPath:=$2
			$_t_RemoteBackupPath:=$3
		Else 
			$_t_LocalBackupPath:=BP_t_LocalBackupPath
			$_t_RemoteBackupPath:=BP_t_RemoteBackupPath
		End if 
		If (($_t_LocalBackupPath#"") & (Test path name:C476($_t_LocalBackupPath)=Is a folder:K24:2))
			
			If (($_t_RemoteBackupPath#"") & (Test path name:C476($_t_RemoteBackupPath)=Is a folder:K24:2))
				
				If (BP_l_NumOfFile=0)  //Just leave the latest last modified backup 2 files (Log & data file)
					BP_l_NumOfFile:=1
				End if 
				ARRAY TEXT:C222($_at_SubDirectories; 0)
				ARRAY TEXT:C222(DOC_at_DocList; 0)
				//``
				$_t_LastCharacter:=Substring:C12($_t_LocalBackupPath; Length:C16($_t_LocalBackupPath); 1)
				
				If ($_t_LastCharacter=Folder separator:K24:12)
					$_t_LocalBackupPath:=Substring:C12($_t_LocalBackupPath; 1; Length:C16($_t_LocalBackupPath)-1)
				End if 
				$_t_LastCharacter:=Substring:C12($_t_RemoteBackupPath; Length:C16($_t_RemoteBackupPath); 1)
				If ($_t_LastCharacter=Folder separator:K24:12)
					
					$_t_RemoteBackupPath:=Substring:C12($_t_RemoteBackupPath; 1; Length:C16($_t_RemoteBackupPath)-1)
				End if 
				//```
				$_l_Error:=DocumentList($_t_LocalBackupPath; ->DOC_at_DocList; 1; 1; 0; BP_l_NumOfFile; True:C214)
				//Wondering why we test teh existence of a Directory_Symbol at the end of the path statement below but not in the method document list
				//SURELY it would be better to test above and strip if off...
				
				
				For ($_l_DocumentIndex; 1; Size of array:C274(DOC_at_DocList))
					If (DOC_at_DocList{$_l_DocumentIndex}#"")
						
						$_t_LastCharacter:=Substring:C12($_t_LocalBackupPath; Length:C16($_t_LocalBackupPath); 1)
						
						If ($_t_LastCharacter=Folder separator:K24:12)
							$_t_LocalDocumentPath:=$_t_LocalBackupPath+DOC_at_DocList{$_l_DocumentIndex}
						Else 
							$_t_LocalDocumentPath:=$_t_LocalBackupPath+Folder separator:K24:12+DOC_at_DocList{$_l_DocumentIndex}
						End if 
						If (Test path name:C476($_t_LocalDocumentPath)=Is a document:K24:1) | (Test path name:C476($_t_LocalDocumentPath)=Is a folder:K24:2)
							
							$_t_LastCharacter:=Substring:C12($_t_RemoteBackupPath; Length:C16($_t_RemoteBackupPath); 1)
							If ($_t_LastCharacter=Folder separator:K24:12)
								$_t_RemoteFile:=$_t_RemoteBackupPath+DOC_at_DocList{$_l_DocumentIndex}
								
							Else 
								$_t_RemoteFile:=$_t_RemoteBackupPath+Folder separator:K24:12+DOC_at_DocList{$_l_DocumentIndex}
							End if 
							If (Test path name:C476($_t_LocalDocumentPath)=Is a document:K24:1)
								If (Test path name:C476($_t_RemoteFile)#Is a document:K24:1)  //BSW If doc is not at remote server than copy it else don't do anything
									If ($_bo_IsMacintosh)
										DOC_CopyFilesUsingOS($_t_LocalDocumentPath; $_t_RemoteFile)
										
									Else 
										COPY DOCUMENT:C541($_t_LocalDocumentPath; $_t_RemoteFile)
									End if 
								End if 
							Else 
								//it must be a directory
								APPEND TO ARRAY:C911($_at_SubDirectories; $_t_LocalDocumentPath)
							End if 
						End if 
					End if 
				End for 
				If (Size of array:C274($_at_SubDirectories)>0)
					//There were folders to copy. We will recall this method with some parameters(this could be interative to several layers
					For ($_l_DirectoriesIndex; 1; Size of array:C274($_at_SubDirectories))
						$_t_LocalDirectory:=$_at_SubDirectories{$_l_DirectoriesIndex}
						$_t_RemoteDirectory:=BP_t_RemoteBackupPath+$_t_LocalDirectory
						If (Test path name:C476($_t_RemoteDirectory)#Is a folder:K24:2)
							CREATE FOLDER:C475($_t_RemoteDirectory)
						End if 
						//This could go to several levels deep...are we sure the arrays have to be 255 chars and not text??? this could EASILY break is they are limited to 255 chars
						//But Path_Test traps should prevent errors..
						BP_CopyDocuments(False:C215; $_t_LocalDirectory; $_t_RemoteDirectory)
					End for 
				End if 
				If (Count parameters:C259<3)  //if 3 or more this is an iterative call so don't do this bit
					If (BP_l_DeleteArchives=1)  //Means Delete Archives
						ARRAY TEXT:C222(DOC_at_DocList; 0)
						ARRAY TEXT:C222(DOC_at_RemoteDocuments; 0)
						$_l_Error:=DocumentList(BP_t_LocalBackupPath; ->DOC_at_DocList; 0; 1; 0)
						$_l_Error:=DocumentList(BP_t_RemoteBackupPath; ->DOC_at_RemoteDocuments; 0; 1; 0)
						
						For ($_l_DocumentIndex; 1; Size of array:C274(DOC_at_RemoteDocuments))
							
							$_t_RemoteFile:=DOC_at_RemoteDocuments{$_l_DocumentIndex}
							If (Find in array:C230(DOC_at_DocList; $_t_RemoteFile)=-1)  //If doc is not on local path than delete it
								$_t_LastCharacter:=Substring:C12(BP_t_RemoteBackupPath; Length:C16(BP_t_RemoteBackupPath); 1)
								If ($_t_LastCharacter=Folder separator:K24:12)
									$_t_RemoteFile:=BP_t_RemoteBackupPath+$_t_RemoteFile
								Else 
									$_t_RemoteFile:=BP_t_RemoteBackupPath+Folder separator:K24:12+$_t_RemoteFile
								End if 
								DELETE DOCUMENT:C159($_t_RemoteFile)
							End if 
							
						End for 
						
					End if 
				End if 
			Else 
				
				If ($_bo_SendAlertEmail)  //if last alert email was sent 24 hours before than sent again
					
					$_t_BackupSubject:="Urgent Daybook Server message"
					If (BP_t_RemoteBackupPath="")
						$_t_BackupMessage:="Remote Backup path on Daybook Server is empty and backup is enabled"
					Else 
						$_t_BackupMessage:="Remote Backup path not found on Daybook Server"
					End if 
					$_t_BackupMessage:=$_t_BackupMessage+Char:C90(13)+$_t_RemoteBackupPath
					$_bo_EmailOK:=BP_SendEmail(BP_t_BackupAdminEmail; BP_t_BackupAdminEmail; $_t_BackupSubject; $_t_BackupMessage)
					If ($_bo_EmailOK)
						BP_lastAlerttimestamp:=BP_Timestamp
					End if 
				End if 
				
			End if 
			
		Else 
			
			If ($_bo_SendAlertEmail)  //if last alert email was sent 24 hours before than sent again
				
				$_t_BackupSubject:="Urgent Daybook Server message"
				If (BP_t_LocalBackupPath="")
					$_t_BackupMessage:="Local Backup path on Daybook Server is empty and backup is enabled"
				Else 
					$_t_BackupMessage:="Local Backup path not found on Daybook Server"
				End if 
				
				$_t_BackupMessage:=$_t_BackupMessage+Char:C90(13)+$_t_LocalBackupPath
				
				$_t_BackupMessage:="Invalid Local Backup path on Daybook Server"
				$_bo_EmailOK:=BP_SendEmail(BP_t_BackupAdminEmail; BP_t_BackupAdminEmail; $_t_BackupSubject; $_t_BackupMessage)
				If ($_bo_EmailOK)
					BP_lastAlerttimestamp:=BP_Timestamp
				End if 
			End if 
			
		End if 
	Else 
		//The copying of documents is not to happen yet. SO we are going to  tell the backgrounder to run them.
		<>SYS_bo_DelayedCopyofBackup:=True:C214
		StartBackgrounder
		
	End if 
	
End if 
ERR_MethodTrackerReturn("BP_CopyDocuments"; $_t_oldMethodName)
