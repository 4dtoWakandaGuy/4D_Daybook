//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_Picturestoserver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Documents; 0)
	ARRAY TEXT:C222($_at_ExpectedSubFolderList; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_OK)
	C_LONGINT:C283(<>DS_l_PictureReceiverProcess; $_l_Index; $_l_Length; $_l_PathType; $_l_SubLevel; $_l_SubStringLength; $1; $3; CAT_l_MaxFolderSize; CAT_l_MAXLEVELS; CAT_l_MINLEVELS)
	C_TEXT:C284($_t_CatPicturePath; Folder separator:K24:12; $_t_DocumentName; $_t_FileTypeExtension; $_t_oldMethodName; $_t_SubString; $2; $4; $5; Cat_T_PicturePath; DS_S3_FileExtension)
	C_TEXT:C284(DS_S4_MacFileType)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_Picturestoserver")
//NG March 2004
//This method transfers pictures to the server.
//this is run as a process on a server
//the picture document should already be in blob in the data audits table
<>DS_l_PictureReceiverProcess:=Current process:C322
DS_S3_FileExtension:=$4  //NG April 2020 This is no longer relevent-but $4 is still passed
DS_S4_MacFileType:=$5  //NG April 2020 This is no longer relevent--i have stopped it passing this
If (Application type:C494=5)
	If ($3>0)
		READ WRITE:C146([DATA_AUDITS:102])
		
		QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]X_ID:1=$3)
		If (Records in selection:C76([DATA_AUDITS:102])>0)
			//Folder separator:=DB_DirSymbol 
			
			//If we are passed pointer we have to make a document
			If ($1>0)
				If ([CATALOGUE:108]x_ID:1#$1)
					QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=$1)
				End if 
				$_t_CatPicturePath:=[CATALOGUE:108]Image_Path:4
			Else 
				CAT_LoadPrefs
				//As we are here it must be set
				//CAT_T_PicturePath is the path
				$_t_CatPicturePath:=Cat_T_PicturePath
			End if 
			If ($_t_CatPicturePath#"")
				
				If (Not:C34(Test path name:C476($_t_CatPicturePath)=Is a folder:K24:2))
					//Base folder does not exist
					CREATE FOLDER:C475($_t_CatPicturePath)
					
				End if 
				//``
				$_l_PathType:=Test path name:C476($_t_CatPicturePath)
				If ($_l_PathType=Is a folder:K24:2)
					//it should be!
					//CAT_l_MINLEVELS
					If (CAT_l_MINLEVELS>0)
						ARRAY TEXT:C222($_at_ExpectedSubFolderList; 0)
						ARRAY TEXT:C222($_at_ExpectedSubFolderList; CAT_l_MINLEVELS)
						For ($_l_Index; 1; CAT_l_MINLEVELS)
							If (Length:C16($2)>=$_l_Index)
								$_t_SubString:=Substring:C12($2; 1; $_l_Index)
								$_at_ExpectedSubFolderList{$_l_Index}:=$_t_SubString
							Else 
								ARRAY TEXT:C222($_at_ExpectedSubFolderList; $_l_Index-1)
								$_l_Index:=99999
							End if 
							
						End for 
						For ($_l_Index; 1; Size of array:C274($_at_ExpectedSubFolderList))
							$_l_PathType:=Test path name:C476($_t_CatPicturePath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index})
							If (Not:C34($_l_PathType=Is a folder:K24:2))
								//this subfolder does not exist, create it
								CREATE FOLDER:C475($_t_CatPicturePath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index})
							End if 
							$_t_CatPicturePath:=$_t_CatPicturePath+Folder separator:K24:12+$_at_ExpectedSubFolderList{$_l_Index}
							
						End for 
						//we now have the starting point built
						$_bo_OK:=False:C215
						$_l_SubLevel:=1
						If (CAT_l_MAXLEVELS<CAT_l_MINLEVELS)
							CAT_l_MAXLEVELS:=CAT_l_MINLEVELS
						End if 
						
						Repeat 
							ARRAY TEXT:C222($_at_Documents; 0)
							DOCUMENT LIST:C474($_t_CatPicturePath; $_at_Documents)
							If (Size of array:C274($_at_Documents)>=CAT_l_MaxFolderSize)
								If ($_l_SubLevel+CAT_l_MINLEVELS<CAT_l_MINLEVELS)
									//there are too many items in the folder
									$_l_SubStringLength:=CAT_l_MINLEVELS+$_l_SubLevel
									If (Length:C16($4)>=$_l_SubStringLength)
										$_t_SubString:=Substring:C12($4; 1; $_l_SubStringLength)
										$_l_PathType:=Test path name:C476($_t_CatPicturePath+Folder separator:K24:12+$_t_SubString)
										If (Not:C34($_l_PathType=Is a folder:K24:2))
											//this subfolder does not exist, create it
											CREATE FOLDER:C475($_t_CatPicturePath+Folder separator:K24:12+$_t_SubString)
										End if 
										$_t_CatPicturePath:=$_t_CatPicturePath+Folder separator:K24:12+$_t_SubString
									Else 
										//well it cant go deeper because there are no chars left
										$_bo_OK:=True:C214
									End if 
								Else 
									$_bo_OK:=True:C214
									
								End if 
							Else 
								$_bo_OK:=True:C214
								//has to go here anyway
							End if 
							
						Until ($_bo_OK)
						
						
						
						
					End if 
					
				End if 
				//```end here
				$_t_DocumentName:=$2
				If ($4="")
					$_t_FileTypeExtension:=""
					If (Length:C16($_t_DocumentName)>4)
						If ($_t_DocumentName[[(Length:C16($_t_DocumentName)-3)]]=".")
							$_t_FileTypeExtension:=Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-2; Length:C16($_t_DocumentName))
						Else 
							If ($_t_DocumentName[[(Length:C16($_t_DocumentName)-4)]]=".")
								$_t_FileTypeExtension:=Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-3; Length:C16($_t_DocumentName))
							End if 
						End if 
						
					End if 
				Else 
					$_t_FileTypeExtension:=$4
				End if 
				
				$_bo_OK:=False:C215
				If ($_t_FileTypeExtension="")  //this should NEVER be now
					If (DS_S3_FileExtension#"")
						$_t_DocumentName:=$2+"."+DS_S3_FileExtension
						$_bo_OK:=True:C214
					Else 
						//If (DS_S4_MacFileType#"")
						//$_bo_OK:=True
						//E//nd if 
					End if 
				Else 
					$_bo_OK:=True:C214
				End if 
				
				
				//
				
				If (Test path name:C476($_t_CatPicturePath)=Is a folder:K24:2)  //to be safe
					ARRAY TEXT:C222($_at_Documents; 0)
					DOCUMENT LIST:C474($_t_CatPicturePath; $_at_Documents)
					If (Size of array:C274($_at_Documents)<CAT_l_MaxFolderSize)
						//we can put the file in this folder
						EXPAND BLOB:C535([DATA_AUDITS:102]DATA:6)
						$_ti_DocumentRef:=DB_CreateDocument($_t_CatPicturePath+Folder separator:K24:12+$_t_DocumentName)
						CLOSE DOCUMENT:C267($_ti_DocumentRef)
						BLOB TO DOCUMENT:C526(document; [DATA_AUDITS:102]DATA:6)
						//If (DS_S4_MacFileType#"")
						//_O_SET DOCUMENT TYPE($_t_CatPicturePath+Folder separator+$_t_DocumentName;DS_S4_MacFileType)
						//End if 
					Else 
						
						//
						$_l_Length:=1
						$_t_CatPicturePath:=$_t_CatPicturePath
						//Just a little note even at 5 chars and 50 items
						//per folder this gives a max of
						//(26*26*26*26*26)*50 or
						//594,068,800 which should be plenty pics for the time being!
						Repeat 
							If (Length:C16($_t_DocumentName)>=$_l_Length)
								$_t_SubString:=Substring:C12($_t_DocumentName; 1; $_l_Length)
								If (Not:C34(Test path name:C476($_t_CatPicturePath+Folder separator:K24:12+$_t_SubString)=Is a folder:K24:2))
									//Base folder does not exist
									CREATE FOLDER:C475($_t_CatPicturePath+Folder separator:K24:12+$_t_SubString)
								End if 
								$_t_CatPicturePath:=$_t_CatPicturePath+Folder separator:K24:12+$_t_SubString
								ARRAY TEXT:C222($_at_Documents; 0)
								DOCUMENT LIST:C474($_t_CatPicturePath; $_at_Documents)
								If (Size of array:C274($_at_Documents)<CAT_l_MaxFolderSize)
									//File can go here
									
									
									EXPAND BLOB:C535([DATA_AUDITS:102]DATA:6)
									$_ti_DocumentRef:=DB_CreateDocument($_t_CatPicturePath+Folder separator:K24:12+$_t_DocumentName)
									CLOSE DOCUMENT:C267($_ti_DocumentRef)
									BLOB TO DOCUMENT:C526(document; [DATA_AUDITS:102]DATA:6)
									//If (DS_S4_MacFileType#"")
									//_O_SET DOCUMENT TYPE($_t_CatPicturePath+Folder separator+$_t_DocumentName;DS_S4_MacFileType)
									//End if 
									
									$_bo_Exit:=True:C214
								Else 
									$_l_Length:=$_l_Length+1
								End if 
								
							Else 
								//Put it here
								If (Not:C34(Test path name:C476($_t_CatPicturePath)=Is a folder:K24:2))
									//Base folder does not exist
									CREATE FOLDER:C475($_t_CatPicturePath)
								End if 
								EXPAND BLOB:C535([DATA_AUDITS:102]DATA:6)
								$_ti_DocumentRef:=DB_CreateDocument($_t_CatPicturePath+Folder separator:K24:12+$_t_DocumentName)
								CLOSE DOCUMENT:C267($_ti_DocumentRef)
								BLOB TO DOCUMENT:C526(document; [DATA_AUDITS:102]DATA:6)
								//If (DS_S4_MacFileType#"")
								//_O_SET DOCUMENT TYPE($_t_CatPicturePath+Folder separator+$_t_DocumentName;DS_S4_MacFileType)
								//End if 
								$_bo_Exit:=True:C214
								
							End if 
							
						Until ($_bo_Exit)
						
					End if 
					//now delete the record
					DB_DeletionControl(->[DATA_AUDITS:102])
					
					DELETE RECORD:C58([DATA_AUDITS:102])
					
				End if 
				
			End if 
			
			
		End if 
		
		
	End if 
End if 
<>DS_l_PictureReceiverProcess:=0
ERR_MethodTrackerReturn("DS_Picturestoserver"; $_t_oldMethodName)