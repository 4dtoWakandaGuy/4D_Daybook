If (False:C215)
	//object Name: [USER]User_In.Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	ARRAY TEXT:C222($_at_Documents; 0)
	ARRAY TEXT:C222($_at_SubDirectories; 0)
	//ARRAY TEXT(CAT_at_PictureTypeExtensions;0)
	C_LONGINT:C283($_l_Index; $_l_PictureTypeRow)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentType; $_t_oldMethodName; $_t_PicturesDirectory; CAT_t_PicturePath)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]User_In.Button3"; Form event code:C388)

ARRAY TEXT:C222($_at_SubDirectories; 0)
ARRAY TEXT:C222($_at_Documents; 0)

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button3"; Form event code:C388)
If (CAT_t_PicturePath#"")
	If (Test path name:C476(CAT_t_PicturePath)=Is a folder:K24:2)
		$_t_PicturesDirectory:=DB_SelectFolder("Select the directory to move pictures from")
		If (Test path name:C476($_t_PicturesDirectory)=Is a folder:K24:2)
			Repeat 
				DOCUMENT LIST:C474($_t_PicturesDirectory; $_at_Documents)
				For ($_l_Index; 1; Size of array:C274($_at_Documents))
					$_t_DocumentName:=DocNameFromPath($_at_Documents{$_l_Index})
					$_t_DocumentType:=DocTypeFromName($_t_DocumentName)
					$_l_PictureTypeRow:=Find in array:C230(CAT_at_PictureTypeExtensions; $_t_DocumentType)
					If ($_l_PictureTypeRow>0)
						If (CAT_al_SupportedPicTypes{$_l_PictureTypeRow}=1)
							MOVE DOCUMENT:C540($_t_PicturesDirectory+$_at_Documents{$_l_Index}; CAT_t_PicturePath+$_t_DocumentName)
						End if 
					End if 
					
					
				End for 
				
				FOLDER LIST:C473($_t_PicturesDirectory; $_at_SubDirectories)
			Until (Size of array:C274($_at_SubDirectories)=0)
			
		End if 
	Else 
		Gen_Alert("The path name "+CAT_t_PicturePath+"does not appear to be valid. Please make sure you are connected to the volume")
	End if 
	
Else 
	Gen_Alert("The image path to fill is not defined. You must set this first")
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button3"; $_t_oldMethodName)
