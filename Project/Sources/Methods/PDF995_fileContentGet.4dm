//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_fileContentGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($_ptr_DocumentContext; $2)
	C_TEXT:C284($_t_DocumentContents; $_t_DocumentPath; $_t_oldMethodName; $1)
	C_TIME:C306($_ti_DocReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_fileContentGet")

If (Count parameters:C259>0)
	$_t_DocumentPath:=$1
Else 
	$_t_DocumentPath:=DOCUMENT
End if 
//
If (Count parameters:C259>1)
	$_ptr_DocumentContext:=$2
Else 
	$_ptr_DocumentContext:=$_ptr_DocumentContext
End if 

$_t_DocumentContents:=""
$0:=False:C215

Case of 
	: (Is nil pointer:C315($_ptr_DocumentContext))
		
	: (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
		
	Else 
		$_ti_DocReference:=DB_OpenDocument($_t_DocumentPath)
		If (OK=1)
			RECEIVE PACKET:C104($_ti_DocReference; $_t_DocumentContents; Get document size:C479(DOCUMENT))
			$_ptr_DocumentContext->:=$_t_DocumentContents
			$0:=True:C214
		End if 
		CLOSE DOCUMENT:C267($_ti_DocReference)
End case 

ERR_MethodTrackerReturn("PDF995_fileContentGet"; $_t_oldMethodName)
