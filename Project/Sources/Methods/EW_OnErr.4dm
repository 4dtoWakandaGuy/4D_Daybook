//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_OnErr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; tErrorMsg)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_OnErr")
// EW_OnErr
// ON ERR CALL method for the Export Wizard
// This could also be used for importing data
// 14/09/02 pb

//TRACE
Case of 
	: (error=-33)
		tErrorMsg:=tErrorMsg+"File directory full. You cannot create new files on disk."
	: (error=-34)
		tErrorMsg:=tErrorMsg+"Disk is full. There is no more room available on the disk."
	: (error=-35)
		tErrorMsg:=tErrorMsg+"Specified volume doesn’t exist."
	: (error=-36)
		tErrorMsg:=tErrorMsg+"I/O error. There is probably a bad block on the disk."
	: (error=-37)
		tErrorMsg:=tErrorMsg+"Bad filename or volume name."
	: (error=-38)
		tErrorMsg:=tErrorMsg+"Tried to read or write to a file that is not open."
	: (error=-39)
		tErrorMsg:=tErrorMsg+"Logical end-of-file reached during read operation."
	: (error=-40)
		tErrorMsg:=tErrorMsg+"Attempt to position before start of file."
	: (error=-41)
		tErrorMsg:=tErrorMsg+"Not enough memory to open a new file on the disk."
	: (error=-42)
		tErrorMsg:=tErrorMsg+"Too many files open at the same time."
	: (error=-43)
		tErrorMsg:=tErrorMsg+"File not found."
	: (error=-44)
		tErrorMsg:=tErrorMsg+"Volume is locked by a hardware setting."
	: (error=-45)
		tErrorMsg:=tErrorMsg+"File is locked."
	: (error=-46)
		tErrorMsg:=tErrorMsg+"Volume is locked by an application."
	: (error=-47)
		tErrorMsg:=tErrorMsg+"The file is already open."
	: (error=-48)
		tErrorMsg:=tErrorMsg+"Tried to rename a file with the name of an already deleted file."
	: (error=-49)
		tErrorMsg:=tErrorMsg+"Tried to open a file already open with write permission."
	: (error=-51)
		tErrorMsg:=tErrorMsg+"Tried to access a document with an invalid document reference number."
	: (error=-52)
		tErrorMsg:=tErrorMsg+"Internal file manager error (position of file marker is lost)."
	: (error=-53)
		tErrorMsg:=tErrorMsg+"Volume not on line."
	: (error=-54)
		tErrorMsg:=tErrorMsg+"Attempt to open locked file for writing."
	: (error=-57)
		tErrorMsg:=tErrorMsg+"Tried to work with a non-Macintosh disk."
	: (error=-58)
		tErrorMsg:=tErrorMsg+"Error in the external file system."
	: (error=-60)
		tErrorMsg:=tErrorMsg+"Bad master directory block. Your disk is damaged."
	: (error=-61)
		tErrorMsg:=tErrorMsg+"Read/write permission doesn’t allow writing."
	: (error=-64) | (error=-84)
		tErrorMsg:=tErrorMsg+"There is a hardware problem with the disk (bad installation, incorrect "+"formatting ...)"
	: (error=-120)
		tErrorMsg:=tErrorMsg+"Tried to access a file by using a pathname that specifies a non existing "+"directory."
	: (error=-121)
		tErrorMsg:=tErrorMsg+"An access path could not be created."
	: (error=-124)
		tErrorMsg:=tErrorMsg+"Tried to access a disconnected shared volume."
		
	Else 
		tErrorMsg:=tErrorMsg+"Error No. "+String:C10(error)+" occurred."
End case 
tErrorMsg:=tErrorMsg+Char:C90(13)
ERR_MethodTrackerReturn("EW_OnErr"; $_t_oldMethodName)