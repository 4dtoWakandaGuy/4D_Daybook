//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_GetPicturefromDrive
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>Email_AttachmentPath)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	ARRAY TEXT:C222($_at_DocumentsList; 0)
	ARRAY TEXT:C222($_at_ExpectedSubFolderList; 0)
	ARRAY TEXT:C222($_at_FolderList; 0)
	ARRAY TEXT:C222($_at_Volumes; 0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	//ARRAY TEXT(DS_at_ValidExtensions;0)
	//ARRAY TEXT(DS_at_ValidMacFiletypes;0)
	C_BLOB:C604(DS_PICDOCBLOB; vEmail_Attachment_BLOB)
	C_BOOLEAN:C305($_bo_AddExtension; $_bo_Exit; $_bo_GotAttachment; $_bo_NoLocalDoc; $_bo_Ok; CB_bo_PrefsLoaded; DOC_bo_EmailGotAttachment; Prd_bo_PicturetypesLoaded)
	C_DATE:C307($_d_EmailDocCreatedDate; $_d_EmailDocModifiedDate; Email_D_DoccreatedDate; Email_D_DocModifiedDate)
	C_LONGINT:C283($_l_ArraySize; $_l_Element; $_l_Index; $_l_Length; $_l_Platform; $_l_PrimaryPathPosition; $_l_Process; $_l_SubLevel; $_l_SubStringLevel; $_l_TestPath; $_l_Ticks)
	C_LONGINT:C283(CAT_l_MaxFolderSize; CAT_l_MAXLEVELS; CAT_l_MINLEVELS)
	C_REAL:C285($2)
	C_TEXT:C284(<>DefPicType; $_t_CurrentActiveDirectory; Folder separator:K24:12; $_t_DocumentName; $_t_EmailAttachCreator; $_t_EmailAttachmentExtn; $_t_EmailAttachType; $_t_FileExtension; $_t_LastChar; $_t_NewPath; $_t_NewPathName)
	C_TEXT:C284($_t_oldMethodName; $_t_OldPathName; $_t_PrimaryPath; $_t_SubPath; $_t_Substring; $0; $1; $3; $4; $5; $6)
	C_TEXT:C284($Email_AttachmentPath; Email_Attachment_Creator; Email_Attachment_Extension; Email_Attachment_Type; Email_AttachmentPath)
	C_TIME:C306($_ti_DocumentRef; $_ti_EmailAttachCreatedTime; $_ti_EmailAttachModifiedTime; Email_ti_DocCreatedtime; EMail_ti_DocModifiedTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_GetPicturefromDrive")
//this method will get the graphic from the drive
//the drive is the server so this is going to first check
//if there is a local copy of the graphic
//if there is not then we will look on the server
//and move the document to the local drive
$_l_Platform:=0


//Folder separator:=DB_DirSymbol 

$_t_PrimaryPath:=$1
If ($_t_PrimaryPath#"")
	$_t_LastChar:=$_t_PrimaryPath[[Length:C16($_t_PrimaryPath)]]
	If ($_t_LastChar=Folder separator:K24:12)
		$_t_PrimaryPath:=Substring:C12($_t_PrimaryPath; 1; Length:C16($_t_PrimaryPath)-1)
	Else 
		$_t_PrimaryPath:=$1
	End if 
End if 

Case of 
	: ($2=1)  //Doc Name is Product code
		$_t_DocumentName:=$4
		//take out illegal chars
		If ($6#"")  //override the default
			$_t_DocumentName:=$6
		Else 
			$_t_DocumentName:=DS_ResolvedPictureName($_t_DocumentName)
			
		End if 
		
	: ($2=2)  //Doc Name is short code
		$_t_DocumentName:=$5
		If ($6#"")  //override the default
			$_t_DocumentName:=$6
		Else 
			$_t_DocumentName:=DS_ResolvedPictureName($_t_DocumentName)
			
		End if 
		
		//Take out illegal chars
	: ($2=3)  //Doc Name is NAMED
		$_t_DocumentName:=$6
		$_bo_AddExtension:=False:C215
	Else 
		$_t_DocumentName:=$6
		$_bo_AddExtension:=False:C215
End case 

If (Not:C34(CB_bo_PrefsLoaded))
	CAT_LoadPrefs
	CB_bo_PrefsLoaded:=True:C214
	
End if 
$0:=""
$_t_CurrentActiveDirectory:=Get 4D folder:C485
//TRACE
Case of   //C
	: (Application type:C494=4)  //4D Client`C
		//this is a path to a local folder to store the pic
		
		$_t_NewPath:=DB_GetDocumentPath+Folder separator:K24:12+"DaybookPictures"  //here construct the sub folder path
		$_l_TestPath:=Test path name:C476($_t_NewPath)
		If ($_l_TestPath#Is a folder:K24:2)
			CREATE FOLDER:C475($_t_NewPath+Folder separator:K24:12+"DaybookPictures")
		End if 
		If ($_l_TestPath=Is a folder:K24:2)
			//it should be!
			//CAT_l_MINLEVELS
			If (CAT_l_MINLEVELS>0)
				ARRAY TEXT:C222($_at_ExpectedSubFolderList; 0)
				ARRAY TEXT:C222($_at_ExpectedSubFolderList; CAT_l_MINLEVELS)
				For ($_l_Index; 1; CAT_l_MINLEVELS)
					If (Length:C16($_t_DocumentName)>=$_l_Index)
						$_t_Substring:=Substring:C12($_t_DocumentName; 1; $_l_Index)
						$_at_ExpectedSubFolderList{$_l_Index}:=$_t_Substring
					Else 
						ARRAY TEXT:C222($_at_ExpectedSubFolderList; $_l_Index-1)
						$_l_Index:=99999
					End if 
					
				End for 
				For ($_l_Index; 1; Size of array:C274($_at_ExpectedSubFolderList))
					$_l_TestPath:=Test path name:C476($_t_NewPath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index})
					If (Not:C34($_l_TestPath=Is a folder:K24:2))
						//this subfolder does not exist, create it
						CREATE FOLDER:C475($_t_NewPath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index})
					End if 
					$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index}
					
				End for 
				//we now have the starting point built
				$_bo_Ok:=False:C215
				$_l_SubLevel:=1
				If (CAT_l_MAXLEVELS<CAT_l_MINLEVELS)
					CAT_l_MAXLEVELS:=CAT_l_MINLEVELS
				End if 
				
				Repeat 
					DOCUMENT LIST:C474($_t_NewPath; $_at_DocumentsList)
					If (Size of array:C274($_at_DocumentsList)>=CAT_l_MaxFolderSize)
						If ($_l_SubLevel+CAT_l_MINLEVELS<CAT_l_MINLEVELS)
							//there are too many items in the folder
							$_l_SubStringLevel:=CAT_l_MINLEVELS+$_l_SubLevel
							If (Length:C16($_t_DocumentName)>=$_l_SubStringLevel)
								$_t_Substring:=Substring:C12($_t_DocumentName; 1; $_l_SubStringLevel)
								$_l_TestPath:=Test path name:C476($_t_NewPath+Folder separator:K24:12+$_t_Substring)
								If (Not:C34($_l_TestPath=Is a folder:K24:2))
									//this subfolder does not exist, create it
									CREATE FOLDER:C475($_t_NewPath+Folder separator:K24:12+$_t_Substring)
								End if 
								$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+$_t_Substring
							Else 
								//well it cant go deeper because there are no chars left
								$_bo_Ok:=True:C214
							End if 
						Else 
							$_bo_Ok:=True:C214
							
						End if 
					Else 
						$_bo_Ok:=True:C214
						//has to go here anyway
					End if 
					
				Until ($_bo_Ok)
				
				
				
				
			End if 
			
		End if 
		
		
		
		
		
		
		
		
	Else 
		//single user
		//path to a local folder to
		If ($_t_PrimaryPath#"")
			If (Test path name:C476($_t_PrimaryPath+Folder separator:K24:12)=Is a folder:K24:2)
				$_t_NewPath:=$_t_PrimaryPath
			Else 
				$_t_NewPath:=""
				Gen_Alert("The directory "+$_t_PrimaryPath+" is not available, please correct this problem to load pictures")
			End if 
			
		End if 
		
End case 
//$_t_NewPath is a path to a local folder
$_bo_AddExtension:=True:C214

If ($_t_NewPath#"")
	//Note the above change. NG March 2004
	//when the pic is loaded successfully we could
	//store the 'sub' path within the directory to the picture
	//we would then only need to put in a catch so that if it is not at that
	//location we extract the last bit(the file name) and start from the top
	//this could greatly speed up finding the pic.
	//especially if the folder is not organized on our structual way.
	//DS_CheckNameWithExtension
	
	If (Not:C34(Prd_bo_PicturetypesLoaded))
		$_l_ArraySize:=Size of array:C274(CAT_al_SupportedPicTypes)
		ARRAY TEXT:C222(DS_at_ValidExtensions; 0)
		ARRAY TEXT:C222(DS_at_ValidMacFiletypes; 0)
		ARRAY TEXT:C222(DS_at_ValidExtensions; $_l_ArraySize)
		ARRAY TEXT:C222(DS_at_ValidMacFiletypes; $_l_ArraySize)
		$_l_Element:=0
		For ($_l_Index; 1; Size of array:C274(CAT_al_SupportedPicTypes))
			If (CAT_al_SupportedPicTypes{$_l_Index}=1)
				$_l_Element:=$_l_Element+1
				DS_at_ValidExtensions{$_l_Element}:=CAT_at_PictureTypeExtensions{$_l_Index}
				DS_at_ValidMacFiletypes{$_l_Element}:=CAT_at_PictureMacTypes{$_l_Index}
			End if 
			
		End for 
		ARRAY TEXT:C222(DS_at_ValidExtensions; $_l_Element)
		ARRAY TEXT:C222(DS_at_ValidMacFiletypes; $_l_Element)
		Prd_bo_PicturetypesLoaded:=True:C214
	End if 
	
	<>DefPicType:="JPG"
	If ($_t_DocumentName#"")
		If (Length:C16($_t_DocumentName)>4)
			If ($_t_DocumentName[[(Length:C16($_t_DocumentName)-3)]]=".") | ($_bo_AddExtension=False:C215)
				//name has an extension
				$_t_NewPath:=$_t_NewPath+Substring:C12($_t_DocumentName; 1; Length:C16($_t_DocumentName)-4)
				$_t_FileExtension:=Substring:C12($_t_DocumentName; (Length:C16($_t_DocumentName)-2); Length:C16($_t_DocumentName))
			Else 
				
				$_t_NewPath:=$_t_NewPath+$_t_DocumentName
				//+"."+◊DefPicType
				$_t_DocumentName:=$_t_DocumentName+"."+<>DefPicType
				$_t_FileExtension:=""
			End if 
		Else 
			If ($_bo_AddExtension)
				$_t_NewPath:=$_t_NewPath+$_t_DocumentName
				//+"."+◊DefPicType
				//$_t_DocumentName:=$_t_DocumentName+"."+◊DefPicType
				$_t_FileExtension:=""
			Else 
				$_t_NewPath:=$_t_NewPath+$_t_DocumentName
				$_t_FileExtension:=""
			End if 
			
		End if 
		
		$_t_NewPathName:=DS_CheckNameWithExtension($_t_NewPath; $_t_FileExtension; ->DS_at_ValidExtensions)
		
		
		If ($_t_NewPathName#$_t_NewPath)
			//the doc name is changing
			$_t_NewPath:=$_t_NewPathName
			
		End if 
		$_l_TestPath:=Test path name:C476($_t_NewPath)
		
		
		$_bo_NoLocalDoc:=True:C214
		ARRAY TEXT:C222($_at_Volumes; 0)
		VOLUME LIST:C471($_at_Volumes)
		If ($_l_TestPath=1)  //D
			$0:=$_t_NewPath
			$_bo_NoLocalDoc:=False:C215
		Else 
			
			//Need to try subdirectories
			//Get the file name from the path
			//remember the extension is not in the path now
			
			$_t_DocumentName:=FileNamefromPath($_t_NewPath)
			
			$_l_Length:=1
			$_t_SubPath:=$_t_PrimaryPath
			$_bo_Exit:=False:C215
			
			
			Repeat 
				If (Length:C16($_t_DocumentName)>=$_l_Length)
					$_t_Substring:=Substring:C12($_t_DocumentName; 1; $_l_Length)
					$_t_SubPath:=$_t_SubPath+Folder separator:K24:12+$_t_Substring
					If (Test path name:C476($_t_SubPath)=Is a folder:K24:2)
						//here try with the extensions
						$_t_OldPathName:=$_t_SubPath+Folder separator:K24:12+$_t_DocumentName
						$_t_NewPathName:=DS_CheckNameWithExtension($_t_SubPath+Folder separator:K24:12+$_t_DocumentName; $_t_FileExtension; ->DS_at_ValidExtensions)
						
						//if the filename was found with an extension the file name is now changed
						//``````
						If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
							
							If (OK=1)
								$_bo_NoLocalDoc:=False:C215
								$0:=$_t_NewPathName
							End if 
							$_bo_Exit:=True:C214
						Else 
							$_l_Length:=$_l_Length+1
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				End if 
			Until ($_bo_Exit) | ($_l_Length>Length:C16($_t_DocumentName))
			
			
			If ($_bo_Exit) & ($_bo_NoLocalDoc)
				//the document was not found in our structured tier
				$_l_PrimaryPathPosition:=Find in array:C230($_at_Volumes; $_t_PrimaryPath)
				If ($_l_PrimaryPathPosition>0)
					$_t_PrimaryPath:=$_t_PrimaryPath+Folder separator:K24:12
				End if 
				
				If (Test path name:C476($_t_PrimaryPath)=Is a folder:K24:2)
					$_l_Length:=1
					ARRAY TEXT:C222($_at_FolderList; 0)
					FOLDER LIST:C473($_t_PrimaryPath; $_at_FolderList)
					
					
					For ($_l_Index; 1; Size of array:C274($_at_FolderList))
						If ($_t_PrimaryPath[[Length:C16($_t_PrimaryPath)]]#Folder separator:K24:12)
							$_t_SubPath:=$_t_PrimaryPath+Folder separator:K24:12+$_at_FolderList{$_l_Index}
						Else 
							$_t_SubPath:=$_t_PrimaryPath+$_at_FolderList{$_l_Index}
						End if 
						//`here change file name
						
						$_t_OldPathName:=$_t_SubPath+Folder separator:K24:12+$_t_DocumentName
						$_t_NewPathName:=DS_CheckNameWithExtension($_t_SubPath+Folder separator:K24:12+$_t_DocumentName; $_t_FileExtension; ->DS_at_ValidExtensions)
						
						//```````````
						If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
							$_bo_NoLocalDoc:=False:C215
							$0:=$_t_NewPathName
							//this returns the whole name so that can be stored if you wish
							$_l_Index:=Size of array:C274($_at_FolderList)
							
							
							
							
						Else 
							If (Test path name:C476($_t_SubPath)=Is a folder:K24:2)
								$_bo_Ok:=DS_AttachmentFromSubDirectory($_t_SubPath; $_t_DocumentName; False:C215)
								If ($_bo_Ok)
									$0:=<>Email_AttachmentPath
									<>Email_AttachmentPath:=""
									
									$_bo_NoLocalDoc:=False:C215
									$_l_Index:=Size of array:C274($_at_FolderList)
								End if 
							End if 
						End if 
						
					End for 
					
					
				End if 
				
			End if 
			
		End if 
		
		If ($_bo_NoLocalDoc)
			//no local document
			//get document for server
			
			Case of   //C
				: (Application type:C494=4)  //4D Client`C
					SET BLOB SIZE:C606(DS_PICDOCBLOB; 0)
					START_SEMAPHORE("GetAttachmentIntoBlob")  //Only one can update version at a time
					//`NG March 2004 this was passing$PrimaryPath!!!! instead of
					//pic name with path
					
					$_l_Process:=Execute on server:C373("DS_attachmenttoBLOB"; 64000; "Attachment Into BLOB"; $_t_PrimaryPath+Folder separator:K24:12+$_t_DocumentName; $_t_PrimaryPath)
					//```
					
					Repeat 
						DelayTicks(60)
						GET PROCESS VARIABLE:C371($_l_Process; DOC_bo_EmailGotAttachment; $_bo_GotAttachment)
						If ($_bo_GotAttachment)
							//we now need to set the subpath of where to store the file
							
							GET PROCESS VARIABLE:C371($_l_Process; vEmail_Attachment_BLOB; DS_PICDOCBLOB)
							//GET PROCESS VARIABLE($_l_Process;Email_Attachment_Creator;$_t_EmailAttachCreator)
							GET PROCESS VARIABLE:C371($_l_Process; Email_Attachment_Type; $_t_EmailAttachType)
							GET PROCESS VARIABLE:C371($_l_Process; Email_Attachment_Extension; $_t_EmailAttachmentExtn)
							GET PROCESS VARIABLE:C371($_l_Process; Email_AttachmentPath; $Email_AttachmentPath)
							GET PROCESS VARIABLE:C371($_l_Process; Email_D_DoccreatedDate; $_d_EmailDocCreatedDate)
							
							GET PROCESS VARIABLE:C371($_l_Process; Email_ti_DocCreatedtime; $_ti_EmailAttachCreatedTime)
							GET PROCESS VARIABLE:C371($_l_Process; Email_D_DocModifiedDate; $_d_EmailDocModifiedDate)
							GET PROCESS VARIABLE:C371($_l_Process; EMail_ti_DocModifiedTime; $_ti_EmailAttachModifiedTime)
							
							
							If ($_t_EmailAttachmentExtn#"")
								$_t_NewPathName:=$_t_NewPath+"."+$_t_EmailAttachmentExtn
							Else 
								If ($_t_FileExtension#"")
									$_t_NewPathName:=$_t_NewPath+"."+$_t_FileExtension
								Else 
									$_t_NewPathName:=$_t_NewPath
								End if 
							End if 
							
							Case of 
								: (Is macOS:C1572)
									If ($_t_EmailAttachType#"")
										$_ti_DocumentRef:=DB_CreateDocument($_t_NewPathName; $_t_EmailAttachType)  // Save the document of your choice
									Else 
										$_ti_DocumentRef:=DB_CreateDocument($_t_NewPathName)  // Save the document of your choice
									End if 
								Else 
									$_ti_DocumentRef:=DB_CreateDocument($_t_NewPathName)  // Save the document of your choice
							End case 
							//Gen_Alert ($_t_NewPathName)  ` 04/10/2010
							
							If (OK=1)  // If a document has been created
								CLOSE DOCUMENT:C267($_ti_DocumentRef)
								BLOB TO DOCUMENT:C526($_t_NewPathName; DS_PICDOCBLOB)
								If ((OK=1) & (Test path name:C476($_t_NewPathName)=Is a document:K24:1))
									If (Is macOS:C1572)
										//If ($_t_EmailAttachCreator#"")
										//_O_SET DOCUMENT CREATOR($_t_NewPathName;$_t_EmailAttachCreator)
										//Else
										//_O_SET DOCUMENT CREATOR($_t_NewPathName;"    ")
										//End if
										//If ($_t_EmailAttachType#"")
										//_O_SET DOCUMENT TYPE($_t_NewPathName;$_t_EmailAttachType)
										//Else
										//_O_SET DOCUMENT TYPE($_t_NewPathName;"    ")
										//End if
									End if 
									SET DOCUMENT PROPERTIES:C478($_t_NewPathName; False:C215; False:C215; $_d_EmailDocCreatedDate; $_ti_EmailAttachCreatedTime; $_d_EmailDocModifiedDate; $_ti_EmailAttachModifiedTime)
									
									$0:=$_t_NewPathName
								End if 
							End if 
						End if 
					Until ((Error#0) | ($_bo_GotAttachment) | ((Tickcount:C458-$_l_Ticks)>2800) | (OK=1))
					//SET PROCESS VARIABLE(-1;◊DOC_bo_EmailGotAttachment;False)
					Stop_Semaphore("GetAttachmentIntoBlob")
					
				Else 
					//single user
					$0:=""
					
			End case 
		End if 
	Else 
		$0:=""
	End if 
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("DS_GetPicturefromDrive"; $_t_oldMethodName)