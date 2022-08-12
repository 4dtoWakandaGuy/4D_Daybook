//%attributes = {}

If (False:C215)
	//Project Method Name:      PictureOnServerToBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocList; 0)
	//ARRAY TEXT(EW_at_AllDocs;0)
	//ARRAY TEXT(EW_at_FolderPathName;0)
	//ARRAY TEXT(EW_at_PicPathShortNames;0)
	C_BLOB:C604(EW_PictureBLOB)
	C_BOOLEAN:C305(<>PictureChecked; yContinue; yInitialising)
	C_LONGINT:C283($_l_CharPosition; $_l_DocIndex; $_l_FoldersIndex)
	C_TEXT:C284($_t_oldMethodName; tPicName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PictureOnServerToBlob")

// PictureOnServerToBlob
// 08/10/03 pb
yInitialising:=True:C214
ARRAY TEXT:C222(EW_at_FolderPathName; 0)
$_t_oldMethodName:=ERR_MethodTracker("PictureOnServerToBlob")
//TRACE
//EW_at_FolderPathName:=$1
<>PictureChecked:=False:C215
yContinue:=True:C214
//TRACE
ARRAY TEXT:C222(EW_at_AllDocs; 0)
While (Size of array:C274(EW_at_FolderPathName)=0)  // it will be poked from the client method
	DelayTicks(30)
End while 

For ($_l_FoldersIndex; 1; Size of array:C274(EW_at_FolderPathName))
	If (EW_at_FolderPathName{$_l_FoldersIndex}#"")
		ARRAY TEXT:C222($_at_DocList; 0)
		DOCUMENT LIST:C474(EW_at_FolderPathName{$_l_FoldersIndex}; $_at_DocList)
		INSERT IN ARRAY:C227(EW_at_AllDocs; 1; Size of array:C274($_at_DocList))
		For ($_l_DocIndex; 1; Size of array:C274($_at_DocList))
			EW_at_AllDocs{$_l_DocIndex}:=EW_at_FolderPathName{$_l_FoldersIndex}+$_at_DocList{$_l_DocIndex}
		End for 
	End if 
End for 

ARRAY TEXT:C222(EW_at_PicPathShortNames; Size of array:C274(EW_at_AllDocs))
// we want to find out their short names (without file extension)
// for comparing with picture names
For ($_l_FoldersIndex; 1; Size of array:C274(EW_at_AllDocs))
	$_l_CharPosition:=Position:C15("."; EW_at_AllDocs{$_l_FoldersIndex})
	If ($_l_CharPosition>0)
		EW_at_PicPathShortNames{$_l_FoldersIndex}:=DocNameFromPath(Substring:C12(EW_at_AllDocs{$_l_FoldersIndex}; 1; $_l_CharPosition-1))
	Else 
		EW_at_PicPathShortNames{$_l_FoldersIndex}:=DocNameFromPath(EW_at_AllDocs{$_l_FoldersIndex})
	End if 
End for 

yInitialising:=False:C215

// now we will just sit and wait for requests ...
//TRACE
While (ycontinue) & (Not:C34(Process aborted:C672))
	IDLE:C311
	If (tPicName#"")
		SET BLOB SIZE:C606(EW_PictureBLOB; 0)
		If (Test path name:C476(tPicName)=Is a document:K24:1)
			DOCUMENT TO BLOB:C525(tPicName; EW_PictureBLOB)
		End if 
	End if 
	<>PictureChecked:=True:C214
	tPicName:=""
	DelayTicks(30)
End while 
SET BLOB SIZE:C606(EW_PictureBLOB; 0)
ERR_MethodTrackerReturn("PictureOnServerToBlob"; $_t_oldMethodName)
