//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_FileErrorTranslate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $ERR_bo_KnownFileError)
	C_LONGINT:C283($1; $ERR_l_ErrorNumber)
	C_POINTER:C301($2; $ERR_P_ErrorText)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_FileErrorTranslate")

//PDF995_FileErrorTranslate

//Added kmw, 30/10/08 v631b120d
//Identical to FileErrorTranslate...realised that without its own copy of this I had accidentally coupled PDF995 component to Daybook


$ERR_l_ErrorNumber:=$1
$ERR_P_ErrorText:=$2
//
$ERR_bo_KnownFileError:=True:C214


Case of 
	: ($ERR_l_ErrorNumber=-33)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"File directory full. You cannot create new files on disk."
	: ($ERR_l_ErrorNumber=-34)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Disk is full. There is no more room available on the disk."
	: ($ERR_l_ErrorNumber=-35)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Specified volume doesn’t exist."
	: ($ERR_l_ErrorNumber=-36)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"I/O error. There is probably a bad block on the disk."
	: ($ERR_l_ErrorNumber=-37)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Bad filename or volume name."
	: ($ERR_l_ErrorNumber=-38)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to read or write to a file that is not open."
	: ($ERR_l_ErrorNumber=-39)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Logical end-of-file reached during read operation."
	: ($ERR_l_ErrorNumber=-40)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Attempt to position before start of file."
	: ($ERR_l_ErrorNumber=-41)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Not enough memory to open a new file on the disk."
	: ($ERR_l_ErrorNumber=-42)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Too many files open at the same time."
	: ($ERR_l_ErrorNumber=-43)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"File not found."
	: ($ERR_l_ErrorNumber=-44)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Volume is locked by a hardware setting."
	: ($ERR_l_ErrorNumber=-45)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"File is locked."
	: ($ERR_l_ErrorNumber=-46)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Volume is locked by an application."
	: ($ERR_l_ErrorNumber=-47)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"The file is already open."
	: ($ERR_l_ErrorNumber=-48)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to rename a file with the name of an already deleted file."
	: ($ERR_l_ErrorNumber=-49)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to open a file already open with write permission."
	: ($ERR_l_ErrorNumber=-51)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to access a document with an invalid document reference number."
	: ($ERR_l_ErrorNumber=-52)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Internal file manager error (position of file marker is lost)."
	: ($ERR_l_ErrorNumber=-53)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Volume not on line."
	: ($ERR_l_ErrorNumber=-54)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Attempt to open locked file for writing."
	: ($ERR_l_ErrorNumber=-57)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to work with a non-Macintosh disk."
	: ($ERR_l_ErrorNumber=-58)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Error in the external file system."
	: ($ERR_l_ErrorNumber=-60)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Bad master directory block. Your disk is damaged."
	: ($ERR_l_ErrorNumber=-61)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Read/write permission doesn’t allow writing."
	: ($ERR_l_ErrorNumber=-64) | ($ERR_l_ErrorNumber=-84)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"There is a hardware problem with the disk (bad installation, incorrect "+"formatting ...)"
	: ($ERR_l_ErrorNumber=-120)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to access a file by using a pathname that specifies a non existing "+"directory."
	: ($ERR_l_ErrorNumber=-121)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"An access path could not be created."
	: ($ERR_l_ErrorNumber=-124)
		$ERR_P_ErrorText->:=$ERR_P_ErrorText->+"Tried to access a disconnected shared volume."
		
	Else 
		$ERR_bo_KnownFileError:=False:C215
End case 


$0:=$ERR_bo_KnownFileError
ERR_MethodTrackerReturn("PDF995_FileErrorTranslate"; $_t_oldMethodName)