//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_TestDocType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_ResourceData)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_CommaPosition; $_l_offset)
	C_TEXT:C284($_t_MacTypeName; $_t_oldMethodName; $_t_PCTypeName; $_t_ResourceItem; $_t_ResourceName; $_t_ResourceText; DS_S3_FileExtension; DS_S4_MacFileType)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_TestDocType")
//this method is not called-its premis is no longer valid it relates to when macs(Pre osx) had a resource fork in which the file type was stored a the recource fork of 4D had a map (File map) which stored the relevent match between file extensions on pc and file types on macs



SET BLOB SIZE:C606($_blb_ResourceData; 0)

GET RESOURCE:C508("FMAP"; 128; $_blb_ResourceData)
$_l_offset:=0
$_t_ResourceText:=BLOB to text:C555($_blb_ResourceData; 3; $_l_offset)
$_l_CommaPosition:=Position:C15(","; $_t_ResourceText)
If ($_l_CommaPosition>0)
	$_t_ResourceText:=Substring:C12($_t_ResourceText; $_l_CommaPosition+1; Length:C16($_t_ResourceText))
	Repeat 
		$_t_ResourceItem:=Substring:C12($_t_ResourceText; 1; 12)
		$_t_ResourceText:=Substring:C12($_t_ResourceText; 13; Length:C16($_t_ResourceText))
		$_t_ResourceName:=Substring:C12($_t_ResourceItem; 1; 4)
		$_t_MacTypeName:=Substring:C12($_t_ResourceItem; 5; 4)
		$_t_PCTypeName:=Substring:C12($_t_ResourceItem; 9; 4)
		$_bo_OK:=False:C215
		If (Length:C16($_t_ResourceText)>0)
			Repeat 
				If (Length:C16($_t_ResourceText)>0)
					If (Character code:C91($_t_ResourceText[[1]])=0)
						$_t_ResourceText:=Substring:C12($_t_ResourceText; 2; Length:C16($_t_ResourceText))
					Else 
						$_bo_OK:=True:C214
						
					End if 
				Else 
					$_bo_OK:=True:C214
				End if 
			Until ($_bo_OK)
		End if 
		
	Until (Length:C16($_t_ResourceText)<12)
End if 




If (False:C215)
	$_ti_DocumentRef:=DB_OpenDocument(""; "")
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
	
	//DS_GetFiletype (Document;->DS_S3_FileExtension;->DS_S4_MacFileType)
End if 
ERR_MethodTrackerReturn("DS_TestDocType"; $_t_oldMethodName)