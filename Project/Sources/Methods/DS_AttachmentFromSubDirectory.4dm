//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_AttachmentFromSubDirectory
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
	ARRAY TEXT:C222($_at_FolderList; 0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	//ARRAY TEXT(DS_at_ValidExtensions;0)
	//ARRAY TEXT(DS_at_ValidMacFiletypes;0)
	C_BLOB:C604(vEmail_Attachment_BLOB)
	C_BOOLEAN:C305($_bo_invisible; $_bo_LoadFileTypes; $_bo_LoadVars; $_bo_Locked; $_bo_OK; $_bo_Stop; $0; $3; $4; $5; DOC_bo_EmailGotAttachment)
	C_DATE:C307(Email_D_DoccreatedDate; Email_D_DocModifiedDate)
	C_LONGINT:C283($_l_CurrentRow; $_l_FolderIndex)
	C_TEXT:C284($_t_Extension; $_t_Filename; $_t_NewPathName; $_t_oldMethodName; $_t_SubPath; $1; $2; Email_Attachment_Extension; Email_Attachment_Type; Email_AttachmentPath)
	C_TIME:C306(Email_ti_DocCreatedtime; EMail_ti_DocModifiedTime)
End if 

//Code Starts Here





$_t_oldMethodName:=ERR_MethodTracker("DS_AttachmentFromSubDirectory")
//NG March 2004
//This method Called from DS_Attachmenttoblob and from itself
//Allows a recursive search into the subdirectories to find a document
//The path to  the directory to look in
//The document to search for
$0:=False:C215

//$4(Optional) is false if the picture type vars are alread loaded
//$5(optional) is true if we are reading special folders(.app and .pkg)


//Folder separator:=DB_DirSymbol 

If (Count parameters:C259>=2)
	If (Count parameters:C259>=3)
		$_bo_LoadVars:=$3
	Else 
		$_bo_LoadVars:=True:C214
	End if 
	If (Test path name:C476($1)=Is a folder:K24:2)
		If (Length:C16($1)<255)  // NOTE THIS IMPORTANT LIMITATION!!!
			ARRAY TEXT:C222($_at_FolderList; 0)
			FOLDER LIST:C473($1; $_at_FolderList)
			
			$_t_Filename:=$2
			//`here check if $_t_Filename has an extension
			If (Count parameters:C259<4)
				$_bo_LoadFileTypes:=True:C214
			Else 
				$_bo_LoadFileTypes:=$4
			End if 
			If ($_bo_LoadFileTypes)
				ARRAY TEXT:C222(DS_at_ValidExtensions; 0)
				ARRAY TEXT:C222(DS_at_ValidMacFiletypes; 0)
				ARRAY TEXT:C222(DS_at_ValidExtensions; Size of array:C274(CAT_al_SupportedPicTypes))
				ARRAY TEXT:C222(DS_at_ValidMacFiletypes; Size of array:C274(CAT_al_SupportedPicTypes))
				$_l_CurrentRow:=0
				For ($_l_FolderIndex; 1; Size of array:C274(CAT_al_SupportedPicTypes))
					If (CAT_al_SupportedPicTypes{$_l_FolderIndex}=1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						DS_at_ValidExtensions{$_l_CurrentRow}:=CAT_at_PictureTypeExtensions{$_l_FolderIndex}
						DS_at_ValidMacFiletypes{$_l_CurrentRow}:=CAT_at_PictureMacTypes{$_l_FolderIndex}
					End if 
					
				End for 
				ARRAY TEXT:C222(DS_at_ValidExtensions; $_l_CurrentRow)
				ARRAY TEXT:C222(DS_at_ValidMacFiletypes; $_l_CurrentRow)
				
			End if 
			//``check whether $Filenname has an extension
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
			
			For ($_l_FolderIndex; 1; Size of array:C274($_at_FolderList))
				If ($1[[Length:C16($1)]]#Folder separator:K24:12)
					$_t_SubPath:=$1+Folder separator:K24:12+$_at_FolderList{$_l_FolderIndex}
				Else 
					$_t_SubPath:=$1+$_at_FolderList{$_l_FolderIndex}
				End if 
				$_t_NewPathName:=DS_CheckNameWithExtension($_t_SubPath+Folder separator:K24:12+$_t_Filename; $_t_Extension; ->DS_at_ValidExtensions)
				If (Test path name:C476($_t_NewPathName)=Is a document:K24:1)
					If ($_bo_LoadVars)
						DOCUMENT TO BLOB:C525($_t_NewPathName; vEmail_Attachment_BLOB)
					End if 
					If (OK=1)
						
						If ($_bo_LoadVars)
							DOC_bo_EmailGotAttachment:=True:C214
							//Email_Attachment_Creator:=_o_Document creator($_t_NewPathName)
							DS_GetFiletype($_t_NewPathName; ->Email_Attachment_Extension; ->Email_Attachment_Type)
							Email_AttachmentPath:=$_t_NewPathName
							GET DOCUMENT PROPERTIES:C477($_t_NewPathName; $_bo_Locked; $_bo_invisible; Email_D_DoccreatedDate; Email_ti_DocCreatedtime; Email_D_DocModifiedDate; EMail_ti_DocModifiedTime)
							
						Else 
							Email_AttachmentPath:=$_t_NewPathName
						End if 
						
						//this returns the whole name so that can be stored if you wish
						$_l_FolderIndex:=Size of array:C274($_at_FolderList)
						$0:=True:C214
					End if 
					
					
					
				Else 
					If (Test path name:C476($_t_SubPath)=Is a folder:K24:2)
						If (Position:C15(".app"; $_t_SubPath)>0) | (Position:C15(".rtfd"; $_t_SubPath)>0) | (Position:C15(".pkg"; $_t_SubPath)>0) & ((Is macOS:C1572))
							If (Count parameters:C259<5)
								$_bo_Stop:=False:C215  // we can stop the
							Else 
								$_bo_Stop:=$5  //this is so we can get the system to read into .pck or .app
							End if 
							//Comp_System
						Else 
							$_bo_Stop:=False:C215
						End if 
						If (Not:C34($_bo_Stop))
							If (Count parameters:C259<5)
								$_bo_OK:=DS_AttachmentFromSubDirectory($_t_SubPath; $_t_Filename; $_bo_LoadVars; False:C215)
							Else 
								$_bo_OK:=DS_AttachmentFromSubDirectory($_t_SubPath; $_t_Filename; $_bo_LoadVars; False:C215; $5)
							End if 
							
							If ($_bo_OK)
								$0:=True:C214
								$_l_FolderIndex:=Size of array:C274($_at_FolderList)
							End if 
						End if 
					End if 
					
				End if 
			End for 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("DS_AttachmentFromSubDirectory"; $_t_oldMethodName)