//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_attachmenttoBLOB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2012 09:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	ARRAY TEXT:C222($_at_FoldersList; 0)
	ARRAY TEXT:C222($_at_Volumes; 0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	//ARRAY TEXT(DS_at_ValidExtensions;0)
	//ARRAY TEXT(DS_at_ValidMacFiletypes;0)
	//ARRAY TEXT(DS_S4_ValidMacFiletypes;0)
	C_BLOB:C604(vEmail_Attachment_BLOB)
	C_BOOLEAN:C305($_bo_ClientSemaphore; $_bo_Exit; $_bo_invisible; $_bo_Locked; $_bo_OK; CB_bo_PrefsLoaded; DOC_bo_EmailGotAttachment)
	C_DATE:C307(Email_D_DoccreatedDate; Email_D_DocModifiedDate)
	C_LONGINT:C283(<>DOC_ServerComm; $_l_CurrentRow; $_l_index; $_l_Length; $_l_Level; $_l_TIck; $_l_VolumeRow)
	C_TEXT:C284($_t_ClientSemaphore; Folder separator:K24:12; $_t_DocumentPath; $_t_Extension; $_t_Filename; $_t_lastChar; $_t_NewPathName; $_t_oldMethodName; $_t_oldMethodName2; $_t_PrimaryPath; $_t_SubPath)
	C_TEXT:C284($_t_VolumeRow; $1; $2; Email_Attachment_Extension; Email_Attachment_Type; Email_AttachmentPath)
	C_TIME:C306(Email_ti_DocCreatedtime; EMail_ti_DocModifiedTime)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DS_attachmenttoBLOB")

//$1 File NO
$_t_SubPath:=""
DOC_bo_EmailGotAttachment:=False:C215
While (Semaphore:C143("Lifting_Document_On_Server"))  //set this on the server...(the client will wait)
	DelayTicks(2)
End while 
<>DOC_ServerComm:=1

If (Application type:C494=4D Server:K5:6)
	If (Not:C34(CB_bo_PrefsLoaded))
		CAT_LoadPrefs
	End if 
	ARRAY TEXT:C222(DS_at_ValidExtensions; 0)
	ARRAY TEXT:C222(DS_S4_ValidMacFiletypes; 0)
	ARRAY TEXT:C222(DS_at_ValidExtensions; Size of array:C274(CAT_al_SupportedPicTypes))
	ARRAY TEXT:C222(DS_S4_ValidMacFiletypes; Size of array:C274(CAT_al_SupportedPicTypes))
	$_l_CurrentRow:=0
	$_t_oldMethodName2:=ERR_MethodTracker("DS_attachmenttoBLOB:2")
	For ($_l_index; 1; Size of array:C274(CAT_al_SupportedPicTypes))
		If (CAT_al_SupportedPicTypes{$_l_index}=1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			DS_at_ValidExtensions{$_l_CurrentRow}:=CAT_at_PictureTypeExtensions{$_l_index}
			DS_S4_ValidMacFiletypes{$_l_CurrentRow}:=CAT_at_PictureMacTypes{$_l_index}
		End if 
		
	End for 
	ARRAY TEXT:C222(DS_at_ValidExtensions; $_l_CurrentRow)
	ARRAY TEXT:C222(DS_at_ValidMacFiletypes; $_l_CurrentRow)
	
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_DocumentPath:=$1
			//Folder separator:=DB_DirSymbol 
			
			Case of 
				: (Is macOS:C1572)
					$_t_DocumentPath:=Replace string:C233($_t_DocumentPath; "\\"; ": ")
				Else 
					$_t_DocumentPath:=Replace string:C233($_t_DocumentPath; ": "; "\\")
			End case 
			$_t_Filename:=FileNamefromPath($_t_DocumentPath)
			If (Length:C16($_t_Filename)>4)
				If ($_t_Filename[[(Length:C16($_t_Filename)-3)]]=".")
					//name has an extension
					$_t_Extension:=Substring:C12($_t_Filename; (Length:C16($_t_Filename)-2); Length:C16($_t_Filename))
				Else 
					$_t_Extension:=""
				End if 
			Else 
				$_t_Extension:=""
				
			End if 
			DOC_bo_EmailGotAttachment:=False:C215
			//Email_Attachment_Creator:=""
			Email_Attachment_Type:=""
			Email_Attachment_Extension:=""
			Email_Attachment_Type:=""
			$_t_NewPathName:=DS_CheckNameWithExtension($_t_DocumentPath; $_t_Extension; ->DS_at_ValidExtensions)
			If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
				DOCUMENT TO BLOB:C525($_t_NewPathName; vEmail_Attachment_BLOB)
				If (OK=1)
					//Email_Attachment_Creator:=_o_Document creator($_t_NewPathName)
					DS_GetFiletype($_t_NewPathName; ->Email_Attachment_Extension; ->Email_Attachment_Type)
					Email_AttachmentPath:=$_t_NewPathName  //NG March 2004
					GET DOCUMENT PROPERTIES:C477($_t_NewPathName; $_bo_Locked; $_bo_invisible; Email_D_DoccreatedDate; Email_ti_DocCreatedtime; Email_D_DocModifiedDate; EMail_ti_DocModifiedTime)
					DOC_bo_EmailGotAttachment:=True:C214
				End if 
				
			Else 
				//NG March 2004 modification to handle subdividing
				If (Count parameters:C259>=2)
					
					//Folder separator:=DB_DirSymbol 
					
					
					//Need to try subdirectories
					//Get the file name from the path
					$_t_Filename:=FileNamefromPath($_t_DocumentPath)
					//$2 is the 'base' folder
					$_l_Length:=1
					$_t_SubPath:=$2
					$_t_PrimaryPath:=$2
					Case of 
						: (Is macOS:C1572)
							
							$_t_PrimaryPath:=Replace string:C233($_t_PrimaryPath; "\\"; ": ")
							
							
						Else 
							
							$_t_PrimaryPath:=Replace string:C233($_t_PrimaryPath; ": "; "\\")
							
					End case 
					If ($_t_SubPath#"")
						$_t_LastChar:=$_t_SubPath[[Length:C16($_t_SubPath)]]
						If ($_t_LastChar=Folder separator:K24:12)
							$_t_SubPath:=Substring:C12($_t_SubPath; 1; Length:C16($_t_SubPath)-1)
						End if 
					End if 
					ARRAY TEXT:C222($_at_Volumes; 0)
					
					VOLUME LIST:C471($_at_Volumes)
					$_l_VolumeRow:=Find in array:C230($_at_Volumes; $_t_SubPath)
					If ($_l_VolumeRow>0)
						$_t_SubPath:=$_t_SubPath+Folder separator:K24:12
					End if 
					
					$_bo_Exit:=False:C215
					If ($_t_SubPath#"")
						Repeat 
							If (Length:C16($_t_Filename)>=$_l_Length)
								$_t_SubPath:=Substring:C12($_t_Filename; 1; $_l_Length)
								If ($_t_SubPath[[Length:C16($_t_SubPath)]]=Folder separator:K24:12)
									$_t_SubPath:=$_t_SubPath+$_t_SubPath
								Else 
									$_t_SubPath:=$_t_SubPath+Folder separator:K24:12+$_t_SubPath
								End if 
								If (Test path name:C476($_t_SubPath)=Is a folder:K24:2)
									$_t_NewPathName:=DS_CheckNameWithExtension($_t_SubPath+Folder separator:K24:12+$_t_Filename; $_t_Extension; ->DS_at_ValidExtensions)
									
									If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
										DOCUMENT TO BLOB:C525($_t_NewPathName; vEmail_Attachment_BLOB)
										If (OK=1)
											
											//Email_Attachment_Creator:=_o_Document creator($_t_NewPathName)
											DS_GetFiletype($_t_NewPathName; ->Email_Attachment_Extension; ->Email_Attachment_Type)
											Email_AttachmentPath:=$_t_NewPathName
											//this returns the whole name so that can be stored if you wish
											GET DOCUMENT PROPERTIES:C477($_t_NewPathName; $_bo_Locked; $_bo_invisible; Email_D_DoccreatedDate; Email_ti_DocCreatedtime; Email_D_DocModifiedDate; EMail_ti_DocModifiedTime)
											DOC_bo_EmailGotAttachment:=True:C214
										End if 
										$_bo_Exit:=True:C214
										
										
									Else 
										$_l_Length:=$_l_Length+1
									End if 
								Else 
									$_bo_Exit:=True:C214
								End if 
								
							End if 
						Until ($_bo_Exit) | ($_l_Length>Length:C16($_t_Filename))
						
						If ($_bo_Exit) & (DOC_bo_EmailGotAttachment=False:C215)
							//the document was not found in our structured tier
							$_t_PrimaryPath:=$2
							If ($2#"")
								$_t_lastChar:=$2[[Length:C16($2)]]
								If ($_t_lastChar=Folder separator:K24:12)
									$_t_PrimaryPath:=Substring:C12($2; 1; Length:C16($2)-1)
								End if 
							End if 
							VOLUME LIST:C471($_at_Volumes)
							$_l_VolumeRow:=Find in array:C230($_at_Volumes; $_t_PrimaryPath)
							If ($_l_VolumeRow>0)
								$_t_PrimaryPath:=$_t_PrimaryPath+Folder separator:K24:12
							End if 
							If (Test path name:C476($_t_PrimaryPath)=Is a folder:K24:2)
								$_l_Length:=1
								ARRAY TEXT:C222($_at_FoldersList; 0)
								
								FOLDER LIST:C473($_t_PrimaryPath; $_at_FoldersList)
								$_l_Level:=2
								For ($_l_index; 1; Size of array:C274($_at_FoldersList))
									If ($_t_PrimaryPath[[Length:C16($_t_PrimaryPath)]]=Folder separator:K24:12)
										$_t_SubPath:=$_t_PrimaryPath+$_at_FoldersList{$_l_index}
									Else 
										$_t_SubPath:=$_t_PrimaryPath+Folder separator:K24:12+$_at_FoldersList{$_l_index}
									End if 
									$_t_NewPathName:=DS_CheckNameWithExtension($_t_SubPath+Folder separator:K24:12+$_t_Filename; $_t_Extension; ->DS_at_ValidExtensions)
									If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
										DOCUMENT TO BLOB:C525($_t_NewPathName; vEmail_Attachment_BLOB)
										If (OK=1)
											
											//Email_Attachment_Creator:=_o_Document creator($_t_NewPathName)
											DS_GetFiletype($_t_NewPathName; ->Email_Attachment_Extension; ->Email_Attachment_Type)
											Email_AttachmentPath:=$_t_NewPathName
											
											GET DOCUMENT PROPERTIES:C477($_t_NewPathName; $_bo_Locked; $_bo_invisible; Email_D_DoccreatedDate; Email_ti_DocCreatedtime; Email_D_DocModifiedDate; EMail_ti_DocModifiedTime)
											DOC_bo_EmailGotAttachment:=True:C214
											//this returns the whole name so that can be stored if you wish
											$_l_index:=Size of array:C274($_at_FoldersList)
										End if 
										
										
										
									Else 
										$_t_oldMethodName2:=ERR_MethodTracker("DS_attachmenttoBLOB:17")
										$_bo_OK:=DS_AttachmentFromSubDirectory($_t_SubPath; $_t_Filename)
										If ($_bo_OK)
											$_l_index:=Size of array:C274($_at_FoldersList)
											DOC_bo_EmailGotAttachment:=True:C214
											
										End if 
									End if 
									
								End for 
								
							End if 
							
						End if 
					End if 
					
				End if 
				
			End if 
			$_l_TIck:=Tickcount:C458
			CLEAR SEMAPHORE:C144("Lifting_Document_On_Server")  //here we clear this semaphore so the client can get the document and then wait till it is finished
			
			Repeat 
				DelayTicks(60)
				$_bo_ClientSemaphore:=Not:C34(Test semaphore:C652("GetAttachmentIntoBlob"))
			Until (($_bo_ClientSemaphore) | ((Tickcount:C458-$_l_TIck)>2400))
		End if 
	End if 
End if 
DOC_bo_EmailGotAttachment:=False:C215
CLEAR SEMAPHORE:C144("Lifting_Document_On_Server")  // as a precaution we do this here as well to make sure it is never left set
ERR_MethodTrackerReturn("DS_attachmenttoBLOB"; $_t_oldMethodName)