//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_SendPicturetoDrive
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 16:11`Method: DS_SendPicturetoDrive
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Documents; 0)
	C_BOOLEAN:C305($_bo_AddExtension; $_bo_Exit; $_bo_OK; $_bo_UseFile; $_bo_UsePointer)
	C_LONGINT:C283(<>DS_l_PictureReceiverProcess; $_l_DataAuditID; $_l_Length; $2; CAT_l_MaxFolderSize)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_CatTPicturePath; Folder separator:K24:12; $_t_DocFileType; $_t_DocName; $_t_DocNameWithoutExtension; $_t_oldMethodName; $_t_OriginalDocumentName; $_t_OriginalDocumentType; $_t_Substring; $1; $3)
	C_TEXT:C284($Cat_T_PicturePath; Cat_T_PicturePath; DS_S3_FileExtension; DS_S4_MacFileType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_SendPicturetoDrive")
//this method will Move the graphic to the graphics folder
//if $2 is not passed or is blank then the generic settings
//will be used
//t

If (False:C215)
	//NG March 2004
	//This method will move a picture to the picture folder
	//Parameters
	//$1
	//This is the local path to the file  file
	//$2 is the catalogue to use the setting from
	//$3 is the file name
	//$4 i
	//Pointer to a variable holding the graphic
	
End if 
If (Count parameters:C259>=1)
	$_bo_UsePointer:=False:C215
	$_bo_UseFile:=False:C215
	$_bo_Exit:=False:C215
	If ($1="")
		$_bo_UsePointer:=True:C214
		If (Count parameters:C259>=3)
			If (Is nil pointer:C315($4))
				$_bo_Exit:=True:C214
			End if 
			
		Else 
			$_bo_Exit:=True:C214
		End if 
	Else 
		$_bo_UseFile:=True:C214
	End if 
	
	If (Not:C34($_bo_Exit))
		If (Application type:C494=4D Remote mode:K5:5)
			//if(NOT($LocalCach))
			//move it to the server
			If ($_bo_UseFile)
				//Get the Document into a blob.
				//Get the server to pick it up.
				CREATE RECORD:C68([DATA_AUDITS:102])
				[DATA_AUDITS:102]TABLE_NUMBER:2:=-4
				[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
				$_t_DocName:=$3
				//`
				If (Length:C16($_t_DocName)>4)
					If ($_t_DocName[[(Length:C16($_t_DocName)-3)]]=".") | ($_bo_AddExtension=False:C215)  //NG April 2020 This should always be the case
						//name has an extension
						$_t_DocNameWithoutExtension:=Substring:C12($_t_DocName; 1; Length:C16($_t_DocName)-4)
						$_t_DocFileType:=Substring:C12($_t_DocName; (Length:C16($_t_DocName)-2); Length:C16($_t_DocName))
					Else 
						//NG this would be an ERROR....
						$_t_DocNameWithoutExtension:=$_t_DocName
						$_t_DocFileType:=""
					End if 
				Else 
					//NG this would be an ERROR....
					$_t_DocNameWithoutExtension:=$_t_DocName
					$_t_DocFileType:=""
					
				End if 
				$_t_DocNameWithoutExtension:=DS_ResolvedPictureName($_t_DocNameWithoutExtension)
				If ($_t_DocFileType#"")
					$_t_DocName:=$_t_DocNameWithoutExtension+"."+$_t_DocFileType
				Else 
					//this would be an error
					$_t_DocName:=$_t_DocNameWithoutExtension
				End if 
				
				//``
				[DATA_AUDITS:102]DOCUMENT_NAME:5:=$_t_DocName
				[DATA_AUDITS:102]X_ID:1:=AA_GetNextIDinMethod(->[DATA_AUDITS:102]X_ID:1)
				
				DOCUMENT TO BLOB:C525($1; [DATA_AUDITS:102]DATA:6)
				COMPRESS BLOB:C534([DATA_AUDITS:102]DATA:6; 1)
				DB_SaveRecord(->[DATA_AUDITS:102])
				AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
				$_l_DataAuditID:=[DATA_AUDITS:102]X_ID:1
				Repeat 
					GET PROCESS VARIABLE:C371(-1; <>DS_l_PictureReceiverProcess; <>DS_l_PictureReceiverProcess)
					If (<>DS_l_PictureReceiverProcess#0)
						DelayTicks(2)
					End if 
				Until (<>DS_l_PictureReceiverProcess=0)
				While (Semaphore:C143("PictureReceive"))
					DelayTicks(2)
				End while 
				//NG April 2020 -this is no longer relevent.
				//DS_GetFiletype ($1;->DS_S3_FileExtension;->DS_S4_MacFileType)
				If (Application type:C494=4D Remote mode:K5:5)
					<>DS_l_PictureReceiverProcess:=Execute on server:C373("DS_Picturestoserver"; 256000; "Send Picture to server"; $2; $3; $_l_DataAuditID; $_t_DocFileType)  //;DS_S4_MacFileType)
					
				Else 
					<>DS_l_PictureReceiverProcess:=New process:C317("DS_Picturestoserver"; 256000; "Send Picture to server"; $2; $3; $_l_DataAuditID; $_t_DocFileType)  //;DS_S4_MacFileType)
					
				End if 
				CLEAR SEMAPHORE:C144("PictureReceive")
			Else 
				//Get the variable into a blob.
				
				
			End if 
			
		Else 
			
			//Folder separator:=DB_DirSymbol 
			
			//If we are passed pointer we have to make a document
			If ($2>0)
				If ([CATALOGUE:108]x_ID:1#$2)
					QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=$2)
				End if 
				$Cat_T_PicturePath:=[CATALOGUE:108]Image_Path:4
				//NG April 2020 this is no longer relevant
				//DS_GetFiletype ($1;->DS_S3_FileExtension;->DS_S4_MacFileType)
			Else 
				CAT_LoadPrefs
				//As we are here it must be set
				//CAT_T_PicturePath is the path
				$Cat_T_PicturePath:=Cat_T_PicturePath
				//NG April 2020 this is no longer relevant
				
				//DS_GetFiletype ($1;->DS_S3_FileExtension;->DS_S4_MacFileType)
				
				
			End if 
			If ($Cat_T_PicturePath#"")
				$_t_OriginalDocumentName:=$3
				$_t_OriginalDocumentType:=""
				If (Length:C16($_t_OriginalDocumentName)>4)
					If ($_t_OriginalDocumentName[[(Length:C16($_t_OriginalDocumentName)-3)]]=".")
						$_t_OriginalDocumentType:=Substring:C12($_t_OriginalDocumentName; Length:C16($_t_OriginalDocumentName)-2; Length:C16($_t_OriginalDocumentName))
					Else 
						If ($_t_OriginalDocumentName[[(Length:C16($_t_OriginalDocumentName)-4)]]=".")
							$_t_OriginalDocumentType:=Substring:C12($_t_OriginalDocumentName; Length:C16($_t_OriginalDocumentName)-3; Length:C16($_t_OriginalDocumentName))
						End if 
					End if 
					
				End if 
				$_bo_OK:=False:C215
				If ($_t_OriginalDocumentType="")  //NG APril 2020 this cannot be now
					If ($_t_OriginalDocumentType#"")
						$_t_OriginalDocumentName:=$3+"."+$_t_OriginalDocumentType
						$_bo_OK:=True:C214
					Else 
						If (DS_S4_MacFileType#"")
							$_bo_OK:=True:C214
						End if 
					End if 
				Else 
					$_bo_OK:=True:C214
				End if 
				
				
				If (Not:C34(Test path name:C476($Cat_T_PicturePath)=Is a folder:K24:2))
					//Base folder does not exist
					CREATE FOLDER:C475($Cat_T_PicturePath)
				End if 
				
				
				If (Test path name:C476($Cat_T_PicturePath)=Is a folder:K24:2)  //to be safe
					ARRAY TEXT:C222($_at_Documents; 0)
					DOCUMENT LIST:C474($Cat_T_PicturePath; $_at_Documents)
					If (Size of array:C274($_at_Documents)<CAT_l_MaxFolderSize)
						//we can put the file in this folder
						COPY DOCUMENT:C541($1; $Cat_T_PicturePath+$_t_OriginalDocumentName)
						//If (DS_S4_MacFileType#"")
						//SET DOCUMENT TYPE($Cat_T_PicturePath+Folder separator+$_t_OriginalDocumentName;DS_S4_MacFileType)
						//End if 
					End if 
					
				Else 
					
					//
					$_l_Length:=1
					$_t_CatTPicturePath:=$Cat_T_PicturePath
					//Just a little note even at 5 chars and 50 items
					//per folder this gives a max of
					//(26*26*26*26*26)*50 or
					//594,068,800 which should be plenty pics for the time being!
					Repeat 
						If (Length:C16($_t_OriginalDocumentName)>=$_l_Length)
							$_t_Substring:=Substring:C12($_t_OriginalDocumentName; 1; $_l_Length)
							If (Not:C34(Test path name:C476($_t_CatTPicturePath+Folder separator:K24:12+$_t_Substring)=Is a folder:K24:2))
								//Base folder does not exist
								CREATE FOLDER:C475($_t_CatTPicturePath+Folder separator:K24:12+$_t_Substring)
							End if 
							$_t_CatTPicturePath:=$_t_CatTPicturePath+Folder separator:K24:12+$_t_Substring
							ARRAY TEXT:C222($_at_Documents; 0)
							DOCUMENT LIST:C474($_t_CatTPicturePath; $_at_Documents)
							If (Size of array:C274($_at_Documents)<CAT_l_MaxFolderSize)
								//File can go here
								
								COPY DOCUMENT:C541($1; $_t_CatTPicturePath+$_t_OriginalDocumentName)
								//If (DS_S4_MacFileType#"")
								//_O_SET DOCUMENT TYPE($_t_CatTPicturePath+$_t_OriginalDocumentName;DS_S4_MacFileType)
								//End if 
								$_bo_Exit:=True:C214
							Else 
								$_l_Length:=$_l_Length+1
							End if 
							
						Else 
							//Put it here
							If (Not:C34(Test path name:C476($_t_CatTPicturePath)=Is a folder:K24:2))
								//Base folder does not exist
								CREATE FOLDER:C475($_t_CatTPicturePath)
							End if 
							COPY DOCUMENT:C541($1; $_t_CatTPicturePath+$_t_OriginalDocumentName)
							///If (DS_S4_MacFileType#"")
							//_O_SET DOCUMENT TYPE($_t_CatTPicturePath+$_t_OriginalDocumentName;DS_S4_MacFileType)
							//End if 
							$_bo_Exit:=True:C214
							
						End if 
						
					Until ($_bo_Exit)
					
				End if 
				
			End if 
			
		End if 
		
	End if   //end i
	
	
End if 
ERR_MethodTrackerReturn("DS_SendPicturetoDrive"; $_t_oldMethodName)