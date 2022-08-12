//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_LoadPicturesToArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(DS_apic_Pictures;0)
	ARRAY TEXT:C222($_at_DocPaths; 0)
	ARRAY TEXT:C222($_at_FolderList; 0)
	ARRAY TEXT:C222($_at_ValidPicTypeNames; 0)
	ARRAY TEXT:C222($_at_ValidPicTypes; 0)
	ARRAY TEXT:C222($_at_Volumes; 0)
	//ARRAY TEXT(DS_at_DocumentPaths;0)
	C_BLOB:C604(DS_blb_PicBlob)
	C_BOOLEAN:C305($_bo_LoadALL; $_bo_LoadSubdirectories; DS_bo_LoadAll; DS_bo_LoadSudirectories)
	C_LONGINT:C283($_l_Index; $_l_PictureCount; $_l_PicTypeRow; DS_l_PictureCount)
	C_POINTER:C301($2; $3)
	C_REAL:C285($_l_ImageWidth; $_r_Ratio; $0)
	C_TEXT:C284($_t_DocName; $_t_DocType; $_t_FolderPath; $_t_oldMethodName; $_t_SubPath; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_LoadPicturesToArray")
//NG This method will load pictures(thumbnails of) into an array
ARRAY TEXT:C222($_at_ValidPicTypes; 0)
ARRAY TEXT:C222($_at_Volumes; 0)
VOLUME LIST:C471($_at_Volumes)
ARRAY TEXT:C222($_at_ValidPicTypeNames; 0)
//_O_PICTURE TYPE LIST($_at_ValidPicTypes;$_at_ValidPicTypeNames)
PICTURE CODEC LIST:C992($_at_ValidPicTypes)

//Folder separator:=DB_DirSymbol


//$2=pointer to picture array
//$3=picture to (S255) string array
//$2=load subdirectories
//$3=load all pictures(if greater then 255)
//$4=Number of pictures so far
//$5=Element of array to write to
$_bo_LoadSubdirectories:=DS_bo_LoadSudirectories
$_bo_LoadALL:=DS_bo_LoadAll
$_l_PictureCount:=DS_l_PictureCount
$_t_FolderPath:=$1
If (Count parameters:C259>=3)
	If ($_t_FolderPath#"")
		If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
			$_t_FolderPath:=Substring:C12($_t_FolderPath; 1; Length:C16($_t_FolderPath)-1)
		End if 
		If (Find in array:C230($_at_Volumes; $_t_FolderPath)>0)
			
			$_t_FolderPath:=$_t_FolderPath+Folder separator:K24:12
		End if 
		
		DOCUMENT LIST:C474($_t_FolderPath; $_at_DocPaths)
		
		For ($_l_Index; 1; Size of array:C274($_at_DocPaths))
			//here we only want the ones that are pictures
			$_t_DocName:=$_at_DocPaths{$_l_Index}
			$_t_DocType:=""
			If (Length:C16($_t_DocName)>4)
				If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
					$_t_DocType:=_o_Document type:C528($_t_FolderPath+$_t_DocName)
				Else 
					$_t_DocType:=_o_Document type:C528($_t_FolderPath+Folder separator:K24:12+$_t_DocName)
				End if 
				
			Else 
				If (Is macOS:C1572) & (False:C215)  //this is no longer needed  April 2020
					If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
						$_t_DocType:=_o_Document type:C528($_t_FolderPath+$_t_DocName)
					Else 
						$_t_DocType:=_o_Document type:C528($_t_FolderPath+Folder separator:K24:12+$_t_DocName)
					End if 
				End if 
				
			End if 
			If ($_t_DocType#"")
				If (Character code:C91($_t_DocType[[1]])=0)
					$_t_DocType:=""
				End if 
			End if 
			
			If ($_t_DocType="")
				If (Length:C16($_t_DocName)>4)
					If ($_t_DocName[[(Length:C16($_t_DocName)-3)]]=".")
						$_t_DocType:=Substring:C12($_t_DocName; Length:C16($_t_DocName)-2; Length:C16($_t_DocName))
					Else 
						If ($_t_DocName[[(Length:C16($_t_DocName)-4)]]=".")
							$_t_DocType:=Substring:C12($_t_DocName; Length:C16($_t_DocName)-3; Length:C16($_t_DocName))
						End if 
					End if 
					
					If ($_t_DocType#"")
						If (Is macOS:C1572) & (False:C215)  //APril 2020 this is no longer needed
							
							Case of 
								: ($_t_DocType="JPG")
									$_t_DocType:="JPEG"
								: ($_t_DocType="TiF") | ($_t_DocType="TiFf")
									$_t_DocType:="TIFF"
								: ($_t_DocType="Gif")
									$_t_DocType:="GiFf"
							End case 
						End if 
						
					End if 
				End if 
			End if 
			
			
			If ($_t_DocType#"")
				$_l_PicTypeRow:=Find in array:C230($_at_ValidPicTypes; "."+$_t_DocType)
				If ($_l_PicTypeRow>0)
					$_l_PictureCount:=$_l_PictureCount+1
					
					SET BLOB SIZE:C606(DS_blb_PicBlob; 0)
					If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
						DOCUMENT TO BLOB:C525($_t_FolderPath+$_at_DocPaths{$_l_Index}; DS_blb_PicBlob)
					Else 
						DOCUMENT TO BLOB:C525($_t_FolderPath+Folder separator:K24:12+$_at_DocPaths{$_l_Index}; DS_blb_PicBlob)
					End if 
					
					If (Size of array:C274($2->)<$_l_PictureCount)
						INSERT IN ARRAY:C227($2->; Size of array:C274($2->)+1; 255)
						INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; 255)
					End if 
					
					BLOB TO PICTURE:C682(DS_blb_PicBlob; $2->{$_l_PictureCount})
					PICTURE PROPERTIES:C457($2->{$_l_PictureCount}; $_l_ImageWidth; $_l_ImageWidth)
					$_r_Ratio:=$_l_ImageWidth/72
					CREATE THUMBNAIL:C679($2->{$_l_PictureCount}; $2->{$_l_PictureCount}; $_l_ImageWidth/$_r_Ratio; 72)
					If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
						$3->{$_l_PictureCount}:=$_t_FolderPath+$_at_DocPaths{$_l_Index}
					Else 
						$3->{$_l_PictureCount}:=$_t_FolderPath+Folder separator:K24:12+$_at_DocPaths{$_l_Index}
					End if 
					
				End if 
				
			End if 
			If ($_l_PictureCount=255) & (Size of array:C274($_at_DocPaths)>255)
				//We only ask this once!@!!!
				Gen_Confirm("There are more than 255 Pictures to load,"+" Do you wish to load all of them"; "No"; "Yes")
				If (ok=1)
					$_l_Index:=Size of array:C274($_at_DocPaths)
				Else 
					$_bo_LoadALL:=True:C214
					If (Find in array:C230($_at_Volumes; $_t_FolderPath)>0)
						ARRAY TEXT:C222($_at_FolderList; 0)
						FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
					Else 
						If ($_t_FolderPath[[1]]=Folder separator:K24:12)
							$_t_SubPath:=Substring:C12($_t_FolderPath; 1; Length:C16($_t_FolderPath)-1)
							ARRAY TEXT:C222($_at_FolderList; 0)
							FOLDER LIST:C473($_t_SubPath; $_at_FolderList)
						Else 
							ARRAY TEXT:C222($_at_FolderList; 0)
							FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
						End if 
						
						
					End if 
					
					If (Size of array:C274($_at_FolderList)>0)
						If (Not:C34($_bo_LoadSubdirectories))
							Gen_Confirm("Load From Subdirectories too?"; "Yes"; "No")
							If (OK=1)
								$_bo_LoadSubdirectories:=True:C214
							End if 
						End if 
					End if 
					
				End if 
			Else 
				If ($_l_Index=Size of array:C274($_at_DocPaths)) & (Not:C34($_bo_LoadSubdirectories))
					If (Find in array:C230($_at_Volumes; $_t_FolderPath)>0)
						ARRAY TEXT:C222($_at_FolderList; 0)
						FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
					Else 
						If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
							$_t_SubPath:=Substring:C12($_t_FolderPath; 1; Length:C16($_t_FolderPath)-1)
							ARRAY TEXT:C222($_at_FolderList; 0)
							FOLDER LIST:C473($_t_SubPath; $_at_FolderList)
						Else 
							ARRAY TEXT:C222($_at_FolderList; 0)
							FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
						End if 
						
						
					End if 
					
					If (Size of array:C274($_at_FolderList)>0)
						If (Not:C34($_bo_LoadSubdirectories))
							Gen_Confirm("Load From Subdirectories too?"; "Yes"; "No")
							If (OK=1)
								$_bo_LoadSubdirectories:=True:C214
							End if 
						End if 
						
					End if 
					
				End if 
			End if 
			
		End for 
		If ($_bo_LoadSubdirectories)
			ARRAY TEXT:C222($_at_Volumes; 0)
			VOLUME LIST:C471($_at_Volumes)
			If (Find in array:C230($_at_Volumes; $_t_FolderPath)>0)
				ARRAY TEXT:C222($_at_FolderList; 0)
				FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
			Else 
				If ($_t_FolderPath[[1]]=Folder separator:K24:12)
					$_t_SubPath:=Substring:C12($_t_FolderPath; 1; Length:C16($_t_FolderPath)-1)
					ARRAY TEXT:C222($_at_FolderList; 0)
					FOLDER LIST:C473($_t_SubPath; $_at_FolderList)
				Else 
					ARRAY TEXT:C222($_at_FolderList; 0)
					FOLDER LIST:C473($_t_FolderPath; $_at_FolderList)
				End if 
				
				
			End if 
			
			For ($_l_Index; 1; Size of array:C274($_at_FolderList))
				If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]=Folder separator:K24:12)
					$_t_SubPath:=$_t_FolderPath+$_at_FolderList{$_l_Index}
				Else 
					$_t_SubPath:=$_t_FolderPath+Folder separator:K24:12+$_at_FolderList{$_l_Index}
					
				End if 
				DS_bo_LoadSudirectories:=$_bo_LoadSubdirectories
				DS_bo_LoadAll:=$_bo_LoadALL
				DS_l_PictureCount:=$_l_PictureCount
				$_l_PictureCount:=DS_LoadPicturesToArray($_t_SubPath; $2; $3)
				
			End for 
			
		End if 
		DS_bo_LoadSudirectories:=$_bo_LoadSubdirectories
		DS_bo_LoadAll:=$_bo_LoadALL
		DS_l_PictureCount:=$_l_PictureCount
	End if 
	
	$0:=$_l_PictureCount
	
End if 
ERR_MethodTrackerReturn("DS_LoadPicturesToArray"; $_t_oldMethodName)